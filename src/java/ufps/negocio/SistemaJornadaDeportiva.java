/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.negocio;

import java.util.List;
import ufps.dao.*;
import ufps.dto.*;

/**
 *
 * @author jeffersson sinza
 */
public class SistemaJornadaDeportiva {

    /**
     * metodo registrar una administrador
     *
     * @param administrador informacion del administrador
     * @return
     */
    public String registrarAdministrador(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO admin = AdministradorDAO.BuscarAdministrador(administrador);
        if (admin == null) {
            boolean consulta = AdministradorDAO.agregarAdministrador(administrador);
            if (consulta) {
                msn = "Administrador  se ha registrado exitosamente";
            }
        } else {
            msn = " Administrador  ya se Encuentra registrado";
        }
        return msn;
    }
     public String registrarAdministrador1(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO admin = AdministradorDAO.BuscarAdministrador(administrador);
        if (admin == null) {
          return AdministradorDAO.agregarAdministrador1(administrador);
        } 
        return msn;
    }

    public String listadoAdministradores() {
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Administradores </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th>Nombres administrador</th>\n"
                + "                <th>correo electronico</th>\n"
                + "                <th> opciones </th>\n"
                + "            </tr> </thead>";
        List<AdministradorDTO> ListadoAdministrador = AdministradorDAO.ListadoAdministrador();
        int i = 0;
        tabla += "<body>";
        for (AdministradorDTO admin : ListadoAdministrador) {
            tabla += " <tr>\n"
                    + "                <td >" + admin.getNombre_administrador() + "</td>\n"
                    + "                <td id=\"" + i + "\">" +admin.getCorreo_electronico()+"</td>\n"
                    + "                <td> \n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarAdministrador(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\"  onclick=\"FormActualizarAdministrador(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-cog\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                </td>\n"
                    + "            </tr> ";
            i++;
        }
        tabla += "</body>";
        return tabla + "</table> </div></div>";
    }

    public String registrarCapitan(CapitanDTO capitan) {
        String msn = "";
        CapitanDTO capi = CapitanDAO.buscarCapitan(capitan);
        if (capi == null) {
            boolean consulta = CapitanDAO.agregarCapitan(capitan);
            if (consulta) {
                msn = "Capitan  se ha registrado exitosamente";
            }
        } else {
            msn = " Capitan  ya se Encuentra registrado";
        }
        return msn;
    }

    public String buscarAdministrador(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO admin = AdministradorDAO.BuscarAdministrador1(administrador);
        if (admin != null) {
            return msn = admin.getCorreo_electronico() + "," + admin.getContrasena() + "," + admin.getNombre_administrador();
        }
        return msn;
    }

    public String buscarCapitan(CapitanDTO capitan) {
        String msn = "";
        CapitanDTO capi = CapitanDAO.buscarCapitan(capitan);
        if (capi != null) {
            return msn = capi.getCodigo_capitan() + "," + capi.getCorreo_electronico() + "," + capi.getContrasena() + "," + capi.getNombre_capitan();
        }
        return msn;
    }

    public String ActualizarAdministrador(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO admin = AdministradorDAO.BuscarAdministrador1(administrador);
        if (admin != null) {
            boolean consulta = AdministradorDAO.editarAdministrador(administrador);
            if (consulta) {
                msn = "Administrador  se ha actualizado  exitosamente";
            }
        } else {
            msn = " Administrador  no puedo actualizar";
        }
        return msn;
    }

    public String eliminarAdministrador(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO admin = AdministradorDAO.BuscarAdministrador1(administrador);
        if (admin != null) {
            boolean consulta = AdministradorDAO.borrarAdministrador(administrador);
            if (consulta) {
                msn = "Administrador  se ha eliminado  exitosamente";
            }
        } else {
            msn = " Administrador  no puedo eliminar";
        }
        return msn;
    }

