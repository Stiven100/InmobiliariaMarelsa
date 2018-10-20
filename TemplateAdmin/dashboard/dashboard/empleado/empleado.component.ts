import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Empleado } from '../../../models/empleadoModel';
import { TipoEmpleado } from '../../../models/tipoEmpleadoModel';
import { EmpleadoService } from '../../../servicios/empleadoService';

@Component({
  selector: 'app-empleado',
  templateUrl: './empleado.component.html',
  styleUrls: ['./empleado.component.scss']
})
export class EmpleadoComponent implements OnInit {

  //Lista de empleados
  empleados: Array<Empleado> = [];

  //Lista de tipo de empleados
  tiposEmpleados: Array<TipoEmpleado> = [];

  //El empleado
  empleado: Empleado = new Empleado();

  //TipoEmpleado
  tipoEmpleado: TipoEmpleado = new TipoEmpleado();

  msj: string;
  show: number;

  constructor(private empleadoService: EmpleadoService) { }

  ngOnInit() {


    this.listar();
  }

  /**
   * Registra un empleado
   */
  registrar(form: NgForm) {
    this.empleadoService.registrar(this.empleado).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha registrado correctamente';
        this.show = 2;
        window.alert(this.msj);
        // limpiamos los campos
        form.reset();
        // Actualizamos la lista de clientes
        this.listar();
      } else {
        this.msj = rta.data;
        this.show = 1;
        window.alert(rta.data);
      }
    });
  }

  /**
   * Edita un empleado
   */
  editar(form: NgForm) {
    this.empleadoService.editar(this.empleado).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha editado correctamente';
        this.show = 2;
        window.alert(this.msj);
        // limpiamos los campos
        form.reset();
        // Actualizamos la lista de clientes
        this.listar();
      } else {
        this.msj = rta.data;
        this.show = 1;
        window.alert(rta.data);
      }
    });
  }

  /**
   * Buscar empleado
   */
  buscar() {
    this.empleadoService.empleadoByCedula(this.empleado).subscribe(rta => {
      if (rta.data == null) {
        this.show = 1;
        this.msj = 'No existe un empleado con esta cedula ' + this.empleado.cedula;
      } else {
        this.show = 3;
        this.empleado = rta.data;
      }
    });
  }

  /**
   * Lista todas los empleados registradas
   */
  listar() {
    // Obtenemos la lista de empleado
    this.empleadoService.listar().subscribe(rta => {
      this.empleado = rta.data;
    });
  }

  /**
   * Buscar desde el formulario html
   */
  fbuscar(event) {
    event.preventDefault();
    if (this.empleado.cedula != null) {
      this.buscar();
    }
  }

  



}
