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

 //javascript carlos torres 19/11/2016
    
    /*
     * genera el pop-up para crear publicacion
     */
    function abrirVentana(){
       
        $.ajax({
		type : "GET",
		url : "../GestorPublicaciones",
                data : {
			'medio' : 'abrirVentanaCrearPublicacion'
		},
		cache : false,
		success : function(data) {
			var $dialog = $('<div id="ventana" syle="height=450px;"></div>')
					.html(data).dialog({
						autoOpen : false,
						modal : true,
						height : 600,
						width : 600,
						title : "",
						close : function(event, ui) {
							$(this).dialog('destroy').remove();
						}
					});

			$dialog.dialog('open');
			

		}
	});
        
    }
    
    /**
     * este metodo cierra el pop-up
     * @returns {undefined}
     */
    function eliminarVentana() {
	$("#ventana").dialog('destroy').remove();
}

    
    /**
     * este metodo registra una publicacion en el sistema
     * @returns {undefined}
     */
    function registrarPublicacion(){
        var titulo = $("#titulo").val();
        var modulo = $("#modulo").val();
        var informe = $("#informe").val();
        var texto = $("#texto").val();
       
         $.ajax({
		type : "POST",
		url : "../GestorPublicaciones",
                data : {
			'medio' : 'registrarPublicacion',
                        'titulo': titulo,
                        'modulo': modulo,
                        'informe':informe,
                        'texto':texto
		},
		cache : false,
		success : function(data) {
		
                    if(data){
                            alert("registro exitoso");
                            eliminarVentana();
                        }else{
                            alert("Error en el registro");
                        }
			

		}
	});
        
    }