function cargarEstudiantes() {
    var materia = document.getElementById('materia').value;
    var v = materia.split(" - ");
    var codigoMateria = v[0];
    var nombreMateria = v[1];
    var grupo = v[2];
    //alert("materia " + nombreMateria + " grupo:: " + grupo + " codigo:: " + codigoMateria);

    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            if (xhttp.responseText.indexOf('error') > -1) {
                alert("error");
            } else {
                var info = xhttp.responseText;
                //nombre;apellido;codigo:
                if (info.indexOf('no') > -1) {
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-bottom-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    };
                    toastr["info"]("La materia seleccionada no tiene estudiantes", "Atención!");
                    var estudiantes = "<option>Seleccione el estudiante</option>" +
                     "<option>1150696 - Diego Leal</option>" +
                     "<option>1150696 - Diego Leal</option>" +
                     "<option>1150696 - Diego Leal</option>" +
                     "<option>1150696 - Diego Leal</option>";
                     document.getElementById('estudiantesMateria').innerHTML = estudiantes;
                } else {
                    var msg = "";
                    msg = "<option>Seleccione el estudiante</option>";
                    var v1 = info.split(":");
                    for (var i = 0; i < v1.length; i++) {
                        var v2 = v1[i].split(";");
                        msg += "<option>" + v2[2] + " - " + v2[0] + " " + v2[1] + "</option>";
                    }
                    document.getElementById('estudiantesMateria').innerHTML = msg;
                }
            }
        }
    };

    var url = "jsp/consultaEstudiantesMateria.jsp?codigoMateria=" + codigoMateria + "&grupo=" + grupo;
    xhttp.open("post", url, true);
    xhttp.send();
}

function registrarAsesoria() {
    var materia = document.getElementById('materia').value;
    var estudiante = document.getElementById('estudiantesMateria').value;
    var tema = document.getElementById('temaTratado').value;

    if (materia == "Seleccione la materia" || estudiante == "Seleccione la materia"
            || tema.length == 0) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr["error"]("Debe selecciona la materia, el estudiante y digitar el tema tratado.", "Error!");
    } else {
        alert("exito");
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText.indexOf('error') > -1) {
                    alert("error");
                } else {
                    var info = xhttp.responseText;

                    document.getElementById('asesoriasRegistradas').innerHTML += info;
                }
            }
        };

        var url = "jsp/registraAsesoria.jsp?materia=" + materia + "&estudiante=" + estudiante
                + "&tema=" + tema;
        xhttp.open("post", url, true);
        xhttp.send();
    }
}

function mostrarGrupo() {
    document.getElementById('selectGrupo').style.display = "block";
}

function ocultarGrupo() {
    document.getElementById('selectGrupo').style.display = "none";
}

function buscaCodigo() {
    var msg = "<input type='number' id='entradaBusqueda' class='ufps-input-line' placeholder='Ingrese el código a buscar'/>";
    document.getElementById('busqueda').innerHTML = msg;
}

function buscaNombre() {
    var msg = "<input type='text' id='entradaBusqueda' class='ufps-input-line' placeholder='Ingrese el nombre a buscar'/>";
    document.getElementById('busqueda').innerHTML = msg;
}

function buscarHorario() {
    var tipoConsulta = $("input[name='tipoConsulta']:checked").val();
    var consultaPor = $("input[name='consultaPor']:checked").val();
    var grupo = document.getElementById('grupoMateria').value;


    //alert(tipoConsulta + "   :: " + consultaPor);
    if (tipoConsulta == undefined || consultaPor == undefined) {
        toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            toastr["error"]("Debe seleccionar los filtros par ala búsqueda.", "Error!");
    } else {
        var entrada = document.getElementById('entradaBusqueda').value;

        if (entrada.length == 0) {
            toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            toastr["error"]("Debe ingresar los datos abuscar", "Error!");
        } else {
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    if (xhttp.responseText.indexOf('error') > -1) {
                        alert("error");
                    } else {
                        var info = xhttp.responseText;
                        toastr.options = {
                            "closeButton": false,
                            "debug": false,
                            "newestOnTop": false,
                            "progressBar": false,
                            "positionClass": "toast-bottom-right",
                            "preventDuplicates": true,
                            "onclick": null,
                            "showDuration": "300",
                            "hideDuration": "1000",
                            "timeOut": "5000",
                            "extendedTimeOut": "1000",
                            "showEasing": "swing",
                            "hideEasing": "linear",
                            "showMethod": "fadeIn",
                            "hideMethod": "fadeOut"
                        };
                        toastr["info"]("El docente o materia a buscar no tiene horario de asesoria registrado.", "Alerta!");
                    }
                }
            };

            var url = "jsp/consultarHorario.jsp?tipoConsulta=" + tipoConsulta + "&consultaPor=" + consultaPor
                    + "&grupo=" + grupo + "&entrada=" + entrada;
            xhttp.open("post", url, true);
            xhttp.send();
        }
    }
}