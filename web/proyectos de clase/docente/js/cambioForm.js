/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function nuevoAjax() {
    var xmlhttp = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}


function cargarEquipos() {

    var div = "equipos";
    var numero = document.getElementById("num_equipos");
    
    ajax = nuevoAjax();
    parametros = "numero=" + numero.value;
    url = "procesar/cambioEquipos.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById(div).innerHTML = rta;
            }
        }
    }

}
function cargarProyectos() {

    var div = "cargaPro";
    
    var cod = document.getElementById("grupos");
    
    ajax = nuevoAjax();
    parametros = "cod_grupo=" + cod.value;
    url = "procesar/cargarProyectos.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById(div).innerHTML = rta;
            }
        }
    }

}

function registrarEquipos() {

    
    var numero = document.getElementById("num_equipos");
    
    parametros = "numero=" + numero.value;
    alert(parametros);
    for(x=0;x<numero.value;x++){
        parametros += "&equipo"+x+"="+document.getElementById("num_equipo"+x).value;
    }
    alert(parametros);
    ajax = nuevoAjax();
    url = "registrarEquipos.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
               
                document.getElementById("div").innerHTML = ajax.responseText;

            } else
            {

                document.getElementById("div").innerHTML = ajax.responseText;

            }
        } else
        {
            document.getElementById("div").value = "Cargando";
        }

    }

}
function cambio(){
     var esto = document.getElementById("num_equipos");
     document.getElementById("num_equipos2").value = esto.value;
     
}
function cambio2(){
     var esto = document.getElementById("grupos");
    
     document.getElementById("cod_grupo").value = esto.value;
     
}

function registro(){
     alert("registro exitoso");
     window.locationf="inicio.jsp";
     
}




