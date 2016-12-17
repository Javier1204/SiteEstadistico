
<!DOCTYPE html>
<html>


<!-- Mirrored from webapplayers.com/inspinia_admin-v2.5/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Apr 2016 18:52:11 GMT -->
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

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div style="background-color: #f3f3f4;padding: 22px;border-radius: 14px;">
<!--            <div>

                <h1 class="logo-name">CS</h1>

            </div>-->
<div>

<!--                <h1 class="logo-name">CF+</h1>


<img src="../EstudiantesdeprimerSemestre/img/logo2_1.png" style="max-width: 77px;">
-->
            </div>
            <h3>Registro De Usuarios</h3>
            <p>Por favor todos los datos son obligatorios.</p>
            <form class="m-t" role="form" id="FromUser" >
                <div class="form-group">
                    <input type="number" id="codigo" name="codigo" class="form-control" placeholder="Codigo" required="">
                </div>
                <div class="form-group">
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre" required="">
                </div>
                <div class="form-group">
                    <input type="email" id="correo_electronico" name="correo_electronico" class="form-control" placeholder="Correo" required="">
                </div>
                
                 <div class="form-group">
                     <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Clave" required="">
                </div>
                
                 <div class="form-group">
                                <select class="form-control" id="tipo">
                                    <option value="Administrador">Administrador</option>
                                    <option value="Estudiante">Estudiante</option>
                                </select>               
                 </div>
                

                <br> <br> <br> 
               
 <button  type="button"  data-loading-text="Loading..." id="botonreuser" class="btn btn-primary block full-width m-b" onclick="RegistrarUsuario();" >registrar</button>
                <p class="text-muted text-center"><small style="color: black">Ya estas registrado?</small></p>
                <a class="btn btn-sm btn-white btn-block" onclick="ModuloPrimerSemestre();">Login</a>
            </form>
             <div class="row">
                <div class="col-sm-2">                
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <div class="fg-line" id="resultdataaeser">

                        </div>
                    </div>
                </div>
                <div class="col-sm-2">                
                </div>
            </div> 
            <p class="m-t"> <small>Cursoft &copy; 2016</small> </p>
        </div>
    </div>

 
   

<script>

  



</script>
        <script>
           
        </script>