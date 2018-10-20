import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule} from '@angular/forms';

import { EmpleadoRoutingModule } from './empleado-routing.module';

@NgModule({
  imports: [
    CommonModule,
    EmpleadoRoutingModule,
    FormsModule
  ],
  declarations: []
})
export class EmpleadoModule { }
