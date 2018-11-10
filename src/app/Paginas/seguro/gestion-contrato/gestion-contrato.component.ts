import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../../Modelo/Usuario';
import { Persona } from '../../../Modelo/Persona';
import { Rol } from '../../../Modelo/Rol';
import { RolService } from '../../../Servicios/rolServ.service';
import { PersonaService } from '../../../Servicios/personaServ.service';
import { UsuarioService } from '../../../Servicios/usuarioServ.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-gestion-contrato',
  templateUrl: './gestion-contrato.component.html',
  styleUrls: ['./gestion-contrato.component.css']
})
export class GestionContratoComponent implements OnInit {

 // Listado de personas
 personas: Array<Persona> = [];
 // Rol: Cliente (2)
 rol: Rol = new Rol();

 // Usuario que vamos a registrar
 usuario: Usuario = new Usuario;
 // La persona asignada al usuario que vamos a registrar
 persona: Persona = new Persona();

 // Variables para los mensajes en la pagina
 show: number;
 msj: string;

  constructor(private rolServicio: RolService, private personaServicio: PersonaService, private usuarioServicio: UsuarioService) { }

  ngOnInit() {
       // Asignamos el rol cliente con id 2
       this.rol.id = 2;
       // Asignamos el rol a la persona
       this.persona.rol = this.rol;
       // Validamos si el usuario tiene acceso a la pagina
       this.usuarioServicio.esAccesible('administracion/gestionar-clientes');
       // Actualizamos la tabla de personas
    this.listar();
  }
 /**
   * Lista todas los empleados registradas
   */
  listar() {
    // Obtenemos la lista de empleado
    this.personaServicio.listarPersonasByRol(this.rol).subscribe(rta => {
      this.personas = rta.data;
    });
  }
}
