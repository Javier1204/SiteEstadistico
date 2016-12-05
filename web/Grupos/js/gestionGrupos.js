$(document).ready(function () {
    if ($("#formRegistrarGrupo").length > 0) {
        $("#formRegistrarGrupo").bind("submit", function () {
            
            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/GestionGrupos/GrupoController",
                data: $("#formRegistrarGrupo").serialize(),
                success: function (data) {
                    alert(data);
                    $('#divCargando').hide();
                }
            });
            return false;

        });
    }
});

function listarGrupos(){
    $.ajax({
        url:"/GestionGrupos/GrupoController",
        type:"POST",
        data: {
            accion: "0"
        }
    }).done(function(respuesta){
        console.log(respuesta);
       $('#form-listado').html(respuesta); 
    });
}