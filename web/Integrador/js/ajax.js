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
    var connection = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        if (window.XMLHttpRequest) {
            connection = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            connection = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return connection;
}

function ingresar() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var password = document.getElementById("password");
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value;
    url = "procesar/procesarSesion.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("divLoad").innerHTML = "<center><img src='img/load.gif' height='200' width='275'></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0) {
                    document.getElementById("divLoad").innerHTML = "";
                    openModal("modal-login");
                } else {
                    if (rta.indexOf("1") >= 0) {
                        login.action = "listar_modulos.jsp";
                        login.submit();
                    } else if (rta.indexOf("2") >= 0) {
                        login.action = "index.jsp";
                        login.submit();
                    }
                }
            }
        } else
        {
            document.getElementById("divLoad").value = "Verificando Usuario...";
        }
    }
}

//javascript carlos torres 29/11/2016


function consultarInformeModuloAñoSemestre() {
    var modulo = $("#modulo").val();
    var ano = $("#ano").val();
    var semestre = $("#semestre").val();



    if (semestre < 1 && semestre > 2) {
        alert("El semestre no puede ser un valor menor a 1 y mayor 2");
        return;

    }


    $.ajax({
        type: "POST",
        url: "procesar/procesarListarPublicaciones.jsp",
        data: {
            "modulo": modulo,
            "ano": ano,
            "semestre": semestre
        },
        cache: false,
        success: function (data) {

            $("#contenidoPrincipal").empty();
            $("#contenidoPrincipal").append(data);

        }
    });


}

function validarNumero(e) {
    var keynum = window.event ? window.event.keyCode : e.which;
    if ((keynum == 8)) {
        return true;
    }
    return /\d/.test(String.fromCharCode(keynum));

}


function registrarUsuario() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var password = document.getElementById("password");
    var roles = document.getElementById("registro");
    var rol = "";
    for (var i = 0; i < roles.elements.length; i++) {
        if ((roles[i].type === 'checkbox') && (roles[i].checked === true)) {
            var val = roles[i].value;
            rol = rol.concat(val, '\n')
        }
    }
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value + "&roles=" + rol;
    url = "procesar/procesarRegUsuario.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function registrarModulo() {
    var nombre_mod = document.getElementById("nombre_mod");
    var descripcion = document.getElementById("descripcion");
    var dir = document.getElementById("url");
    ajax = nuevoAjax();
    parametros = "nombre_mod=" + nombre_mod.value + "&descripcion=" + descripcion.value + "&url=" + dir.value;
    url = "procesar/procesarRegModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function validarId() {
    var id = document.getElementById("id");
    var modulo = document.getElementById("selectMod");
    ajax = nuevoAjax();
    parametros = "id=" + id.value + "&modulo=" + modulo.value;
    url = "procesar/validarIdRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("id").innerHTML = "style='border-color: red;'";
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function registrarRF() {
    var id = document.getElementById("id");
    var modulo = document.getElementById("selectMod");
    var nombre = document.getElementById("nombre");
    var dir = document.getElementById("url");
    ajax = nuevoAjax();
    parametros = "id=" + id.value + "&modulo=" + modulo.value + "&nombre=" + nombre.value + "&url=" + dir.value;
    url = "procesar/procesarRegistroRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = rta;
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = rta;
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function registrarRol() {
    var rol = document.getElementById("rol");
    var descripcion = document.getElementById("descripcion");
    var req = document.getElementById("registro");
    //Falta hacer método que recorrar los checks, falta pestañas
    ajax = nuevoAjax();
    parametros = "rol=" + rol.value + "&descripcion=" + descripcion.value + "&reqs=" + req;
    url = "procesar/procesarRegistroRol.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Registro exitoso";
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló registro";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function buscarPrivilegios() {
    var rol = document.getElementById("selectMod");
    ajax = nuevoAjax();
    parametros = "rol=" + rol.value;
    url = "procesar/cargarPrivilegios.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("campo").innerHTML = "<img src='img/load.gif' > ";
    ajax.onreadystatechange = function () {
        console.log(ajax.readyState);
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("campo").innerHTML = rta;
                toggleAccordion();
            }
//            if (rta.indexOf("2") >= 0) {
//                document.getElementById("campo").innerHTML = "Usuario no existente";
//            }
        } else {
            //alert("entro");
            document.getElementById("campo").value = "<img src='../img/load.gif' height='42' width='42'> ";
        }
    }

}

function buscarRoles() {
    //alert("hola");
    var nombre_usuario = document.getElementById("nombre_usuario");
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value;
    url = "procesar/cargarRoles.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("campo").innerHTML = "<center><img src='img/load.gif' ></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("campo").innerHTML = rta;
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function actualizarRoles() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var roles = document.getElementById("registro");
    var rol = "";
    for (var i = 0; i < roles.elements.length; i++) {
        if ((roles[i].type === 'checkbox') && (roles[i].checked === true)) {
            var val = roles[i].value;
            rol = rol.concat(val, '\n')
        }
    }
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&roles=" + rol;
    url = "procesar/asignarRoles.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Resultado exitoso";
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Resultado fallido";
                }
            } else
            {
                document.getElementById("divError").value = "Verificando Usuario...";
            }
        }
    }
}

