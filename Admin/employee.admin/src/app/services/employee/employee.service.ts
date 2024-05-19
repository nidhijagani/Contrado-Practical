import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'environments/environment';
import { Observable } from 'rxjs';
import { Employee } from '../../model/employee.model';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  apiUrl = environment.BaseApi;

  constructor(private http: HttpClient) { }

  // get Employee list
  getEmployeeList(paginationModel : any): Observable<Employee[]> {
    return this.http.post<Employee[]>(`${this.apiUrl}/api/EmployeeAPI/GetEmployeeList`, paginationModel);
  }

  // delete Employee
  deleteEmployee(employeeModel : any): Observable<any[]> {
    return this.http.post<any[]>(`${this.apiUrl}/api/EmployeeAPI/DeleteEmployee`,employeeModel);
  }

  // get Employee Details based on employeeId
  getEmployeeDetailsByEmployeeId(employeeId : number): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/api/EmployeeAPI/GetEmployeeDetailsByEmployeeId?employeeId=`+employeeId);
  }

  // add update employee details
  addUpdateEmployeeDetail(employeeModel : any): Observable<any[]> {
    return this.http.post<any[]>(`${this.apiUrl}/api/EmployeeAPI/AddUpdateEmployeeDetail`,employeeModel);
  }
}
