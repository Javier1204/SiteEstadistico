

<div class="row" >
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-content p-xl">
            <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <form  class="form-horizontal" enctype="multipart/form-data"   method="post"  id="FromDatainisiarsecion">
    <div class="form-group">
        <label for="txtemail" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" name="correo_electronico" id="txtemail" placeholder="Email" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="txtpassword" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" name="contrasena" id="txtpassword" placeholder="Password" required="">
        </div>
    </div >
   
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Iniciar Sesion</button>
        </div>
    </div>

                      
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                           <button  type="button"  data-loading-text="Loading..." id="botoasesioni" class="btn btn-primary" onclick="RegistroDataAcademica();" >registrar</button>

                            <%-- <button class="btn btn-primary" type="submit">Aceptar</button>--%>
                        </div>
                    </div>
                </form> 
            </div>
            <div class="col-sm-2"></div>
          </div>
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



        </div>
    </div>
</div>
</div>
<script>
    

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


</script>
       