function modificarModulo() {
    var nombre_mod = document.getElementById("nombre_mod");
    var descripcion = document.getElementById("descripcion");
    var dir = document.getElementById("url");
    ajax = nuevoAjax();
    parametros = "nombre_mod=" + nombre_mod.value + "&descripcion=" + descripcion.value + "&url=" + dir.value;
    url = "procesar/procesarActModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = rta;
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = rta;
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function modificarUsuario() {
    var nombre_usuario = document.getElementById("nombre_usuario");
    var password = document.getElementById("password");
    ajax = nuevoAjax();
    parametros = "nombre_usuario=" + nombre_usuario.value + "&password=" + password.value;
    url = "procesar/procesarModUsuario.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Modificación exitosa";
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló modificación";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function modificarRol() {
    var rol = document.getElementById("rol");
    var descripcion = document.getElementById("descripcion");
    //Falta hacer método que recorrar los checks, falta pestañas
    ajax = nuevoAjax();
    parametros = "rol=" + rol.value + "&descripcion=" + descripcion.value;
    url = "procesar/procesarModificarRol.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("1") >= 0) {
                    document.getElementById("divError").innerHTML = "Modificación exitosa";
                    document.getElementById("registro").reset;
                } else if (rta.indexOf("2") >= 0) {
                    document.getElementById("divError").innerHTML = "Falló modificación";
                }
            }
        } else
        {
            document.getElementById("divError").value = "Verificando Usuario...";
        }
    }
}

function modificarRF(modulo) {
    var id = document.getElementById("id");
    var nombre = document.getElementById("nombre");
    console.log(nombre.value);
    var dir = document.getElementById("url");
    console.log(dir.value);
    ajax = nuevoAjax();
    parametros = "id=" + id.value + "&modulo=" + modulo + "&nombre=" + nombre.value + "&url=" + dir.value;
    url = "procesar/procesarModificarRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("loading").innerHTML = rta
                location.reload();

            }
        }
    }

}
function cargarNoRF(modulo) {
    ajax = nuevoAjax();
    var rol = document.getElementById("selectMod");
    parametros = "modulo=" + modulo + "&rol=" + rol.value;
    url = "procesar/cargarNoRFModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("modal").innerHTML = rta;
                openModal("modal-mod-rf");
            }
        } else
        {
            document.getElementById("modal").value = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}
function asignarPrivilegios(modulo, rol) {
    ajax = nuevoAjax();
    var checkboxes = document.getElementById("formP").checkP;
    var rfs = "";
    var cont = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            rfs += checkboxes[i].id + "-";
            cont++;
        }
    }

    parametros = "rfs=" + rfs + "&rol=" + rol + "&modulo=" + modulo;
    url = "procesar/procesarAsignarPrivilegio.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("rAsignacion").innerHTML = "<center><img src='img/load.gif'  ></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("rAsignacion").innerHTML = rta;
                buscarPrivilegios();
                //openModal("modal-mod-rf");
            }
        } else
        {
            document.getElementById("rAsignacion").value = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}
function eliminarPrivilegios(modulo, rol) {
    ajax = nuevoAjax();

    var checkboxes = document.getElementsByName("check" + modulo);
    var rfs = "";
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            rfs += checkboxes[i].id + "-";
            //cont++;
        }
    }
    parametros = "rfs=" + rfs + "&rol=" + rol + "&modulo=" + modulo;
    url = "procesar/procesarEliminarPrivilegio.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("campo").innerHTML = "<center><img src='img/load.gif'  ></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("rAsignacion").innerHTML = rta;
                buscarPrivilegios();
                //openModal("modal-mod-rf");
            }
        } else
        {
            document.getElementById("rAsignacion").value = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}

function cargarNoRolUsuario() {
    console.log("entro cargarNoRolUsuario");
    ajax = nuevoAjax();
    var usuario = document.getElementById("nombre_usuario");
    parametros = "usuario=" + usuario.value;
    url = "procesar/cargarNotRolUsuario.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("modal").innerHTML = "<center><img src='img/load.gif' height='200' width='275'></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("modal").innerHTML = rta;
                openModal("modal-mod-rol");
            }
        } else
        {
            document.getElementById("modal").value = "<img src='img/load.gif'/ height='42' width='42'> ";
        }
    }
}

function asignarRoles(usuario) {
    ajax = nuevoAjax();
    var checkboxes = document.getElementsByName("checkRolA");
    var roles = "";
    var cont = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            roles += checkboxes[i].id + "-";
            cont++;
        }
    }

    parametros = "roles=" + roles + "&usuario=" + usuario;
    url = "procesar/asignarRoles.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("asignarRolesR").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("asignarRolesR").innerHTML = rta;
                buscarRoles();
            }
        } else
        {
            document.getElementById("asignarRolesR").value = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}

