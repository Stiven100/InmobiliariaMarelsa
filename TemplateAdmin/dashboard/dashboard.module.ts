import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardComponent } from './dashboard/dashboard.component';
import {LayoutModule} from '../layout/layout.module';
import { EmpleadoComponent } from './dashboard/empleado/empleado.component';
import { ClienteComponent } from './dashboard/cliente/cliente.component';
import { InmuebleComponent } from './dashboard/inmueble/inmueble.component';

@NgModule({
  imports: [
    CommonModule,
    DashboardRoutingModule,
    LayoutModule
  ],
  declarations: [DashboardComponent, EmpleadoComponent, ClienteComponent, InmuebleComponent]
})
export class DashboardModule { }
