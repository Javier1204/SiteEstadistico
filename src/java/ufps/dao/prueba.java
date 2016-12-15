/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ufps.dao;
import ufps.dto.*;
/**
 *
 * @author jeffersson sinza
 */
public class prueba {
 
  public static void main(String []args){
      Jornada_DeportivaDTO jor= new Jornada_DeportivaDTO();
      jor.setTemporada(1);
      AdministradorDTO admin= new AdministradorDTO();
      admin.setCorreo_electronico("jeffersson_8@hotmail.com");
      admin.setNombre_administrador("mario");
      admin.setContrasena("psieiew");
      Disciplina_DeportivaDTO disci=new  Disciplina_DeportivaDTO ();
      disci.setId_disciplina(2);
      disci.setJornada_deportiva(jor);
      CapitanDTO capi = new CapitanDTO();
      capi.setCodigo_capitan(123);
      capi.setContrasena("feo");
      capi.setCorreo_electronico("feo");
      capi.setNombre_capitan("feo");
      ArbitroDTO arb= new  ArbitroDTO();
      Disciplina_DeportivaDTO dis=new Disciplina_DeportivaDTO();
      arb.setNombre_arbitro("sinza");
      arb.setDocumento(12039443);
      arb.setDisciplina_deportiva(disci);
      dis.setId_disciplina(1);
      arb.setDisciplina_deportiva(disci);
      Encuentro_DeportivoDTO encuentro= new Encuentro_DeportivoDTO();
      encuentro.setHora("12:04:00");
      EquipoDTO local=new EquipoDTO();
       EquipoDTO visitante=new EquipoDTO();
       Disciplina_DeportivaDTO discip= new Disciplina_DeportivaDTO();
       Fecha_DeportivaDTO fecha=new Fecha_DeportivaDTO();
      local.setId_equipo(1);
      fecha.setId_fecha(1);
       visitante.setId_equipo(2);
       discip.setId_disciplina(1);
      encuentro.setEquipo_local(local);
      encuentro.setEquipo_visitante(visitante);
      encuentro.setDisciplina(discip);
      encuentro.setFecha(fecha);
      encuentro.setId_encuentro(5);
         encuentro.setId_encuentro(5);
       encuentro.setMarcador_local(2);
       encuentro.setMarcador_visitante(3);
       AdministradorDTO admini= new AdministradorDTO();
       admini.setCorreo_electronico("jeffersson_8@hotmail.com");
       admini.setContrasena("sinza");
       CapitanDTO capiTAN = new CapitanDTO();
        capiTAN.setContrasena("sinza");
        capiTAN.setCorreo_electronico("jeffersson_8@hotmail.com");
 
     
      
         System.err.println( CapitanDAO.validarCapitan(capiTAN));
  }    
}