function quitaRoles(usuario) {
    ajax = nuevoAjax();
    var checkboxes = document.getElementsByName("checkRolE");
    var roles = "";
    var cont = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            roles += checkboxes[i].id + "-";
            cont++;
        }
    }

    parametros = "roles=" + roles + "&usuario=" + usuario;
    url = "procesar/procesarQuitarRoles.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("campo").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("campo").innerHTML = rta;
                buscarRoles();
            }
        } else
        {
            document.getElementById("campo").value = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}

function modalARF(modulo) {
    ajax = nuevoAjax();
    parametros = "modulo=" + modulo;
    url = "procesar/procesarModalAgregarRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("modal-ARF").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("modal-ARF").innerHTML = rta;
                openModal("modal-RF");
            }
        }
    }
}

function registarRoles(modulo) {
    ajax = nuevoAjax();
    var id = document.getElementById("id");
    var nombre = document.getElementById("nombre");
    var url = document.getElementById("url");

    parametros = "modulo=" + modulo + "&id=" + id.value + "&nombre=" + nombre.value + "&url=" + url.value;
    url = "procesar/procesarCrearRF.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading").innerHTML = "<center><img src='img/load.gif' height='200' width='275'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("loading").innerHTML = rta;
                location.reload();
            }
        } else
        {
            document.getElementById("loading").innetHTML = "<img src='../img/load.gif'/ height='42' width='42'> ";
        }
    }
}

function eliminarRF(modulo) {
    ajax = nuevoAjax();
    var checkboxes = document.getElementsByName("checkRFE" + modulo);
    var rfs = "";
    var cont = 0;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            rfs += checkboxes[i].id + "-";
            cont++;
        }
    }
    if (rfs === "") {
        document.getElementById("loading" + modulo).innerHTML = "no ha seleccionado ningun elemento";
        return;
    }
    parametros = "modulo=" + modulo + "&rfs=" + rfs;
    url = "procesar/procesarEliminarRFs.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading" + modulo).innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta.indexOf("no se han podido eliminar los siguientes RF") > -1) {
                    document.getElementById("loading" + modulo).innerHTML = rta;
                    return;
                }
                document.getElementById("loading" + modulo).innerHTML = rta;
                location.reload();
            }
        } else
        {
            document.getElementById("loading" + modulo).value = "<center><img src='img/load.gif'/></center>  ";
        }
    }
}

function modalMRF(modulo, rf) {
    ajax = nuevoAjax();
    parametros = "modulo=" + modulo + "&rf=" + rf;
    url = "procesar/procesarModificarRFModal.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading" + modulo).innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("loading" + modulo).innerHTML = rta;
                openModal("modal-RF");
            }
        }
    }
}

function modalMModulo(modulo) {
    ajax = nuevoAjax();
    parametros = "modulo=" + modulo;
    url = "procesar/procesarModificarModuloModal.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("modal-modificar").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("modal-modificar").innerHTML = rta;
                openModal("modal-MModulo");
            }
        }
    }
}

function modificarModulo2() {
    var modulo = document.getElementById("nombre-modulo");
    var descripcion = document.getElementById("descripcion-modulo");
    var url = document.getElementById("url-modulo");
    ajax = nuevoAjax();
    parametros = "modulo=" + modulo.value + "&descripcion=" + descripcion.value + "&url=" + url.value;
    url = "procesar/procesarModificarModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("loading").innerHTML = rta;
                location.reload();

            }
        }
    }
}

function modalAModulo() {
    ajax = nuevoAjax();
    parametros = "nada=nada";
    url = "procesar/procesarAgregarModuloModal.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("modal-agregar").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("modal-agregar").innerHTML = rta;
                openModal("modal-AModulo");
            }
        }
    }
}
function registrarModulo2() {
    var modulo = document.getElementById("nombre-modulo");
    var descripcion = document.getElementById("descripcion-modulo");
    var url = document.getElementById("url-modulo");
    ajax = nuevoAjax();
    parametros = "modulo=" + modulo.value + "&descripcion=" + descripcion.value + "&url=" + url.value;
    url = "procesar/procesarAgregarModulo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    document.getElementById("loading").innerHTML = "<center><img src='img/load.gif'/></center> ";
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("loading").innerHTML = "Registro exitoso";
                location.reload();
            }
        }
    }
}

function filtrar(){
    alert("2");
    var rol = document.getElementById("selectMod");
    ajax = nuevoAjax();
    parametros = "rol=" + rol.value;
    url = "procesar/filtrarUsuarios.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                document.getElementById("info").innerHTML = rta;
            }
        } else
        {
            document.getElementById("info").value = "Verificando Usuario...";
        }
    }
}