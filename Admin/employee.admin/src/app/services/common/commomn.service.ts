import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CommomnService {

  apiUrl = environment.BaseApi;

  constructor(private http: HttpClient) { }

  getDepartmentList(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/api/DepartmentAPI/GetDepartmentList`);
  }

  getDesignationList(departmentId : number): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/api/DesignationAPI/GetDesignationList?departmentId=` + departmentId);
  }
}
