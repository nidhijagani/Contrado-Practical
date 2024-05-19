import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { Employee } from 'src/app/model/employee.model';
import { EmployeeService } from 'src/app/services/employee/employee.service';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  employeeList: Employee[] = [];
  pageNumber: number = 1;
  pageSize: number = 10;
  dataSource = new MatTableDataSource<Employee>();
  displayedColumns = ['EmpTagNumber', 'FirstName', 'LastName', 'EmailAddress', 'Department', 'Age', 'Designation', 'Action'];
  totalEmployees: number = 0;
  sortBy: string = 'desc';
  orderBy: string = 'EmpTagNumber';
  pageIndex: number = 0;
  searchValue: string = '';

  constructor(private employeeService: EmployeeService, private router: Router) { }

  ngOnInit(): void {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  ngAfterViewInit() {
    this.paginator.pageIndex = 0;
    this.paginator.pageSize = this.pageSize;
    this.sort.active = 'EmpTagNumber';
    this.sort.direction = 'desc';
    this.dataSource.sort = this.sort;
    this.getEmployeeList(this.paginator.pageIndex);
  }
  // get Employee List
  getEmployeeList(pageIndex: number) {
    var pagination = {
      pageNumber: pageIndex + 1,
      pageSize: this.pageSize,
      orderBy: this.orderBy,
      sortBy: this.sortBy,
      searchValue: this.searchValue
    }
    this.employeeService.getEmployeeList(pagination).subscribe((response: any) => {
      if (response.success && response.data) {
        this.employeeList = response.data;
        this.dataSource.data = this.employeeList;
        if(this.employeeList.length > 0){
        this.totalEmployees = Number(this.employeeList[0].totalRecords);
      }
        else{
          this.totalEmployees = 0;
        }
      }
    });
  }
  // called on page change
  onPageChange(event: PageEvent) {
    this.pageIndex = event.pageIndex;
    this.pageSize = event.pageSize;
    this.getEmployeeList(this.pageIndex);
  }

  // called on add employee click event
  addNewEmployee() {
    this.router.navigate(['/addEmployee']);
  }
  // called on edit employee click event
  editEmployee(employeeId: number) {
    this.router.navigate(['/editEmployee/' + employeeId]);
  }

  // called on delete employee click event
  deleteEmployee(employeeId: number) {
    var employeeDetail = {
      EmployeeId: employeeId
    }
    this.employeeService.deleteEmployee(employeeDetail).subscribe((response: any) => {
      if (response.success) {
        // Calculate total number of pages
        let totalPages = Math.ceil(this.totalEmployees / this.pageSize);
        // Check if current page is the last page
        let isLastPage = this.paginator.pageIndex === totalPages - 1;
        if (isLastPage && this.dataSource.data.length == 1) {
          this.paginator.pageIndex = 0;
        }
        this.getEmployeeList(this.paginator.pageIndex);
      }
      // this.userList = response;
    });
  }
  onSearch() {
    this.paginator.pageIndex = 0;
    this.getEmployeeList(this.paginator.pageIndex);
  }

  onSort(event: Sort) {
    this.orderBy = event.active;
    this.sortBy = event.direction;
    this.getEmployeeList(this.paginator.pageIndex);
  }
}
