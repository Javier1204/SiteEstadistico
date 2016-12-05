$(document).ready(function () {
    $('#btnMostrarDivRegistro').click(function (e) {
        e.preventDefault();
        $('#divRegistro').show();
        $('#btnMostrarDivRegistro').hide();
    });

    $('#btnOcultarDivRegistro').click(function (e) {
        e.preventDefault();
        $('#divRegistro').hide();
        $('#btnMostrarDivRegistro').show();
        $('#btnOcultarDivRegistro').hide();
    });

    if ($("#formRegistrarProyecto").length > 0) {
        $("#formRegistrarProyecto").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/ProyectosController",
                data: $("#formRegistrarProyecto").serialize(),
                success: function (data) {

                    if (data === "Registro Exitoso") {
                        $('#divRegistro').hide();
                        listarProyectos($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }

    if ($("#formModificarProyecto").length > 0) {
        $("#formModificarProyecto").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/ProyectosController",
                data: $("#formModificarProyecto").serialize(),
                success: function (data) {

                    if (data === "Modificación Exitosa") {
                        $('#divModificarProyecto').hide();
                        listarProyectos($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }
});

function modificarProyecto(elem) {
    var datosProyecto = elem.id;
    var datos = datosProyecto.split("-");

    var codigoProyecto = datos[0];
    var nombre = datos[1];
    var objetivos = datos[2];
    var descripcion = datos[3];

    $('#codigoProyectoModificar').val(codigoProyecto);
    $('#nombreModificar').val(nombre);
    $('#objetivosModificar').val(objetivos);
    $('#descripcionModificar').val(descripcion);
    $('#divModificarProyecto').show();
}

function desactivarProyecto(elem) {

    var conf = confirm("Está seguro de querer desactivar el Proyecto seleccionado?");
    var codigoProyecto = elem.id;

    if (conf === true) {
        $.ajax({
            type: "POST",
            url: "/GestionGrupos/ProyectosController",
            data: {
                accion: "3", codigoProyecto: codigoProyecto
            },
            success: function (data) {

                listarProyectos($('#codigoColciencias').val());
                alert(data);
            }
        });
    }

}

function listarProyectos(codigoGrupo) {

    $.ajax({
        type: "POST",
        url: "/GestionGrupos/ProyectosController",
        data: {
            accion: "0", codigoColciencias: codigoGrupo
        },
        success: function (data) {
            var array = $.parseJSON(data);
            console.log(array);
            var x = "";
            for (var i = 0; i < array.length; i++) {
                x += "<tr>";
                x += "<td>" + array[i].nombreproyecto + "</td>";
                x += "<td>" + array[i].liderproyecto.persona.nombres + " "+ array[i].liderproyecto.persona.apellidos+"</td>";
                x += "<td>" + array[i].fechainicio + "</td>";
                x += "<td>" + array[i].fechafin + "</td>";
                x += "<td>" + array[i].tipofinanciamiento + "</td>";
                x += "</tr>";
                $('#tablaProyectos').html(x);
            }
        }
    });
}