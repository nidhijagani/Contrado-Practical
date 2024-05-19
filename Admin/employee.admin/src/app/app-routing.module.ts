import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//lazy loading concept
const routes: Routes = [
  {
      path: '',
      loadChildren: () => import('./component/employee/employee.module').then(m => m.EmployeeModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
