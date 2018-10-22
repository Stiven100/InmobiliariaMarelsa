import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../../Modelo/Usuario';
import { Persona } from '../../../Modelo/Persona';
import { Rol } from '../../../Modelo/Rol';
import { RolService } from '../../../Servicios/rolServ.service';
import { PersonaService } from '../../../Servicios/personaServ.service';
import { UsuarioService } from '../../../Servicios/usuarioServ.service';
import { NgForm } from '@angular/forms';
import { GenericoService } from '../../../Servicios/genericoServ.service';

@Component({
  selector: 'app-gestionar-administradores',
  templateUrl: './gestionar-administradores.component.html',
  styleUrls: ['./gestionar-administradores.component.css']
})
export class GestionarAdministradoresComponent implements OnInit {

  // Listado de personas
  personas: Array<Persona> = [];
  // Rol: Administradores (1)
  rol: Rol = new Rol();

  // Usuario que vamos a registrar
  usuario: Usuario = new Usuario;
  // La persona asignada al usuario que vamos a registrar
  persona: Persona = new Persona();

  // Variables para los mensajes en la pagina
  show: number;
  msj: string;

  constructor(private genericoServicio: GenericoService, private personaServicio: PersonaService,
    private usuarioServicio: UsuarioService) { }

  ngOnInit() {
    // Asignamos el rol administrador con id 1
    this.rol.id = 1;
    // Asignamos el rol a la persona
    this.persona.rol = this.rol;
    // Validamos si el usuario tiene acceso a la pagina
    this.usuarioServicio.esAccesible('administracion/gestionar-administradores');
    // Actualizamos la tabla de administradores
    this.listar();
  }

  /**
   * Registra un administrador con su usuario
   */
  registrar(form: NgForm) {
    this.rol.id = this.persona.rol.id;
    this.persona.rol = this.rol;
    this.usuario.persona = this.persona;
    this.personaServicio.registrar(this.usuario).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha registrado correctamente';
        this.show = 2;
        window.alert(this.msj);
        // limpiamos los campos
        form.reset();
        // Actualizamos la lista de administradores
        this.listar();
        return true;
      } else {
        this.msj = rta.data;
        this.show = 1;
        window.alert(rta.data);
        return false;
      }
    });
  }

  /**
   * Edita un administrador con su usuario
   */
  editar(form: NgForm) {
    this.rol.id = this.persona.rol.id;
    this.persona.rol = this.rol;
    this.usuario.persona = this.persona;
    if (this.usuario.persona.cedula != null && this.persona.cedula != null) {
      this.usuario.persona.cedula = this.persona.cedula;
      this.personaServicio.editar(this.usuario).subscribe(rta => {
        if (rta.data === 'exito') {
          this.msj = 'Se ha editado correctamente';
          this.show = 2;
          window.alert(this.msj);
          // limpiamos los campos
          form.reset();
          // Actualizamos la lista de administradores
          this.listar();
          return true;
        } else {
          this.msj = rta.data;
          this.show = 1;
          window.alert(rta.data);
          return false;
        }
      });
    } else {
      this.msj = 'Primero busque el administrador que va a editar';
      this.show = 1;
      window.alert(this.msj);
    }
  }

  /**
   * Buscar empleado
   */
  buscar() {
    this.personaServicio.personaByCedulaRol(this.persona).subscribe(rta => {
      if (rta.data == null) {
        this.show = 1;
        this.msj = 'No existe un administrador con cedula ' + this.persona.cedula;
        return false;
      } else {
        this.show = 3;
        this.persona = rta.data;
        this.persona.rol = this.rol;
        this.persona.fecha_nacimiento = this.genericoServicio.formatoFecha(this.persona.fecha_nacimiento);
        // Buscamos el usuario asociado con el administrador
        this.personaServicio.usuarioByPersona(this.persona).subscribe(rta2 => {
          this.usuario = rta2.data;
          return true;
        });
      }
    });
  }

  /**
   * Ver la inormacion de un administrador de la tabla
   */
  ver(p: Persona) {
    this.persona.cedula = p.cedula;
    this.buscar();
  }
  /**
   * Buscar desde el formulario html
   */
  fbuscar(event) {
    event.preventDefault();
    if (this.persona.cedula != null) {
      this.buscar();
    }
  }

  /**
   * Lista todas los administradores registradas
   */
  listar() {
    // Obtenemos la lista de administradores
    this.personaServicio.listarPersonasByRol(this.rol).subscribe(rta => {
      this.personas = rta.data;
    });
  }

  /**
   * Eliminar administrador con su usuario de la base de datos
   */
  eliminar(p: Persona) {
    this.genericoServicio.eliminar('personas', { 'id': p.id }).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha eliminado el cliente correctamente';
        this.show = 2;
        this.listar();
        return true;
      } else {
        this.msj = 'No se ha podido eliminar el cliente: ' + rta.data;
        this.show = 1;
      }
      window.alert(this.msj);
    });
  }
}
