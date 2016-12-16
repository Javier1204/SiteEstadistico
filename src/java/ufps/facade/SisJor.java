    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ufps.facade;

import ufps.dto.*;
import ufps.negocio.*;

/**
 *
 * @author jeffersson sinza
 */
public class SisJor {
    private static final SistemaJornadaDeportiva sisjor= new SistemaJornadaDeportiva();

/**
 * metodo que registra  un administrador 
 * @param admin el administrador  que  se desea registrar
 * @return  confirmacion del registro
 */
public String registrarAdministrador(AdministradorDTO admin){
  return  sisjor.registrarAdministrador(admin);
}
/**
 * metodo que  lista todos los administradores registrados
 * @return  tabla html  con los administradores registrados
 */
public String  listadoAdministradores(){
    return sisjor.listadoAdministradores();
}
/**
 * metodo que registra  capitan 
 * @param capitan capitan que desea registrar
 * @return  confirmacion de registro
 */
public String registrarCapitan(CapitanDTO capitan){
    return sisjor.registrarCapitan(capitan);
}
/**
 * metodo que busca un administrador
 * @param administrador  administrador que se desea buscar
 * @return confirmacion de la busqueda
 */
public String buscarAdministrador(AdministradorDTO administrador){
    return sisjor.buscarAdministrador(administrador);
}
/**
 * metodo  que actualiza   los datos  de un administrador
 * @param administrador administrador que se desea  actualizar
 * @return  confirmacion de la actualizacion
 */
public String actualizarAdministrador(AdministradorDTO administrador){
    return sisjor.ActualizarAdministrador(administrador);
}
/**
 * metodo  que elimina  un  administrador
 * @param administrador administrador que se desea eliminar
 * @return  confirmacion de eliminacion
 */
public String eliminarAdministrador(AdministradorDTO administrador){
   return sisjor.eliminarAdministrador(administrador);  
}
/**
 * metodo que permite listar los capitanes registrados
 * @return  tabla html con capitanes registrados  
 */
public String listadoCapitanes(){
    return sisjor.listadoCapitanes();
}
/**
 * metodo que permite actualizar la informacion un capitan
 * @param capitan  capitan que se desea  actualizar
 * @return confirmacion de la actualizacion
 */
public String actualizarCapitan(CapitanDTO capitan){
    return sisjor.actualizarCapitan(capitan);
}
/**
 * metodo que eliminar un capitan
 * @param capitan capitan que se desea eliminar
 * @return  confirmacion de la eliminacion
 */
public String eliminarCapitan(CapitanDTO capitan){
    return sisjor.eliminarCapitan(capitan);
}
/**
 * metodo que permite buscar un capitan 
 * @param capitan capitan que desea buscar
 * @return  confirmacion de  busqueda
 */
public String buscarCapitan(CapitanDTO capitan){
    return sisjor.buscarCapitan(capitan);
}

public String registrarJornadaDeportiva(Jornada_DeportivaDTO jornada){
    return sisjor.registrarJornadaDeportiva(jornada);
}

public String finalizarJornadaDeportiva(){
     return sisjor.finalizarJornadaDeportiva();
}

public String registrarFechasDeportivas(String[] fechas){
   return  sisjor.registrarFechasDeportivas(fechas);
}


public String registrarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina){
    return sisjor.registrarDisciplinaDeportiva(disciplina);
}
public String listadoDisciplinaDeportiva(){
    return sisjor.listadoDisciplinaDeportiva();
}
public String ActualizarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina){
      return sisjor.ActualizarDisciplinaDeportiva(disciplina);
}
public String  buscarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina){
    return sisjor.buscarDisciplinaDeportiva(disciplina);
}
public  String eliminarDisciplinaDeportiva(Disciplina_DeportivaDTO  disciplina){
    return sisjor.eliminarDisciplinaDeportiva( disciplina);
}
public String downlistDisciplina(){
      return sisjor.downlistDisciplina();
}

public String registrarArbitro(ArbitroDTO arbitro){
    return sisjor.registrarArbitro(arbitro);
}
public String listadoArbitros(){
    return sisjor.listadoArbitros();
}

public String eliminarArbitro(ArbitroDTO arbitro){
    return sisjor.eliminarArbitro(arbitro);
    
}

public String registrarEquipo(EquipoDTO equipo){
    return sisjor.registrarEquipo(equipo);
}

public String registrarIntegrante(IntegranteDTO integrante){
    return sisjor.registrarIntegrante(integrante);
}
public String verificarEquipo(CapitanDTO capitan){
    return sisjor.buscarEquipoCapitan(capitan);
}

public String  validarAdministrador(AdministradorDTO administrador){
    return sisjor.validarAdministrador(administrador);
}

public String validarCapitan (CapitanDTO capitan){
    return  sisjor.ValidarCapitan(capitan);
}

public String jornadadeportivaAnteriores(){
    return sisjor.jornadadeportivaAnteriores();
}

public String listadoPoidon(Jornada_DeportivaDTO jorn){
    return sisjor.listadoPoidon(jorn);
}


public String  listadoIntegranteJornadaAnteriores(Jornada_DeportivaDTO jor){
return sisjor.listadoIntegranteJornadaAnteriores(jor);
        }


public String downlistFecha(){
    return sisjor.downlistFecha();
}

public String downlistEquipoVisitante(){
    return sisjor.downlistEquipoVisitante();
}

public String downlistEquipoLocal(){
    return sisjor.downlistEquipoLocal();
}

public String  registrarEncuentro(Encuentro_DeportivoDTO encuentro){
    return sisjor.registrarEncuentroDeportivo(encuentro);
}

public String  listadoEncuentroGeneral(){
    return sisjor.listadoEncuentros();
}


public String eliminarEncuentro(Encuentro_DeportivoDTO encuentro){
    return sisjor.eliminarEncuentro(encuentro);
}

public String listadoEncuentroFecha(Encuentro_DeportivoDTO encuentro){
    return sisjor.listadoEncuentroFecha(encuentro);
}

public String buscarEncuentro(Encuentro_DeportivoDTO encuentro){
    return sisjor.buscarEncuentro(encuentro);
}

public String actualizarEncuentro(Encuentro_DeportivoDTO encuentro){
    return sisjor.actualizarEncuentro(encuentro);
}

public String listadoIntegrantesEquipo(EquipoDTO equipo){
    return sisjor.listadoIntegrante(equipo);
}
public String buscarEquipoCapitan(CapitanDTO capitan){
    return sisjor.buscarEquipoCapitan(capitan);
}

public static  void  main(String[] args){
    Disciplina_DeportivaDTO discip= new Disciplina_DeportivaDTO();
       Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
      fecha.setId_fecha(1);
       discip.setId_disciplina(5);
       Encuentro_DeportivoDTO encuentro= new Encuentro_DeportivoDTO();
       encuentro.setId_encuentro(5);
       encuentro.setMarcador_local(2);
       encuentro.setMarcador_visitante(3);
     System.err.println(new SisJor().actualizarEncuentro(encuentro));
}

public String eliminarIntegrante(IntegranteDTO integrante){
    return sisjor.eliminarIntegrante(integrante);
}
}