    public String listadoCapitanes() {
        String panel = "<div class='table-responsive' >"
                + "<div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Capitanes </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th>Codigo Capitan </th>\n"
                + "<th>Nombres  Capitan </th>\n"
                + "                <th>correo electronico</th>\n"
                + "                <th> opciones </th>\n"
                + "            </tr> </thead>";
        List<CapitanDTO> ListadoCapitanes = CapitanDAO.ListadoCapitanes();
        int i = 0;
        tabla += "<body>";
        for (CapitanDTO capi : ListadoCapitanes) {
            tabla += " <tr>\n"
                    + "                <td   id=\"" + i + "\" >" + capi.getCodigo_capitan() + "</td>\n"
                    + "                <td >" + capi.getNombre_capitan() + " </td>\n"
                    + "<td >" + capi.getCorreo_electronico() + " </td>\n"
                    + "                <td> \n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarCapitan(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\"  onclick=\"FormActualizarCapitan(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-cog\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                </td>\n"
                    + "            </tr> ";
            i++;
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String actualizarCapitan(CapitanDTO capitan) {
        String msn = "";
        System.err.println(capitan.getCodigo_capitan());
        CapitanDTO capi = CapitanDAO.buscarCapitan(capitan);
        if (capi != null) {
            boolean consulta = CapitanDAO.editarCapitan(capitan);
            if (consulta) {
                msn = "Capitan  se ha actualizado  exitosamente";
            }
        } else {
            msn = "Capitan  no puedo actualizar";
        }
        return msn;
    }

    public String eliminarCapitan(CapitanDTO capitan) {
        String msn = "";
        CapitanDTO capi = CapitanDAO.buscarCapitan(capitan);
        if (capi != null) {
            boolean consulta = CapitanDAO.borrarCapitan(capitan);
            if (consulta) {
                msn = "Capitan  se ha borrado  exitosamente";
            } else {
                msn = "Capitan  no puedo Borrar";
            }
        } else {
            msn = "Capitan  no se encontro";
        }
        return msn;
    }

    public String registrarJornadaDeportiva(Jornada_DeportivaDTO jornada) {
        String msn = "";
        Jornada_DeportivaDTO jorn;
        jorn = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jorn == null) {
            jorn = Jornada_DeportivaDAO.buscarJornada_Deportiva(jornada);
            if (jorn == null) {
                boolean consulta = Jornada_DeportivaDAO.insertarJornadaDeportiva(jornada);
                if (consulta) {
                    msn = "Jornada Deportiva   se ha registrado  exitosamente";
                } else {
                    msn = "Jornada deportiva no se puedo registrar";
                }
            } else {
                msn = " Jornada Deportiva ya Se Encuentra Registrada";
            }
        } else {
            msn = "hay jornada deportiva activa ";
        }
        return msn;
    }

    public String finalizarJornadaDeportiva() {
        String msn = " ";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            boolean consulta = Jornada_DeportivaDAO.FinalizarJornadaDeportiva(jor);
            if (consulta) {
                msn = "Jornada deportiva   se ha Finalizado";
            } else {
                msn = "Jornada deportiva  no se finalizar";
            }
        } else {
            msn = "No hay jornada deportiva activa por favor registre una jornada deportiva";
        }

        return msn;
    }

    public String registrarFechasDeportivas(String[] fechas) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            List<Fecha_DeportivaDTO> buscarFechaDeportiva = Fecha_DeportivaDAO.buscarFechaDeportiva(jor);
            if (buscarFechaDeportiva.size() == 0) {
                for (String fecha : fechas) {
                    Fecha_DeportivaDTO fec = new Fecha_DeportivaDTO();
                    fec.setFecha(fecha);
                    fec.setJornada(jor);
                    Fecha_DeportivaDAO.insertarFechaDeportiva(fec);
                    msn = "Fechas Deportivas  registrada Exitosamente";
                }

            } else {
                msn = " No se puede registrar mas fechas deportiva a la jornada";
            }
        } else {
            msn = "No hay jornada deportiva activa por favor registre una jornada deportiva";
        }
        return msn;
    }

    public String registrarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            disciplina.setJornada_deportiva(jor);
            Disciplina_DeportivaDTO disc = Disciplina_DeportivaDAO.buscarDisciplina(disciplina);
            if (disc == null) {
                boolean consulta = Disciplina_DeportivaDAO.agregarDisciplina(disciplina);
                if (consulta) {
                    msn = "Disciplina Deportiva   se ha registrado  exitosamente";
                } else {
                    msn = "disciplina deportiva no se puedo registrar";
                }
            } else {
                msn = "Disciplina Deportiva  ya se encuentra registrado";
            }

        } else {
            msn = "No hay jornada deportiva activa por favor registre una jornada deportiva";
        }
        return msn;
    }

    public String listadoDisciplinaDeportiva() {
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Disciplina Deportiva </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th>Id </th>\n"
                + "                <th>Nombre de Disciplina </th>\n"
                + "<th>Puntos </th>\n"
                + "<th>opciones </th>\n"
                + "            </tr> </thead>";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        List<Disciplina_DeportivaDTO> ListadoDisci = Disciplina_DeportivaDAO.listadoDisciplina(jor);
        int i = 0;
        tabla += "<body>";
        for (Disciplina_DeportivaDTO disci : ListadoDisci) {
            tabla += " <tr>\n"
                    + "                <td   id=\"" + i + "\" >" + disci.getId_disciplina() + "</td>\n"
                    + "                <td   >" + disci.getNombre_disciplina() + "</td>\n"
                    + "                <td >" + disci.getPuntos() + " </td>\n"
                    + "                <td> \n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarDisciplinaDeportiva(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\"  onclick=\"FormActualizarDisciplinaDeportiva(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-cog\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                </td>\n"
                    + "            </tr> ";
            i++;
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String ActualizarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            disciplina.setJornada_deportiva(jor);
            Disciplina_DeportivaDTO disci = Disciplina_DeportivaDAO.buscarDisciplina(disciplina);
            if (disci != null) {
                boolean consulta = Disciplina_DeportivaDAO.editarDisciplina(disciplina);
                if(consulta){
                msn = " Disciplina deportiva se ha actualizado exitosamente";
                } else{
                    msn="Disciplina  deportiva no se puedo actualizar";
                }
            } else {
                msn = "Disciplina no se puede encontro";
            }

        } else {
            msn = "No hay jornada deportiva Activa por favor registre una jornada";
        }
        return msn;
    }

    public String buscarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            disciplina.setJornada_deportiva(jor);
            Disciplina_DeportivaDTO disci = Disciplina_DeportivaDAO.buscarDisciplina(disciplina);
            if (disci != null) {
                msn = disci.getId_disciplina() + "," + disci.getNombre_disciplina() + "," + disci.getPuntos();
            }
        }
        return msn;
    }

    public String eliminarDisciplinaDeportiva(Disciplina_DeportivaDTO disciplina) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        if (jor != null) {
            disciplina.setJornada_deportiva(jor);
            Disciplina_DeportivaDTO disci = Disciplina_DeportivaDAO.buscarDisciplina(disciplina);
            if (disci != null) {
                boolean consulta = Disciplina_DeportivaDAO.borrarDisciplina(disciplina);
                if (consulta) {
                    msn = "Disciplina deportiva  se ha eliminado  exitosamente";
                } else {
                    msn = "Disciplina deportiva no se puede eliminar";
                }
            } else {
                msn = "Disciplina deportiva no puedo eliminar";
            }
        }
        return msn;
    }

    public String downlistDisciplina() {
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        String list = "<select class=\"form-control\" id='id_disciplina' name='disciplina'>";
        List<Disciplina_DeportivaDTO> listadoDisciplina = Disciplina_DeportivaDAO.listadoDisciplina(jor);
        for (Disciplina_DeportivaDTO disci : listadoDisciplina) {
            list += "<option value=\'" + disci.getId_disciplina() + "\'>" + disci.getNombre_disciplina() + "</option>";
        }
        return list + "</select>";
    }

    public String registrarArbitro(ArbitroDTO arbitro) {
        String msn = "";
        ArbitroDTO arb = ArbitroDAO.buscarArbitroDisciplina(arbitro.getDisciplina_deportiva());
        if (arb == null) {
            boolean consulta = ArbitroDAO.agregarArbitro(arbitro);
            if (consulta) {
                msn = "Arbitro  se ha registrado exitosamente";
            } else {
                msn = "Disciplina no se puedo registrar";
            }
        } else {
            msn = "Disciplina ya tiene un Arbitro Registrado";
        }

        return msn;
    }

    public String listadoArbitros() {
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Arbitros </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Disciplina </th>\n"
                + "                <th>Nombre de Arbitro </th>\n"
                + "<th>Documento </th>\n"
                + "<th>opciones </th>\n"
                + "            </tr> </thead>";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        List<ArbitroDTO> listadoArbitro = ArbitroDAO.listadoArbitro(jor);
        int i = 0;
       
        tabla += "<body>";
        for (ArbitroDTO arbitro : listadoArbitro) {
            tabla += " <tr>\n"
                    + "                <td>"+arbitro.getDisciplina_deportiva().getNombre_disciplina() + "</td>\n"
                    + "                <td    >" + arbitro.getNombre_arbitro() + "</td>\n"
                    + "                <td  id=\"" + i + "\" >" + arbitro.getDocumento() + "</td>\n"
                    + "                <td> \n"
               + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarArbitro(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                </td>\n"
                    + "            </tr> ";
            i++;
          
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String listadoIntegrante(EquipoDTO equipo) {
        String panel = "<div class='table-responsive' >"
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Integrantes</h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Codigo integrante</th>\n"
                + "                <th>Nombre de Integrante </th>\n"
                + "                <th>Semestre</th>\n"
                + "                <th>Genero</th>\n"
                + "<th>Documento </th>\n"
                
                + "            </tr> </thead>";
        List<IntegranteDTO> listadoIntegranteEquipo = IntegranteDAO.listadoIntegranteEquipo(equipo);
        int i = 0;

        tabla += "<body>";
        for (IntegranteDTO integrante : listadoIntegranteEquipo) {
            tabla += " <tr>\n"
                    + "                <td   id=\"" + i + "\" >" + integrante.getCodigo_integrante() + "</td>\n"
                    + "                <td   >" + integrante.getNombre_integrante() + "</td>\n"
                    + "                <td   >" + integrante.getSemestre() + "</td>\n"
                    + "                <td   >" + integrante.getGenero() + "</td>\n"
                    + "                <td> \n"
                   + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarIntegrante(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                    + "                </td>\n"
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public static void main(String[] args) {
        ArbitroDTO arb = new ArbitroDTO();
        Disciplina_DeportivaDTO dis = new Disciplina_DeportivaDTO();
        arb.setNombre_arbitro("sin2343");
        arb.setDocumento(12323);
        arb.setDisciplina_deportiva(dis);
        dis.setId_disciplina(6);
        arb.setDisciplina_deportiva(dis);
        Jornada_DeportivaDTO jor=new Jornada_DeportivaDTO();
        jor.setFecha_fin("2014-02-02");
        jor.setFecha_inicio("2014-02-02");
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
        
        System.err.println(new SistemaJornadaDeportiva().listadoEncuentroFecha(encuentro));
    }

    public String buscarArbitro(ArbitroDTO arbitro) {
        String msn = "";
        ArbitroDTO buscarArbitro = ArbitroDAO.buscarArbitro(arbitro);
        if (buscarArbitro != null) {
            msn = buscarArbitro.getNombre_arbitro() + "," + buscarArbitro.getDocumento() + "," + buscarArbitro.getDisciplina_deportiva().getId_disciplina();
        }
        return msn;
    }

    public String eliminarArbitro(ArbitroDTO arbitro) {
        String msn = "";
        ArbitroDTO buscarArbitro = ArbitroDAO.buscarArbitro(arbitro);
        if (buscarArbitro != null) {
            boolean consulta = ArbitroDAO.borrarArbitro(arbitro);
            if (consulta) {
                msn = "Arbitro se ha eliminado exitosamente";
            } else {
                msn = "Arbitro no se puedo eliminar";
            }
        } else {
            msn = "Arbitro no se encuentra";
        }
        return msn;
    }

    public String buscarEquipoCapitan(CapitanDTO capi) {
        String msn = "";
        Jornada_DeportivaDTO Jornada_DeportivaActiva = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        EquipoDTO buscarEquipoCapitan = EquipoDAO.buscarEquipoCapitan(capi,Jornada_DeportivaActiva);
        if (buscarEquipoCapitan != null) {
            msn =""+buscarEquipoCapitan.getId_equipo();
        }
        return msn;
    }

    public String registrarEquipo(EquipoDTO equipo) {
        String msn = "";
        Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        equipo.setJornada_deportiva(jor);
        EquipoDTO buscarEquipoCapitan = EquipoDAO.buscarEquipoCapitan(equipo.getCapitan_equipo(),jor);
        if (buscarEquipoCapitan == null) {
            EquipoDTO buscarEquipo = EquipoDAO.buscarEquipo(equipo);
            if (buscarEquipo == null) {
                boolean consulta = EquipoDAO.agregarEquipo(equipo);
                if (consulta) {
                    msn = "Equipo se ha registrado exitosamente";
                } else {
                    msn = "Equipo no se puedo registrar";
                }
            } else {
                msn = "Equipo ya se encuentra registrado";
            }
        } else {
            msn = "Capitan ya registro un equipo";
        }
        return msn;
    }

    public String registrarIntegrante(IntegranteDTO integrante) {
        String msn = "";
      
        IntegranteDTO buscarIntegrante = IntegranteDAO.buscarIntegrante(integrante);
        if (buscarIntegrante == null) {
            boolean insertarIntegrante = IntegranteDAO.insertarIntegrante(integrante);
            if (insertarIntegrante) {
                msn = "Integrante se registro exitosamente";
            } else {
                msn = "Integrante no se puedo registrar";
            }
        } else {
            msn = "Integrante ya se encuentra registrado";
        }
        return msn;
    }

    public String validarAdministrador(AdministradorDTO administrador) {
        String msn = "";
        AdministradorDTO validarAdministrador = AdministradorDAO.validarAdministrador(administrador);
        if (validarAdministrador != null) {
            msn = validarAdministrador.getNombre_administrador();
        }
        return msn;
    }

    public String ValidarCapitan(CapitanDTO capitan) {
        String msn = "";
        CapitanDTO validarCapitan = CapitanDAO.validarCapitan(capitan);
        if (validarCapitan != null) {
            msn = validarCapitan.getNombre_capitan()+","+validarCapitan.getCodigo_capitan();
        }
        return msn;
    }

    public String jornadadeportivaAnteriores() {
        List<Jornada_DeportivaDTO> jornadaAnteriores = Jornada_DeportivaDAO.jornadaAnteriores();
        String list = "<select class=\"form-control\" id='temporada'>";
        for (Jornada_DeportivaDTO jor : jornadaAnteriores) {
            list += "<option value=\'" + jor.getTemporada() + "\'>" + jor.getTemporada() + "</option>";
        }
        return list + "</select>";
    }
    public String listadoPoidon(Jornada_DeportivaDTO jorn) {
        String panel = "\" <div class='table-responsive' >\""
                + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Poidon  Equipos </h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Puesto</th>\n"
                + "                <th>Equipo </th>\n"
                + "                <th>puntaje </th>\n"
                + "            </tr> </thead>";
        List<EquipoDTO> poidon = EquipoDAO.poidon(jorn);
        tabla += "<body>";
        int i = 1;
        for (EquipoDTO equipo : poidon) {
            tabla += " <tr>\n"
                    + "                <td >" + i + "</td>\n"
                    + "                <td   >" + equipo.getNombre_equipo() + "</td>\n"
                    + "                <td   >" + equipo.getPuntos() + "</td>\n"
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String listadoIntegranteJornadaAnteriores(Jornada_DeportivaDTO jor) {
         String panel = "<div class='table-responsive' >"
                 + "<div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Integrantes</h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Codigo integrante</th>\n"
                + "                <th>Nombre de Integrante </th>\n"
                + "                <th>Semestre</th>\n"
                + "                <th>Genero</th>\n"
                + "            </tr> </thead>";
        List<IntegranteDTO> listadoIntegranteEquipo = IntegranteDAO.integranteEquipoTemporada(jor);
        int i = 0;

        tabla += "<body>";
        for (IntegranteDTO integrante : listadoIntegranteEquipo) {
            tabla += " <tr>\n"
                    + "                <td   id=\"" + i + "\" >" + integrante.getCodigo_integrante() + "</td>\n"
                    + "                <td   >" + integrante.getNombre_integrante() + "</td>\n"
                    + "                <td   >" + integrante.getSemestre() + "</td>\n"
                    + "                <td   >" + integrante.getGenero() + "</td>\n"
                    + "            </tr> ";
            i++;

        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String downlistFecha() {
     Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        String list = "<select class=\"form-control\" id='fecha'>";
        List<Fecha_DeportivaDTO> listadoFecha = Fecha_DeportivaDAO.buscarFechaDeportiva(jor);
        for (Fecha_DeportivaDTO fecha:listadoFecha ) {
            list += "<option value=\'" +fecha.getId_fecha() +"\'>" + fecha.getFecha() + "</option>";
        }
        return list + "</select>";
    
    }

    public String downlistEquipoLocal() {
     Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        String list = "<select class=\"form-control\" id='equipo_local'>";
        List<EquipoDTO> listadoEquipo = EquipoDAO.buscarEquipoJornada(jor);
        for (EquipoDTO equipo :listadoEquipo ) {
            list += "<option value=\'" +equipo.getId_equipo() +"\'>" + equipo.getNombre_equipo() + "</option>";
        }
        return list + "</select>";
    }
    
      public String downlistEquipoVisitante() {
     Jornada_DeportivaDTO jor = Jornada_DeportivaDAO.buscarJornada_DeportivaActiva();
        String list = "<select class=\"form-control\" id='equipo_visitante'>";
        List<EquipoDTO> listadoEquipo = EquipoDAO.buscarEquipoJornada(jor);
        for (EquipoDTO equipo :listadoEquipo ) {
            list += "<option value=\'" +equipo.getId_equipo() +"\'>" + equipo.getNombre_equipo() + "</option>";
        }
        return list + "</select>";
    }
      
    public String registrarEncuentroDeportivo(Encuentro_DeportivoDTO encuentro){
         String msn="";
          Encuentro_DeportivoDTO buscarEncuentro = Encuentro_DeportivoDAO.buscarEncuentro(encuentro);
        if(buscarEncuentro==null){
            
            boolean registrarEncuentroDeportivo = Encuentro_DeportivoDAO.registrarEncuentroDeportivo(encuentro);
         if(registrarEncuentroDeportivo)
         {
          msn="Encuentro deportivo se registro exitosamente"; 
         }
         else{
             msn="Encuentro no se puedo Registrar";
         }
        }
        else{
            msn="Encuentro deportivo ya se encuentra registrado";
        }
return msn;
      }
    
    public String listadoEncuentros(){
         String panel = "<div class='table-responsive' >"
                 + " <div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Encuentros</h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Id </th>\n"
                + "                <th> Fecha </th>\n"
                + "                <th>Disciplina </th>\n"
                   + "              <th> hora </th>\n"
                + "                <th>Equipo local </th>\n"
                + "                <th>Equipo visitante</th>\n"
                + "<th>opciones </th>\n"
                + "            </tr> </thead>";
        List<Encuentro_DeportivoDTO> ListarEncuentros = Encuentro_DeportivoDAO.ListarEncuentros();
         tabla += "<body>";
         int i=0;
        for (Encuentro_DeportivoDTO encuen : ListarEncuentros) {
            tabla += " <tr>\n"
                     + "                <td id="+i +">" + encuen.getId_encuentro() + "</td>\n"
                    + "                <td   >" + encuen.getFecha().getFecha() + "</td>\n"
                    + "                <td   >" + encuen.getDisciplina().getNombre_disciplina() + "</td>\n"
                    + "                <td   >" + encuen.getHora() + "</td>\n"
                    + "                <td   >" + encuen.getEquipo_local().getNombre_equipo() + "</td>\n"
                        + "            <td   >" + encuen.getEquipo_visitante().getNombre_equipo() + "</td>\n"
                              + "                <td> \n"
                    + "                    <button type=\"button\" class=\"btn btn-default btn-sm\"  data-toggle=\"modal\" data-target=\".bs-example-modal-sm\"  onclick=\"EliminarEncuentro(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-remove\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                 
                    + "                </td>\n"    
                    + "            </tr> ";
   
        i++;
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String eliminarEncuentro(Encuentro_DeportivoDTO encuentro) {
     String msn = "";
        Encuentro_DeportivoDTO encuen=Encuentro_DeportivoDAO.buscarEncuentro1(encuentro);
        if (encuen != null) {
            boolean consulta = Encuentro_DeportivoDAO.eliminarEncuentro(encuentro);
            if (consulta) {
                msn = "Encuentro deportivo se ha eliminado  exitosamente";
            }
        } else {
            msn = " Encuentro deportivo no puedo eliminar";
        }
        return msn;
    }

    public String listadoEncuentroFecha(Encuentro_DeportivoDTO encuentro) {
             String panel = "<div class='table-responsive' >"
                     + "<div class=\"panel panel-primary\">\n"
                + "  <!-- Default panel contents -->\n"
                + "  <div class=\"panel-heading text-center \" ><h3>Listado Encuentros</h3></div>";
        String tabla = panel + "<table  id=\"listadotabla\" class=\"table table-bordered \">\n"
                + "         <thead>   <tr class=\"active\">\n"
                + "                <th> Id </th>\n"
                + "                <th> Fecha </th>\n"
                + "                <th>Disciplina </th>\n"
                   + "              <th> hora </th>\n"
                + "                <th>Equipo local </th>\n"
                + "                <th>Equipo visitante</th>\n"
                + "<th>opciones </th>\n"
                + "            </tr> </thead>";
        List<Encuentro_DeportivoDTO> ListarEncuentros = Encuentro_DeportivoDAO.ListarEncuentroFechaDisciplina(encuentro);
         tabla += "<body>";
         int i=0;
        for (Encuentro_DeportivoDTO encuen : ListarEncuentros) {
            tabla += " <tr>\n"
                     + "                <td id="+i +">" + encuen.getId_encuentro() + "</td>\n"
                    + "                <td   >" + encuen.getFecha().getFecha() + "</td>\n"
                    + "                <td   >" + encuen.getDisciplina().getNombre_disciplina() + "</td>\n"
                    + "                <td   >" + encuen.getHora() + "</td>\n"
                    + "                <td   >" + encuen.getEquipo_local().getNombre_equipo() + "</td>\n"
                        + "            <td   >" + encuen.getEquipo_visitante().getNombre_equipo() + "</td>\n"
                              + "                <td> \n"
                       + "                    <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\"  onclick=\"FormActualizarEncuentro(document.getElementById('" + i + "').innerHTML)\" >\n"
                    + "                        <span class=\"glyphicon glyphicon-cog\">   \n"
                    + "                        </span> \n"
                    + "                    </button>\n"
                 
                    + "                </td>\n"    
                    + "            </tr> ";
   
        i++;
        }
        tabla += "</body>";
        return tabla + "</table> </div> </div>";
    }

    public String buscarEncuentro(Encuentro_DeportivoDTO encuentro) {
   String msn = "";
   System.err.println(encuentro.getId_encuentro());
        Encuentro_DeportivoDTO buscarEncuentro = Encuentro_DeportivoDAO.buscarEncuentro(encuentro);
        if (buscarEncuentro!=null) {
            return msn = buscarEncuentro.getId_encuentro()+ "," + buscarEncuentro.getFecha().getFecha() +","+buscarEncuentro.getDisciplina().getNombre_disciplina()+ "," + buscarEncuentro.getEquipo_local().getNombre_equipo()+","+buscarEncuentro.getEquipo_visitante().getNombre_equipo()+","+buscarEncuentro.getHora();
        }
        return msn;
    }

    public String actualizarEncuentro(Encuentro_DeportivoDTO encuentro) {
        String msn="";
        System.out.println(encuentro.getId_encuentro());
       Encuentro_DeportivoDTO buscarEncuentro = Encuentro_DeportivoDAO.buscarEncuentro(encuentro);
        if( buscarEncuentro!=null ){
            boolean consulta = Encuentro_DeportivoDAO.registrarResultadoEncuentro(encuentro);
            if(consulta){
                 ActualizarPuntos(buscarEncuentro,encuentro);
                 msn="se ha registrado los resultados exitosamente";
            }
            else{
                msn="no se puedo registrar los resultado";
            }
        }else{
            msn="Encuentro deportivo no se encontro";
        }
        return msn;
    }

  

    private void ActualizarPuntos(Encuentro_DeportivoDTO buscarEncuentro, Encuentro_DeportivoDTO encuentro) {
        int puntos = Disciplina_DeportivaDAO.buscarDisciplina(buscarEncuentro.getDisciplina()).getPuntos();
        if(encuentro.getMarcador_local()>encuentro.getMarcador_visitante()){
              EquipoDAO.AgregarPuntos(buscarEncuentro.getEquipo_local(),puntos);
      }
      else
       if(encuentro.getMarcador_local()<encuentro.getMarcador_visitante())
      {
              EquipoDAO.AgregarPuntos(buscarEncuentro.getEquipo_visitante(),puntos);
      }
       else{
            EquipoDAO.AgregarPuntos(buscarEncuentro.getEquipo_visitante(),puntos/2);
             EquipoDAO.AgregarPuntos(buscarEncuentro.getEquipo_local(),puntos/2);
       }
    
    }

    public String eliminarIntegrante(IntegranteDTO integrante) {
        String msn="";
        IntegranteDTO buscarIntegrante = IntegranteDAO.buscarIntegrante(integrante);
        if(buscarIntegrante!=null){
            boolean eliminarIntegrante = IntegranteDAO.eliminarIntegrante(integrante);
            if(eliminarIntegrante){
                msn="Integrante se ha eliminado satifactoriamente";
            }
            else{
            msn="Integrante no se puedo eliminar";
            }
        }else{
            msn="Integrante no se encuentra registrado";
        }
    
    return msn;
  
    }
}

   



    
