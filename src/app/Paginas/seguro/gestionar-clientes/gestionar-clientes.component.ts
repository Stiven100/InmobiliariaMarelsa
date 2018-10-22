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
  selector: 'app-gestionar-clientes',
  templateUrl: './gestionar-clientes.component.html',
  styleUrls: ['./gestionar-clientes.component.css']
})
export class GestionarClientesComponent implements OnInit {

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

  verInmueble = false;
  selectedVer = false;
  locationSelecE = false;
  locationSelecR = false;
  selectedReg = false;
  selecterTodos = true;

  zoom = 6;
  zoomMapaLista = 10;
  latSelectedLista = 0;
  longSelectedLista = 0;
  latSeleccion = 4.540130;
  longSeleccion = -75.665193;

  latSeleccionE = 4.540130;
  longSeleccionE = -75.665193;

  latSeleccionR = 4.540130;
  longSeleccionR = -75.665193;

  constructor(private genericoServicio: GenericoService, private personaServicio: PersonaService,
    private usuarioServicio: UsuarioService) { }

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

  verUnInmuebleEnMap(p: Persona) {
    this.verInmueble = true;
    this.latSelectedLista = p.latitud;
    this.longSelectedLista = p.longitud;

  }

  mostrarTodosInmueblesEnMap() {
    this.verInmueble = false;
  }

  mostrarTodosInmueblesEnMapR() {
    this.selectedReg = false;
    this.verInmueble = false;
    this.persona.nombre = null;
    this.persona.apellido = null;
    this.persona.cedula = null;
    this.persona.direccion = null;
    this.persona.fecha_nacimiento = null;
    this.persona.telefono = null;
    this.usuario.username = null;
    this.usuario.password = null;
    this.selecterTodos = true;
  }

  onChoseLocation(event) {
    this.latSeleccionE = event.coords.lat;
    this.longSeleccionE = event.coords.lng;
  }

  onChoseLocationR(event) {
    this.locationSelecR = true;
    this.latSeleccionR = event.coords.lat;
    this.longSeleccionR = event.coords.lng;
  }

  /**
   * Registra un cliente con su usuario
   */
  registrar(form: NgForm) {
    this.usuario.persona = this.persona;
    this.usuario.persona.latitud = this.latSeleccionR;
    this.usuario.persona.longitud = this.longSeleccionR;
    this.personaServicio.registrar(this.usuario).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha registrado correctamente';
        this.show = 2;
        window.alert(this.msj);
        this.limpiarCampos();
        // limpiamos los campos
        // form.reset();
        // Actualizamos la lista de clientes
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
   * Edita un cliente con su usuario
   */
  editar(form: NgForm) {
    if (this.usuario.persona != null && this.persona != null) {
      this.usuario.persona = this.persona;
      this.usuario.persona.latitud = this.latSeleccionE;
      this.usuario.persona.longitud = this.longSeleccionE;

      console.log('lat editar --- ' + this.usuario.persona.latitud + 'lat --- '  + this.latSeleccionE);
      console.log('long editar --- ' + this.usuario.persona.longitud + 'lat --- '  + this.longSeleccionE);
      this.personaServicio.editar(this.usuario).subscribe(rta => {
        if (rta.data === 'exito') {
          this.msj = 'Se ha editado correctamente';
          this.show = 2;
          this.limpiarCampos();
          window.alert(this.msj);
          // limpiamos los campos
          // form.reset();
          // Actualizamos la lista de clientes
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
      this.msj = 'Primero busque el cliente que va a editar';
      this.show = 1;
      window.alert(this.msj);
      return false;
    }
  }

  onChangeInputCed() {
    if (!this.selectedVer) {
      this.selecterTodos = false;
      this.selectedReg = true;
    }
  }

  /**
   * Buscar empleado
   */
  buscar() {
    this.personaServicio.personaByCedulaRol(this.persona).subscribe(rta => {
      if (rta.data == null) {
        this.show = 1;
        this.msj = 'No existe un cliente con cedula ' + this.persona.cedula;
        return false;
      } else {
        this.show = 3;
        this.persona = rta.data;
        this.persona.rol = this.rol;
        this.persona.fecha_nacimiento = this.genericoServicio.formatoFecha(this.persona.fecha_nacimiento);
        // Buscamos el usuario asociado con el cliente
        this.personaServicio.usuarioByPersona(this.persona).subscribe(rta2 => {
          this.usuario = rta2.data;
          return true;
        });
      }
    });
  }

  /**
   * Ver la inormacion de un empleado de la tabla
   */
  ver(p: Persona) {
    this.selecterTodos = false;
    this.selectedVer = true;
    this.verInmueble = false;
    this.latSeleccionE = p.latitud;
    this.longSeleccionE = p.longitud;
    this.persona.cedula = p.cedula;
    this.buscar();
  }
  /**
   * Buscar desde el formulario html
   */
  fbuscar(event) {
    event.preventDefault();
    if (this.persona.cedula != null) {
      this.selectedVer = true;
      this.buscar();
      return true;
    }
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

  /**
   * Eliminar cliente con su usuario de la base de datos
   */
  eliminar(p: Persona) {
    this.genericoServicio.eliminar('personas', {'id': p.id}).subscribe(rta => {
      if (rta.data === 'exito') {
        this.msj = 'Se ha eliminado el cliente correctamente';
        this.show = 2;
        this.limpiarCampos();
        this.listar();
      } else {
        this.msj = 'No se ha podido eliminar el cliente: ' + rta.data;
        this.show = 1;
      }
      window.alert(this.msj);
    });
  }

  limpiarCampos() {
    this.verInmueble = false;
    this.selectedReg = false;
    this.selectedVer = false;
    this.persona.nombre = null;
    this.persona.apellido = null;
    this.persona.cedula = null;
    this.persona.direccion = null;
    this.persona.fecha_nacimiento = null;
    this.persona.telefono = null;
    this.usuario.username = null;
    this.usuario.password = null;
    this.selecterTodos = true;
  }
}
