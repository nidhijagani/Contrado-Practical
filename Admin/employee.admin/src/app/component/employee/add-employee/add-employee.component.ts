import { Component, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Employee } from 'src/app/model/employee.model';
import { EmployeeService } from 'src/app/services/employee/employee.service';
import { ToastrService } from 'ngx-toastr';
import { CommomnService } from 'src/app/services/common/commomn.service';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.css']
})
export class AddEmployeeComponent {
  employeeDetail: any = new Employee();
  departmentList: any = [];
  designationList: any = [];

  employeeFormGroup = new FormGroup({
    empTagNumber: new FormControl('', Validators.required),
    firstName: new FormControl('', Validators.required),
    lastName: new FormControl('', Validators.required),
    department: new FormControl('', Validators.required),
    designation: new FormControl('', Validators.required),
    emailAddress: new FormControl('', [Validators.required, Validators.email]),
    birthDate: new FormControl('', Validators.required),
  })
  employeeId: number = 0;
  header_employee: string = 'Add Employee';
  constructor(private toastr: ToastrService, private router: Router,
    private activatedRoute: ActivatedRoute, private employeeService: EmployeeService, private commonService: CommomnService) { }

  ngOnInit(): void {

    this.employeeId = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    this.getDepartmentList();
    if (this.employeeId > 0) {
      this.getEmployeeDetailsByEmployeeId();
    }
  }

  // get department list
  getDepartmentList() {
    this.commonService.getDepartmentList().subscribe((response: any) => {
      if (response.success && response.data) {
        this.departmentList = response.data;
      }
    });
  }

  // get designation list based on departmentId
  getDesignationList(departmentId: any, isChange: boolean) {
    if (isChange) {
      this.employeeFormGroup.controls.designation.patchValue(null);
      this.employeeFormGroup.controls.designation.updateValueAndValidity({ onlySelf: true, emitEvent: false });
    }
    this.commonService.getDesignationList(departmentId).subscribe((response: any) => {
      if (response.success && response.data) {
        this.designationList = response.data;

      }
    });
  }

  // get employee details based on employee id
  getEmployeeDetailsByEmployeeId() {
    this.employeeService.getEmployeeDetailsByEmployeeId(this.employeeId).subscribe((response: any) => {
      if (response.success && response.data) {
        this.employeeDetail = response.data;
        this.header_employee = 'Edit Employee ( ' + this.employeeDetail.firstName + ' ' + this.employeeDetail.lastName + ' )'
        this.getDesignationList(this.employeeDetail.departmentId, false);

      }
    });
  }

  // called on save click
  saveEmployee() {
    // used for validation
    if (this.employeeFormGroup.valid) {
      this.employeeService.addUpdateEmployeeDetail(this.employeeDetail).subscribe((response: any) => {
        if (response.success) {
          this.toastr.success(response.message);
          // redirect on employee list page
          this.router.navigate(['/employee']);
        }
        else {
          this.toastr.error(response.message);
        }
      });
    } else {
      // Form is invalid, mark all fields as touched to display validation errors
      this.employeeFormGroup.markAllAsTouched();
    }
  }
  // redirect on employee list page
  cancelEmployee() {
    this.router.navigate(['/employee']);
  }
}
