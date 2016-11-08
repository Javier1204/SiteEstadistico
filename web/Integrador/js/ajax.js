/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var pos = 1;
var posD = 1;


/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
 lo que se puede copiar tal como esta aqui */
function nuevoAjax()
{
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

function ingresar(){
     var nombre_usuario= document.getElementById("nombre_usuario");
     var password = document.getElementById("password");
     var tipo_usuario= document.getElementById("tipo");
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value + "&tipo="+tipo_usuario.value;
    url = "procesar/procesarSesion.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function (){
        if (ajax.readyState == 4){
            if (ajax.status == 200){
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0) {
                    document.getElementById("divError").innerHTML = ajax.responseText;
                }
                else {
                    if (rta.indexOf("1") >= 0) {
                        login.action = "listar_modulos.jsp";
                        login.submit();
                    } else if (rta.indexOf("2") >= 0) {
                        login.action = "listar_modulos.jsp";
                        login.submit();
                    } 
                }
            }
        }
        else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}