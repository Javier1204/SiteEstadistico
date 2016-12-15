function cargarEstudiantes() {
    var materia = document.getElementById('materia').value;
    var v = materia.split(" - ");
    var codigoMateria = v[0];
    var nombreMateria = v[2];
    var grupo = v[1];
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
                    $.unblockUI();
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
                } else {
                    var msg = "";

                    msg = "<option>Seleccione el estudiante</option>";
                    var v1 = info.split(":");
                    for (var i = 0; i < v1.length - 1; i++) {
                        if (v1[i] != undefined) {
                            var v2 = v1[i].split(";");
                            msg += "<option>" + v2[2] + " - " + v2[0] + " " + v2[1] + "</option>";
                        }
                    }
                    $.unblockUI();
                    document.getElementById('estudiantesMateria').innerHTML = msg;
                }
            }
        }
    };
    $.blockUI({
        message: 'Cargando estudiantes',
        css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var url = "jsp/consultaEstudiantesMateria.jsp?codigoMateria=" + codigoMateria + "&grupo=" + grupo;
    xhttp.open("post", url, true);
    xhttp.send();
}

function registrarAsesoria() {
    var materia = document.getElementById('materia').value;
    var estudiante = document.getElementById('estudiantesMateria').value;
    var tema = document.getElementById('temaTratado').value;

    if (materia == "Seleccione la materia" || estudiante == "Seleccione el estudiante"
            || tema.length == 0) {
        $.unblockUI();
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
        var marcado = $("#chFecha").prop("checked") ? true : false;
        var fecha = "";
        var hora = "";
        if (marcado == false) {
            alert("fecha manual");
            fecha = document.getElementById('fechaAsesoria').value;
            hora = document.getElementById('horaAsesoria').value;
        } else {
            fecha = "auto";
        }

        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText.indexOf('error') > -1) {
                    $.unblockUI();
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
                    toastr["error"]("Ocurrió un error al momento de registrar la asesoria, intentlo de nuevo.", "Error!");
                    window.location.reload();
                } else {
                    var info = xhttp.responseText;
                    $.unblockUI();
                    document.getElementById('asesoriasRegistradas').innerHTML += info;
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
                    toastr["success"]("Asesoria registrada.", "Exito!");
                }
            }
        };
        $.blockUI({
            message: 'Registrando asesoria',
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }});
        var url = "jsp/registraAsesoria.jsp?materia=" + materia + "&estudiante=" + estudiante
                + "&tema=" + tema + "&fecha=" + fecha + "&hora=" + hora;
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
                        $.unblockUI();
                        if (info.indexOf('vacio') > -1) {
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
                        } else {
                            document.getElementById('horarios').innerHTML = info;
                        }
                    }
                }
            };

            $.blockUI({
                message: 'Consultando horario, Por favor espere',
                css: {
                    border: 'none',
                    padding: '15px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});

            var url = "jsp/consultarHorario.jsp?tipoConsulta=" + tipoConsulta + "&consultaPor=" + consultaPor
                    + "&grupo=" + grupo + "&entrada=" + entrada;
            xhttp.open("post", url, true);
            xhttp.send();
        }
    }
}

function cargarFecha() {
    var marcado = $("#chFecha").prop("checked") ? true : false;

    if (marcado == false) {
        document.getElementById('fechaAseso').style.display = "block";
    } else {
        document.getElementById('fechaAseso').style.display = "none";
    }
}

