$(document).ready(function () {

    if ($("#formLogin").length > 0) {
        $("#formLogin").bind("submit", function () {
            
            $('#divCargando').show();
            $.ajax({
                type: "POST",
                url: "/ufps_67-GestionGrupos/LoginServlet",
                data: $("#formLogin").serialize(),
                success: function (data) {

                    if (data === "admin") {
                        document.location.href = "/ufps_67-GestionGrupos/admin/perfil.jsp";
                    } else if (data === "director") {
                        document.location.href = "/ufps_67-GestionGrupos/director/perfil.jsp";
                    } else if (data === "docente") {
                        document.location.href = "/ufps_67-GestionGrupos/docente/perfil.jsp";
                    } else if (data === "estudiante") {
                        document.location.href = "/ufps_67-GestionGrupos/estudiante/perfil.jsp";
                    } else{
                        alert(data);
                        $('#divCargando').hide();
                    }
                }
            });
            return false;

        });
    }
});