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

    if ($("#formRegistrarLinea").length > 0) {
        $("#formRegistrarLinea").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/LineasController",
                data: $("#formRegistrarLinea").serialize(),
                success: function (data) {

                    if (data === "Registro Exitoso") {
                        $('#divRegistro').hide();
                        listarLineas($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }

    if ($("#formModificarLinea").length > 0) {
        $("#formModificarLinea").bind("submit", function () {

            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/LineasController",
                data: $("#formModificarLinea").serialize(),
                success: function (data) {

                    if (data === "Modificación Exitosa") {
                        $('#divModificarLinea').hide();
                        listarLineas($('#codigoColciencias').val());
                    }
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }
});

function modificarLinea(elem) {
    var datosLinea = elem.id;
    var datos = datosLinea.split("-");

    var codigoLinea = datos[0];
    var nombre = datos[1];
    var objetivos = datos[2];
    var descripcion = datos[3];

    $('#codigoLineaModificar').val(codigoLinea);
    $('#nombreModificar').val(nombre);
    $('#objetivosModificar').val(objetivos);
    $('#descripcionModificar').val(descripcion);
    $('#divModificarLinea').show();
}

function eliminarLinea(elem) {

    var conf = confirm("Está seguro de querer eliminar la Línea seleccionada? Tenga en cuenta que esto es irreversible");
    var codigoLinea = elem.id;

    if (conf === true) {
        $.ajax({
            type: "POST",
            url: "/GestionGrupos/LineasController",
            data: {
                accion: "3", codigoLinea: codigoLinea
            },
            success: function (data) {

                listarLineas($('#codigoColciencias').val());
                alert(data);
            }
        });
    }

}

function listarLineas(codigoGrupo) {

    $.ajax({
        type: "POST",
        url: "/GestionGrupos/LineasController",
        data: {
            accion: "0", codigoGrupo: codigoGrupo
        },
        success: function (data) {
            var array = $.parseJSON(data);
            console.log(array);
            console.log(array[0].nombre);
            var x = "";
            for (var i = 0; i < array.length; i++) {
                x += "<tr>";
                x += "<td>" + array[i].nombre + "</td>";
                x += "<td>" + array[i].objetivos + "</td>";
                x += "<td>" + array[i].descripcion + "</td>";
                x += "<td><div class='ufps-tooltip'><button onclick='modificarLinea(this)' name='btnModificar' id='" + array[i].codigolinea + "-" + array[i].nombre + "-" + array[i].objetivos + "-" + array[i].descripcion + "' class='ufps-btn'><i class='fa fa-cog' aria-hidden='true'></i></button><span class='ufps-tooltip-content-top'>Modificar</span></div></td>";
                x += "<td><div class='ufps-tooltip'><button onclick='eliminarLinea(this)'  id='" + array[i].codigolinea + "' class='ufps-btn'><i class='fa fa-trash-o' aria-hidden='true'></i></button><span class='ufps-tooltip-content-top'>Eliminar</span></div></td>";
                x += "</tr>";
                $('#tablaLineas').html(x);
            }
        }
    });
}