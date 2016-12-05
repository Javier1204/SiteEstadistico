$(document).ready(function () {
    $('#btnMostrarDivRegistro').click(function (e) {
        e.preventDefault();
        $('#divRegistro').show();
        $('#btnMostrarDivRegistro').hide();
        $('#btnOcultarDivRegistro').show();
    });

    $('#btnOcultarDivRegistro').click(function (e) {
        e.preventDefault();
        $('#divRegistro').hide();
        $('#btnMostrarDivRegistro').show();
        $('#btnOcultarDivRegistro').hide();
    });

    $('#tipoIntegrante').change(function (e) {
        e.preventDefault();
        var tipo = $('#tipoIntegrante').val();
        if (tipo === "1") {
            $.ajax({
                url: "/GestionGrupos/DocenteController",
                type: "POST",
                data: {
                    accion: "1"
                }
            }).done(function (respuesta) {
                var array = $.parseJSON(respuesta);
                $('#selectIntegrante').html("");
                for (var i = 0; i < array.length; i++) {
                    $('#selectIntegrante').append("<option value='" + array[i].codigo + "'>" + array[i].nombres + " " + array[i].apellidos + "</option>");
                }
            });
        } else {
            $.ajax({
                url: "/GestionGrupos/EstudianteController",
                type: "POST",
                data: {
                    accion: "1"
                }
            }).done(function (respuesta) {
                var array = $.parseJSON(respuesta);
                $('#selectIntegrante').html("");
                for (var i = 0; i < array.length; i++) {
                    $('#selectIntegrante').append("<option value='" + array[i].codigo + "'>" + array[i].nombres + " " + array[i].apellidos + "</option>");
                }
            });
        }
    });

    if ($("#formRegistrarIntegrante").length > 0) {
        $("#formRegistrarIntegrante").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/IntegrantesController",
                data: $("#formRegistrarIntegrante").serialize(),
                success: function (data) {

                    if (data === "Registro Exitoso") {
                        $('#divRegistro').hide();
                        listarIntegrantesPorGrupo($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }

    if ($("#formModificarIntegrante").length > 0) {
        $("#formModificarIntegrante").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/IntegrantesController",
                data: $("#formModificarIntegrante").serialize(),
                success: function (data) {

                    if (data === "Modificación Exitosa") {
                        $('#divModificarIntegrante').hide();
                        listarIntegrantes($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }
});

function listarDocentes() {
    $.ajax({
        url: "/GestionGrupos/DocenteController",
        type: "POST",
        data: {
            accion: "1"
        }
    }).done(function (respuesta) {
        var array = $.parseJSON(respuesta);
        $('#selectIntegrante').html("");
        for (var i = 0; i < array.length; i++) {
            $('#selectIntegrante').append("<option value='" + array[i].codigo + "'>" + array[i].nombres + " " + array[i].apellidos + "</option>");
        }
    });
}

function listarIntegrantesPorGrupo(codigoGrupo) {

    $.ajax({
        url: "/GestionGrupos/IntegrantesController",
        type: "POST",
        data: {
            accion: "0", codigoColciencias: codigoGrupo
        }
    }).done(function (respuesta) {
        var array = $.parseJSON(respuesta);

        var x = "";
        for (var i = 0; i < array.length; i++) {
            x += "<tr>";
            x += "<td>" + array[i].codigo + "</td>";
            x += "<td>" + array[i].persona.nombres + "</td>";
            x += "<td>" + array[i].persona.apellidos + "</td>";
            if (array[i].tipo === 2) {
                x += "<td>Estudiante</td>";
            } else {
                x += "<td>Docente</td>";
            }

            if (array[i].estado === true) {
                x += "<td>Activo</td>";
            }
            {
                x += "<td>Inactivo</td>";
            }
            x += "<td><div class='ufps-tooltip'><button onclick='desactivarIntegrante(this)'  id='" + array[i].codigo + "' class='ufps-btn'><i class='fa fa-trash-o' aria-hidden='true'></i></button><span class='ufps-tooltip-content-top'>Desactivar</span></div></td>";
            x += "</tr>";
            $('#tablaIntegrantes').html(x);
        }

    });
}

function desactivarIntegrante(elem) {

    var conf = confirm("Está seguro de querer desactivar el integrante seleccionado?");
    var codigoIntegrante = elem.id;

    if (conf === true) {
        $.ajax({
            type: "POST",
            url: "/GestionGrupos/IntegrantesController",
            data: {
                accion: "3", codigoIntegrante: codigoIntegrante
            },
            success: function (data) {

                listarIntegrantes($('#codigoColciencias').val());
                alert(data);
            }
        });
    }
}