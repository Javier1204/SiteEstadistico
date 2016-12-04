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


function modificar() {

    
    var nombre = document.getElementById("nom_proyecto");
    var keywords = document.getElementById("keywords");
    var descripcion = document.getElementById("descripcion");
    var id = document.getElementById("id");
   
    
    ajax = nuevoAjax();
    parametros = "nombre=" + nombre.value+"&keywords="+ keywords.value+"&descripcion="+ descripcion.value+"&id="+ id.value;
    url = "procesarEst/modificar.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0) {

                    document.getElementById("divError").innerHTML = ajax.responseText;

                } else {
                    if (rta.indexOf("1") >= 0) {
                        alert("registro exitoso");
                        location.href= "consultarProyectos.jsp";
                        
                        
                    }
                }
            } else {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0 ) {
                    document.getElementById("divError").innerHTML = ajax.responseText;
                } else {
                    if (rta.indexOf("1") >= 0) {
                        alert("registro exitoso");
                        location.href= "consultarProyectos.jsp";
                        
                    
                    }
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }

}
function cargarProyectos() {

    var div = "cargaPro";
    
    var cod = document.getElementById("grupos");
    
    ajax = nuevoAjax();
    parametros = "cod_grupo=" + cod.value;
    url = "procesarEst/cargarProyectos.jsp";
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
function cambio(){
    
     var esto = document.getElementById("num_equipos");
     if(esto.value==1){
         document.getElementById("mod").style.display = 'none';
         document.getElementById("cant").style.display = 'block';
     }else{
         document.getElementById("mod").style.display = 'block';
          document.getElementById("cant").style.display = 'none';
     }
     
                
     document.getElementById("num_equipos2").value = esto.value;
     document.getElementById("num_equipos4").value = esto.value;
     
}
function cambio2(){
     var esto = document.getElementById("grupos");
    
     document.getElementById("cod_grupo").value = esto.value;
     
}

function cambio3(){
     var esto = document.getElementById("num_equipos3");
     
     document.getElementById("num_equipos2").value = esto.value;
     document.getElementById("num_equipos4").value = esto.value;
     
}

function registro(){
     alert("registro exitoso");
     window.locationf="inicio.jsp";
     
}






