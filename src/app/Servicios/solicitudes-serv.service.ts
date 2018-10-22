import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class SolicitudesServService {



  domain = 'http://localhost:4300/';


  constructor(private http: HttpClient) { 


  }

  listar () {
    return this.http.get<any>(this.domain + 'solicitud/listar')
    .pipe(
        map(res => {
            return res;
        })
    );

  }


  
}



