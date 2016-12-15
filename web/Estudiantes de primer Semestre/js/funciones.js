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
function MDEeditarFormulario2(codigo) {
     var codigo = codigo;
      var datos = {
            codigo:codigo          
        };
       
    
    
    var url = "../EstudiantesdeprimerSemestre/DataAcademicaEdit.jsp";
    
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function MDEeditarFormulario(codigo) {
     var codigo = codigo;
      var datos = {
            codigo:codigo          
        };
       
    var url = "../EstudiantesdeprimerSemestre/DataPersonalEdit.jsp";
  
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
}
function MDEconsultarFormulario() {
    var url = "../EstudiantesdeprimerSemestre/ConsultarInformacion.jsp";
    var datos = {};
    var rta = "#contenidoModulo";
    ajax(url, datos, rta);
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





function EditarDataPersonal() {
    var btn = $('#butactualizareditar');
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
    var url = "../EstudiantesdeprimerSemestre/EditDataPersonal.jsp";
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
        var rta = "#resultDataPersonaleditar";
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

function EditarDataAcademica() {
    var btn = $('#botoacademieditar');
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
    var url = "../EstudiantesdeprimerSemestre/EditarAcademica.jsp";
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
        var rta = "#resultdataacedemicaedit";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    
}


function RegistroActividadm() {
    var btn = $('#botoactivi');
    var id_estudiante = $("#id_estudiante").val();
    var Nombre = $("#Nombre").val();
    var responsablePonente = $("#responsablePonente").val();
    var convenio = $("#convenio").val();
    var siconv = $("#siconv").val();
    var tipoActividad = $("#tipoActividad").val();
    var fechaInicio = $("#fechaInicio").val();
    var fechaFin = $("#fechaFin").val();
    var lugar = $("#lugar").val();
    var organizador = $("#organizador").val();
    var url = "../Actividades de formacion/vistas/RegistraActividad.jsp";
//    var campos = ["#codigo_capitan_1", "#nombre_capitan_1", "#correo_electronico_1", "#contrasena_1"];
    
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
        var rta = "#resultdataacetivi";
        btn.button('loading');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    
}
function BsquedaAvnzada() {
    var btn = $('#butactvoconsultaavar');
    var poredad=0;
    var porgene=0;
    var porcivi=0;
    var porlec=0;
    var porcienc=0;
    var porsoci=0;
    var poring=0;
    
     var edad1 = 0;
    var edad2 =0;
    var genero = 0;
    var estado_civil = 0;
    var lectura = 0;
    var naturales =0;
    var sociales = 0;
    var ingles = 0;
    var vali=false;
    if($('#poredad').prop('checked') ){
        poredad=1;
        edad1 = $("#edad1").val();
        edad2 = $("#edad2").val();
        campos = ["#edad1", "#edad2"];
        vali=validarCampos(campos)
    }
    if($('#porgene').prop('checked') ){
        porgene=1;
        genero = $("#genero").val();
        campos = ["#genero"];
        vali=validarCampos(campos);
    }
    if($('#porcivi').prop('checked') ){
        porcivi=1;
        estado_civil = $("#estado_civil").val();
        campos = ["#estado_civil"];
        vali=validarCampos(campos);
    }
    if($('#porlec').prop('checked') ){
        porlec=1;
        lectura = $("#lectura").val();
        campos = ["#lectura"];
        vali=validarCampos(campos);
    }
    if($('#porcienc').prop('checked') ){
        porcienc=1;
        naturales = $("#naturales").val();
         campos = ["#naturales"];
        vali=validarCampos(campos);
    }
    if($('#porsoci').prop('checked') ){
        porsoci=1;
          sociales = $("#sociales").val();
        campos = ["#sociales"];
        vali=validarCampos(campos);
    }
    if($('#poring').prop('checked') ){
        poring=1;
         ingles = $("#ingles").val();
        campos = ["#ingles"];
        vali=validarCampos(campos);
    }
    
     
     
     
     
     
   
    
  
  
    
    
    
    
        var datos = {
            poredad:poredad,
            porgene:porgene,
            porcivi:porcivi,
            porlec: porlec,
            porcienc: porcienc,
            porsoci: porsoci,
            poring: poring,
            edad1: edad1,
            edad2: edad2,
            genero: genero,
            estado_civil: estado_civil,
            lectura: lectura,
            naturales: naturales,
            sociales: sociales,
            ingles: ingles
        };
        var url = "../EstudiantesdeprimerSemestre/ConsultaAvanzada.jsp";
        var rta = "#resultconsultavanxa";
        btn.button('loading');
          btn.button('reset');
        var objetoAjax = ajaxjsp(url, datos, rta);
        objetoAjax.always(function() {
            btn.button('reset');
           
        });
    
}
function RegistrarUsuario() {
    var btn = $('#botonreuser');
    var correo_electronico = $('#correo_electronico').val();
    var contrasena = $('#contrasena').val();
    var nombre = $('#nombre').val();
    var codigo = $('#codigo').val();
    var tipo = $('#tipo').val();
    var campos = ["#codigo", "#nombre", "#correo_electronico", "#contrasena"];
    if (validarCampos(campos) === true) {
        var datos = {correo_electronico: correo_electronico, nombre: nombre, codigo: codigo, contrasena: contrasena, tipo: tipo};
        var rta = "#resultdataaeser";
        var url = "../EstudiantesdeprimerSemestre/RegistrarUsuario.jsp";
        btn.button('loading');
        var objetoAjax = ajax(url, datos, rta);
        objetoAjax.always(function () {
            btn.button('reset');
            ListadoUsuario();
            borrardatos(campos);
        });
    }


}

function IniciarSesion() {
    var btn = $('#botonreuser');
    var correo_electronico = $('#correo_electronico').val();
    var contrasena = $('#contrasena').val();
    var nombre = $('#nombre').val();
    var codigo = $('#codigo').val();
    var tipo = $('#tipo').val();
    var campos = ["#codigo", "#nombre", "#correo_electronico", "#contrasena"];
    if (validarCampos(campos) === true) {
        var datos = {correo_electronico: correo_electronico, nombre: nombre, codigo: codigo, contrasena: contrasena, tipo: tipo};
        var rta = "#resultdataaeser";
        var url = "../EstudiantesdeprimerSemestre/RegistrarUsuario.jsp";
        btn.button('loading');
        var objetoAjax = ajax(url, datos, rta);
        objetoAjax.always(function () {
            btn.button('reset');
            ListadoUsuario();
            borrardatos(campos);
        });
    }


}



function  iniciarsesion() {
    var url = "../html/IniciarSesionUsuario.html";
    var datos = {};
    var rta = "#prueba";
    loading(rta);
    ajax(url, datos, rta);

}