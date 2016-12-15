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

     var esto = document.getElementById("fecha");
  
     document.getElementById("fecha_max").value = esto.value;
     
    var div = "equipos";
    var numero = document.getElementById("num_equipos4");
    var proyec = document.getElementById("num_equipos");
    var mod = document.getElementById("check");
    var modif = "";
    if (mod.type === 'checkbox' && mod.checked === true) {
        modif = "0";
    } else {
        modif = "1";
    }
    
    ajax = nuevoAjax();
    parametros = "numero=" + numero.value+"&modif="+ modif.valueOf()+"&num_proyec="+proyec.value+"&fecha="+esto.value;
    url = "procesarDoc/cambioEquipos.jsp";
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
    var key = document.getElementById("key")
    
    ajax = nuevoAjax();
    parametros = "cod_grupo=" + cod.value+"&key="+key.value;
    url = "procesarDoc/cargarProyectos.jsp";
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
     window.locationf="inicioDoc.jsp";
     
}

function relacionar(){
    var numero = document.getElementById("num_estu");
    
    parametros = "numero=" + numero.value;
    
    for(x=0;x<numero.value;x++){
        parametros += "&cod_est"+x+"="+document.getElementById("cod_est"+x).value+
                "&cod_equipo"+x+"="+document.getElementById("codigo_equipo"+x).value;
    }
    
    ajax = nuevoAjax();
    url = "procesarDoc/relacionarProyecto.jsp";
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
                        location.href= "inicioDoc.jsp";
                        
                        
                    }
                }
            } else {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0 ) {
                    document.getElementById("divError").innerHTML = ajax.responseText;
                } else {
                    if (rta.indexOf("1") >= 0) {
                        alert("registro exitoso");
                        location.href= "inicioDoc.jsp";
                        
                    
                    }
                }
            }
        } else
        {
            document.getElementById("divError").value = "No se pudo realizar el registro";
        }
    }
}




