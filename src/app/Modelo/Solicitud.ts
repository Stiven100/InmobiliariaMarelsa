import { Inmueble } from "./Inmueble";
import { Usuario } from "./Usuario";
import { Persona } from "./Persona";

export class Solicitud{
id: number;
comentario: String;
inmueble:Inmueble;
persona:Persona;
}