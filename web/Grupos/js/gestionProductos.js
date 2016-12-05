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

    if ($("#formRegistrarProducto").length > 0) {
        $("#formRegistrarProducto").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/ProductosController",
                data: $("#formRegistrarProducto").serialize(),
                success: function (data) {

                    if (data === "Registro Exitoso") {
                        $('#divRegistro').hide();
                        alert(data);
                        listarProductos($('#selecProyecto').val());
                        $('#divRegistro').show();
                    } else {
                        alert(data);
                        $('#divCargando').hide();
                    }
                }
            });
            return false;

        });
    }

    if ($("#formModificarProducto").length > 0) {
        $("#formModificarProducto").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/ProductosController",
                data: $("#formModificarProyecto").serialize(),
                success: function (data) {

                    if (data === "Modificación Exitosa") {
                        $('#divModificarProducto').hide();
                        alert(data);
                        listarProyectos($('#codigoColciencias').val());
                    } else {
                        alert("No se pudo registrar el producto");
                    }

                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }

    $('#proyecto').change(function (e) {
        e.preventDefault();
        $('#codigoProyecto').val($('#proyecto').val());
    });
});

function modificarProducto(elem) {
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

function listarProductos() {

    var codigoProyecto = $('#selecProyecto').val();
    $.ajax({
        type: "POST",
        url: "/GestionGrupos/ProductosController",
        data: {
            accion: "0", codigoProyecto: codigoProyecto
        },
        success: function (data) {
            var array = $.parseJSON(data);
            console.log(array);
            var x = "";
            $('#tablaProductos').html("");
            for (var i = 0; i < array.length; i++) {
                x += "<tr>";
                x += "<td>" + array[i].codigoproducto + "</td>";
                x += "<td>" + array[i].tipoproducto.descripcion + "</td>";
                x += "<td>" + array[i].informaciontecnica + "</td>";
                x += "</tr>";
                $('#tablaProductos').html(x);
            }
        }
    });
}