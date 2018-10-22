import { Component, OnInit } from '@angular/core';
import { Solicitud } from 'src/app/Modelo/Solicitud';
import { Inmueble } from 'src/app/Modelo/Inmueble';
import { Usuario } from 'src/app/Modelo/Usuario';
import { GenericoService } from 'src/app/Servicios/genericoServ.service';
import { UsuarioService } from 'src/app/Servicios/usuarioServ.service';
import { Empleado } from 'src/app/Modelo/Empleado';

@Component({
  selector: 'app-gestion-solicitudes',
  templateUrl: './gestion-solicitudes.component.html',
  styleUrls: ['./gestion-solicitudes.component.css']
})
export class GestionSolicitudesComponent implements OnInit {
 
  empleados:Array<Empleado>=[];
  solicitudes:Array<Solicitud>=[];
  inmueble:Inmueble=new Inmueble();
  empleado:Empleado = new Empleado();
  usuario:Usuario=new Usuario();

  comentario:String;



  constructor(private genericoServicio: GenericoService,
    private usuarioServicio: UsuarioService) { }

  ngOnInit() {
this.empleado.usuario=this.usuario;
    this.inmueble=this.inmueble;

  }

  listar() {
    // Obtenemos la lista de solicitudes
    this.genericoServicio.listar('solicitud', null).subscribe(rta => {
    if ( rta.data != null ) {
      this.solicitudes = rta.data;
      // obtenemos el resto de informacion de la solicitud
      // tslint:disable-next-line:prefer-const
      for (let e of this.solicitudes) {
        // obtenemos el comentario
        this.genericoServicio.buscar('cargos', {'comentario': e.comentario}).subscribe(rta2 => {
          e.comentario = rta2.data;
          // Obtenemos el usuario
          this.genericoServicio.buscar('usuarios', {'usuario': e.usuario}).subscribe(rta3 => {
            e.usuario = rta3.data;
            // Obtenemos el inmueble
            this.genericoServicio.buscar('inmueble', {'inmueble': e.inmueble}).subscribe(rta4 => {
              e.inmueble= rta4.data;
            });
          });
        });
      }
    }
    });
  }



  

}