function generarInforme() {
    var periodo = document.getElementById("periodoInforme").value;
    var ano = document.getElementById("anoInforme").value;

    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            if (xhttp.responseText.indexOf('error') > -1) {
                alert("error");
            } else {
                var info = xhttp.responseText;
                $.unblockUI();
                alert(info);
                window.open('jsp/informe/informe.pdf');
            }
        }
    };
    $.blockUI({
        message: 'Generando informe',
        css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var url = "jsp/consultarPdf.jsp?periodo=" + periodo + "&ano=" + ano;
    xhttp.open("post", url, true);
    xhttp.send();
}


function cambiarJornada() {
    var tarde = document.getElementById('jornadaTarde');
    var manana = document.getElementById('jornadaManana');

    if (manana.style.display === 'block') {
        manana.style.display = 'none';
        tarde.style.display = 'block';
    } else {
        manana.style.display = 'block';
        tarde.style.display = 'none';
    }
}

function cargarFechaModal() {

}

function registrarAsesoriaExterna() {
    var codigoEst = document.getElementById('codEstExterno').value;
    var nombreEst = document.getElementById('nombreEstExterno').value;
    var fecha = document.getElementById('fechaAsesoriaExterna').value;
    var hora = document.getElementById('horaAsesoriaExterna').value;
    var codigoMat = document.getElementById('codigoAsesoriaExterna').value;
    var nombreMat = document.getElementById('nombreAsesoriaExterna').value;
    var tema = document.getElementById('temaAsesoriaExterna').value;

    if (codigoEst.length == 0 || nombreEst.length == 0 || fecha.length == 0 ||
            hora.length == 0 || codigoMat.length == 0 || nombreMat.length == 0 ||
            tema.length == 0) {
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
        toastr["error"]("Por favor complete todos los campos", "Error!");
    } else {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText.indexOf('error') > -1) {
                    alert("error");
                } else {
                    var info = xhttp.responseText;
                    $.unblockUI();
                    alert(info);
                    var msg = "<tr>"+
                        "<td align='center'>" + codigoMat + "</td>" +
                        "<td align='center'>" + nombreMat + "</td>"+
                        "<td align='center'> - </td>"+
                        "<td align='center'>" + nombreEst + "</td>"+
                        "<td align='center'>" + codigoEst + "</td>"+
                        "<td align='center'>" + fecha + "</td>"+
                        "<td align='center'>" + hora + "</td>"+
                    "</tr>";
                    document.getElementById('asesoriasRegistradas').innerHTML += msg;
                    
                }
            }
        };
        $("#myModal").modal("hide");
        $.blockUI({
            message: 'REgistrando asesoria',
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }});
        var url = "jsp/registrarAsesoriaExterna.jsp?codigoEst=" + codigoEst + "&nombreEst=" + nombreEst +
                "&fecha=" + fecha + "&hora=" + hora + "&codigoMat=" + codigoMat + "&nombreMat=" + nombreMat +
                "&tema=" + tema;
        xhttp.open("post", url, true);
        xhttp.send();
    }
}

function asesoriasDocentes() {
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            if (xhttp.responseText.indexOf('error') > -1) {
                alert("error");
            } else {
                var info = xhttp.responseText;
                $.unblockUI();
                alert(info);
                window.open("jsp/informe/Asesorias Docente " + info + ".pdf");
            }
        }
    };
    $.blockUI({
        message: 'Consultando asesoria, espere',
        css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var url = "jsp/formatoAsesoriasPDF.jsp";
    xhttp.open("post", url, true);
    xhttp.send();
}

function eliminarHorario(id) {
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            if (xhttp.responseText.indexOf('error') > -1) {
                alert("error");
            } else {
                var info = xhttp.responseText;
                $.unblockUI();
                alert(info);
                window.location.reload();
            }
        }
    };
    $.blockUI({
        message: 'Eliminando horario de asesoria',
        css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        }});
    var url = "jsp/eliminarHorario.jsp?id=" + id;
    xhttp.open("post", url, true);
    xhttp.send();
}

function registrarHorario() {
    var dia = document.getElementById('diaAseso').value;
    var horaInicio = document.getElementById('horaIniAseso').value;
    var horaFin = document.getElementById('horaFinAseso').value;

    if (horaInicio == "" || horaFin == "") {
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
        toastr["warning"]("Datos incompletos.", "Alerta!");
    } else {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                if (xhttp.responseText.indexOf('error') > -1) {
                    alert("error");
                } else {
                    var info = xhttp.responseText;
                    $.unblockUI();
                    window.location.reload();
                }
            }
        };
        $.blockUI({
            message: 'Registrando asesoria',
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }});
        var url = "jsp/registrarHorarioAsesoria.jsp?dia=" + dia + "&horaInicio=" + horaInicio + "&horaFin=" + horaFin;
        xhttp.open("post", url, true);
        xhttp.send();
    }

}