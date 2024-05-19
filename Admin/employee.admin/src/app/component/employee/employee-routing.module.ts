import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { AddEmployeeComponent } from './add-employee/add-employee.component';

// define routes
const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'employee'
  },
  {
    path: 'employee',
    component: EmployeeComponent
  },
  {
    path: 'addEmployee',
    component: AddEmployeeComponent
  },
  {
    path: 'editEmployee/:id',
    component: AddEmployeeComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeRoutingModule { }
