//metodo carga una imagen cargando
function loading(rta) {
    $(rta).html("<div class='row'><div class='col-md-4 col-md-offset-4'></div><div class='col-md-4 col-md-offset-4'><center><img src='./images/cargando2.gif' width='50' height='50' alt='cargando' /></center></div><div class='col-md-4 col-md-offset-4'></div> </div>");
}



//metodo para creacion de objecto ajax
//function ajax(url, datos, rta) {
//    var ajax = $.get(url, datos, function(respuesta) {
//        $(rta).html(respuesta);
//    });
//    return ajax;
//}
function ajax(url, datos, rta) {
    var ajax = $.post(url, datos, function(respuesta) {
        $(rta).html(respuesta);
    });
    return ajax;
}
function ajaxjsp(url, datos, rta) {
    var ajax = $.get(url, datos, function(respuesta) {
        $(rta).html(respuesta);
    });
    return ajax;
}
function ajaxsync(url, datos, rta) {
    var ajax = $.ajax({
  url: url,
  data: datos,
  async:   false
}).done(function(respuesta) {
  $(rta).html(respuesta);
});
    return ajax;
}

//metodo que permite validar campos  de tipo text que si se estan vacios
function validarCampos(campos) {
    var con = true;
    $.each(campos, function(ind, elem) {
        console.log($(elem).val())
        if ($(elem).val().length === 0) {
            $(elem).focus();
            con = false;
            return con;
        }
    });
    return con;
}


function MDEregistrarFormulario() {
    var url = "../EstudiantesdeprimerSemestre/DataPersonal.jsp";
    var datos = {};
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function MDEregistrarFormulario2() {
    var url = "../EstudiantesdeprimerSemestre/DataAcademica.jsp";
    var datos = {};
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function MDEeditarFormulario() {
    var url = "../EstudiantesdeprimerSemestre/DataPersonal.jsp";
    var datos = {};
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function MDEconsultarFormulario() {
    var url = "../EstudiantesdeprimerSemestre/ConsultarInformacion.jsp";
    var datos = {};
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function RegistroDataPersonal() {
    var btn = $('#butactualizar');
    var id_estudiante = $("#id_estudiante").val();
    var nombre = $("#nombre").val();
    var apellido = $("#apellido").val();
    var tipo_documento = $("#tipo_documento").val();
    var documento = $("#documento").val();
    var fecha_nacimiento = $("#fecha_nacimiento").val();
    var pais = $("#pais").val();
    var departamento = $("#departamento").val();
    var municipio = $("#municipio").val();
    var genero = $("#genero").val();
    var edad = $("#edad").val();
    var estado_civil = $("#estado_civil").val();
    var url = "../EstudiantesdeprimerSemestre/RegistrarDataPersonal.jsp";
    var campos = ["#codigo_capitan_1", "#nombre_capitan_1", "#correo_electronico_1", "#contrasena_1"];
    
        var datos = {
            id_estudiante:id_estudiante,
            nombre:nombre,
            apellido:apellido,
            tipo_documento: tipo_documento,
            documento: documento,
            fecha_nacimiento: fecha_nacimiento,
            pais: pais,
            departamento: departamento,
            municipio: municipio,
            genero: genero,
            edad: edad,
            estado_civil: estado_civil
        };
        var rta = "#resultDataPersonal";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    
}


function RegistroDataAcademica() {
    var btn = $('#botoacademi');
    var id_estudiante = $("#id_estudiante").val();
    var colegio_grado = $("#colegio_grado").val();
    var especialidad = $("#especialidad").val();
    var valida = $("#valida").val();
    var idioma = $(".idioma").val();
    var ano_grado = $("#ano_grado").val();
    var departamento_grado = $("#departamento_grado").val();
    var municipio_grado = $("#municipio_grado").val();
    var ingreso = $("#ingreso").val();
    var lectura = $("#lectura").val();
    var naturales = $("#naturales").val();
    var sociales = $("#sociales").val();
    var ingles = $("#ingles").val();
    var url = "../EstudiantesdeprimerSemestre/RegistraAcademica.jsp";
    var campos = ["#codigo_capitan_1", "#nombre_capitan_1", "#correo_electronico_1", "#contrasena_1"];
    
        var datos = {
            id_estudiante:id_estudiante,
            colegio_grado:colegio_grado,
            especialidad:especialidad,
            valida: valida,
            idioma: idioma,
            ano_grado: ano_grado,
            departamento_grado: departamento_grado,
            municipio_grado: municipio_grado,
            ingreso: ingreso,
            lectura: lectura,
            naturales: naturales,
            sociales: sociales,
            ingles: ingles      
        };
        var rta = "#resultdataacedemica";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    
}

function RegistroActividadm() {
    var btn = $('#botoactivi');
   
    var nombre = $("#nombre").val();
    var responsablePonente = $("#responsablePonente").val();
    var convenio = $("#convenio").val();
    var siconv = $("#siconv").val();
     var campos = ["#nombre", "#responsablePonente", "#convenio", "#siconv", "#tipoActividad", "#fechaInicio", "#fechaFin", "#lugar", "#organizador"];

    if( $('#siconv').prop('checked') ) {
       siconv=0;
       convenio="NO TIENE";
         campos = ["#nombre", "#responsablePonente","#siconv", "#tipoActividad", "#fechaInicio", "#fechaFin", "#lugar", "#organizador"];
     }
   
    var tipoActividad = $("#tipoActividad").val();
    var fechaInicio = $("#fechaInicio").val();
    var fechaFin = $("#fechaFin").val();
    var lugar = $("#lugar").val();
    var organizador = $("#organizador").val();
    var url = "../../Actividades de formacion/vistas/RegistraActividad.jsp";
       if (validarCampos(campos) === true) {
        var datos = {
            nombre:nombre,
            responsablePonente:responsablePonente,
            convenio:convenio,
            siconv: siconv,
            tipoActividad: tipoActividad,
            fechaInicio: fechaInicio,
            fechaFin: fechaFin,
            lugar: lugar,
            organizador: organizador
          
        };
        var rta = "#resultdataacetivi";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    }
    
}
function Registroasistencia() {
    var btn = $('#botoactiviasis');
   
    var codigoActividad = $("#codigoActividad").val();
    var codigoEstudiante = $("#codigoEstudiante").val();
        var campos = ["#codigoActividad", "#codigoEstudiante"];

    var url = "../../Actividades de formacion/vistas/RegistraAsistensia.jsp";
       if (validarCampos(campos) === true) {
        var datos = {
            codigoActividad:codigoActividad,
            codigoEstudiante:codigoEstudiante
            
          
        };
        var rta = "#resultdataassiten";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    }
    
}

function RegistroPonente() {
    var btn = $('#botoapon');
   
    var nombre = $("#nombre").val();
    var cedula = $("#cedula").val();
    var apellido = $("#apellido").val();
    var niveleducativo = $("#niveleducativo").val();
    var tipo_vinculacion = $("#tipo_vinculacion").val();
    var correo_personal = $("#correo_personal").val();
    var titulo = $("#titulo").val();
    var celular = $("#celular").val();
    var anos_experiencia = $("#anos_experiencia").val();
    var url = "../../Actividades de formacion/vistas/RegistraResponsable.jsp";
    var campos = ["#cedula", "#nombre", "#apellido", "#niveleducativo", "#tipo_vinculacion", "#correo_personal", "#titulo", "#celular", "#anos_experiencia"];

       if (validarCampos(campos) === true) {
        var datos = {
            nombre:nombre,
            cedula:cedula,
            apellido:apellido,
            nivel: niveleducativo,
            tipo_vinculacion: tipo_vinculacion,
            correo_personal: correo_personal,
            titulo: titulo,
            celular: celular,
            anos_experiencia: anos_experiencia
          
        };
        var rta = "#resultdataponene";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    }
    
}
function ReporteActividad() {
    var btn = $('#botoarepoacti');
   
    var codigo = $("#codigo").val();
    
    var url = "../../Actividades de formacion/vistas/ReporteActividad.jsp";
//    var campos = ["#codigo"];

//       if (validarCampos(campos) === true) {
        var datos = {
            codigo:codigo
          
          
        };
        var rta = "#resultdarepoactivii";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
//    }
    
}
function ReporteEstudi() {
    var btn = $('#botoareestu');
   
    var codigo = $("#codigo").val();
    
    var url = "../../Actividades de formacion/vistas/ReporteEstudiante.jsp";
//    var campos = ["#codigo"];

//       if (validarCampos(campos) === true) {
        var datos = {
            codigo:codigo
          
          
        };
        var rta = "#resultdarepoestudi";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
//    }
    
}
function Reportesemestre() {
    var btn = $('#botoaresemesre');
   
    var fechaInicio = $("#fechaInicio").val();
    var fechaFin = $("#fechaFin").val();
    
    var url = "../../Actividades de formacion/vistas/ReporteSemestre.jsp";
    var campos = ["#fechaInicio,#fechaFin"];

       if (validarCampos(campos) === true) {
        var datos = {
            fechaInicio:fechaInicio,
            fechaFin:fechaFin,
            
          
          
        };
        var rta = "#resultdarsemes";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    }
    
}