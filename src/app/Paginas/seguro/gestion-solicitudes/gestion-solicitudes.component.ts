import { Component, OnInit } from '@angular/core';
import { Solicitud } from 'src/app/Modelo/Solicitud';
import { Inmueble } from 'src/app/Modelo/Inmueble';
import { Usuario } from 'src/app/Modelo/Usuario';
import { GenericoService } from 'src/app/Servicios/genericoServ.service';
import { UsuarioService } from 'src/app/Servicios/usuarioServ.service';
import { Empleado } from 'src/app/Modelo/Empleado';
import { Persona } from 'src/app/Modelo/Persona';
import { PersonaService } from 'src/app/Servicios/personaServ.service';

@Component({
  selector: 'app-gestion-solicitudes',
  templateUrl: './gestion-solicitudes.component.html',
  styleUrls: ['./gestion-solicitudes.component.css']
})
export class GestionSolicitudesComponent implements OnInit {
 
  empleados:Array<Empleado>=[];
  solicitudes:Array<Solicitud>=[];
  inmueble:Inmueble=new Inmueble();
  persona:Persona = new Persona();
  usuario:Usuario=new Usuario();
  solicitud:Solicitud= new Solicitud();
  comentario:String;



  constructor(private genericoServicio: GenericoService,
    private personaService: PersonaService) { 

    }

  ngOnInit() {
    this.solicitud.persona=this.persona;
    this.solicitud.inmueble=this.inmueble;
    this.listar();
  }


  listar() {
    // Obtenemos la lista de solicitudes
    this.genericoServicio.listar('solicitud', null).subscribe(rta => {
    if ( rta.data != null ) {
      this.solicitudes = rta.data;
      // obtenemos el resto de informacion de la solicitud
      // tslint:disable-next-line:prefer-const
      for (let p of this.solicitudes) {
   
         
            // Obtenemos el inmueble
            this.genericoServicio.buscar('inmueble', {'id': p.inmueble}).subscribe(rta2 => {
              p.inmueble= rta2.data;

               // Obtenemos el usuario
         
            this.genericoServicio.buscar('personas',{'id':p.persona}).subscribe(rta1 => {
              p.persona = rta1.data;
              
            });
          
          });
      }
    }
    });
  }
}

