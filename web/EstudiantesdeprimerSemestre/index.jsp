<!DOCTYPE html>


<html>


<!-- Mirrored from webapplayers.com/inspinia_admin-v2.5/dashboard_4.html


 <link href="../EstudiantesdeprimerSemestre/css/bootstrap.min.css" rel="stylesheet">






by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Apr 2016 18:57:38 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Departamento de sistemas e Informática UFPS</title>

    <link href="../EstudiantesdeprimerSemestre/css/bootstrap.min.css" rel="stylesheet">

    <link href="../EstudiantesdeprimerSemestre/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../EstudiantesdeprimerSemestre/css/animate.css" rel="stylesheet">
    <link href="../EstudiantesdeprimerSemestre/css/style.css" rel="stylesheet">
 
    
   
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"/>


    
    
    
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown" style="margin: 7% auto;
padding: 20px;
background: rgb(255, 255, 255) none repeat scroll 0% 0%;
position: static;">
        <div style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;
max-width: 276px;">
            <div>

<!--                <h1 class="logo-name">CF+</h1>
<img src="../EstudiantesdeprimerSemestre/img/logo2.png" style="max-width: 77px;">

-->

            </div>
            <h3>Bienvenido a Estudiantes</h3>
<!--            <p>BIENVENIDO AL SISTEMAS DE INFORMACION PARA EL APOYO DEL CURSO DE PROFUNDIZACION DE SOFTWARE
               Luchamos cada dia mas, por el bienestar del programa. Continually expanded and constantly improved Inspinia Admin Them (IN+)
            </p>-->
            <p>Inicia Sesion</p>
             <form  class="form-horizontal"   id="FromDatainisiarsecion"  action="../EstudiantesdeprimerSemestre/VerificarUsuario.jsp">
                <div class="form-group">
                    <input type="email" name="correo_electronico" id="correo_electronico" class="form-control" placeholder="Correo" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="contrasena" id="contrasena" class="form-control" placeholder="Password" required="">
                </div>
                
                <button type="submit" class="btn btn-primary block full-width m-b">Inicia Sesion</button>
                    

                <br> 
                <p class="text-center" style="margin-top: 8px;"><small style="color: black;">¿No tienes cuenta?</small></p>
                <a class="" style="color: #ed5565;" href="#" onclick="RegistrarUser();">Registrate!</a>
                 
                
            </form>
            <div class="row">
                <div class="col-sm-3">                
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="fg-line" id="resultdataacseseion">

                        </div>
                    </div>
                </div>
                <div class="col-sm-3">                
                </div>
            </div>
            <p class="m-t"> <small>Sistema Estudiantes  &copy; 2016</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="../EstudiantesdeprimerSemestre/js/jquery-2.1.1.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/bootstrap.min.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/funciones.js"></script>
<script>



</script>
  

<!-- Mirrored f


          $('#FromDatainisiarsecion').submit(function (e) {
        var data = new FormData(this); //Creamos los datos a enviar con el formulario
        $.ajax({
            url: '../VerificarUsuario.jsp', //URL destino
            data: data,
            processData: false, //Evitamos que JQuery procese los datos, daría error
            contentType: false, //No especificamos ningún tipo de dato
            type: 'POST',
            success: function (data) {
                $('#resultdataacseseion').html(data);
            }
        });

        e.preventDefault(); //Evitamos que se mande del formulario de forma convencional
    });

rom webapplayers.com/inspinia_admin-v2.5/dashboard_4.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Apr 2016 18:57:38 GMT -->
</html>
