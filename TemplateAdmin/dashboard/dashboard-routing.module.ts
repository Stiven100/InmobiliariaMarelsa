import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {DashboardComponent} from './dashboard/dashboard.component';
import {EmpleadoComponent} from './dashboard/empleado/empleado.component';

const routes: Routes = [
    {path: 'Dashboard', 
    component: DashboardComponent,
    children: [
        {path: 'Empleado', 
        component: EmpleadoComponent }
    ]
    }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
