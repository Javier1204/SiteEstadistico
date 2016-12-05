<link href="../EstudiantesdeprimerSemestre/css/plugins/iCheck/custom.css" rel="stylesheet">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-2"></div>
    <div class="col-sm-4">
        <h2 class="text-center"><a href="#" onclick="MDEregistrarFormulario();">Datos Personales</a></h2>
    </div>
    <div class="col-sm-4">
        <h2 class="text-center"><a href="#" onclick="MDEregistrarFormulario2();">Datos Academicos</a></h2>
    </div>
    <div class="col-sm-2"></div>
</div>

<div class="row" >
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-content p-xl">
            <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <form role="form" class="form-horizontal" enctype="multipart/form-data"   method="post"  id="FromDataAcademica"> 
                                         <input type="hidden" class="form-control" name="id_estudiante" id="id_estudiante" value="1" placeholder="id_estudiante" >

                     <div class="form-group"><label class="col-sm-9 control-label">Departamento del colegio donde se graduo de bachiller</label>

                         <div class="col-sm-3"><select class="form-control m-b" name="departamento_grado" id="departamento_grado">
                                        <option  value="1">Departamento</option>                                                       
                                        <option  value="2">Antioquia</option>                                                       
                                        <option  value="3">Caldas</option>                                                       
                                        <option  value="4">Bogotá D.C.</option>                                                       
                                        <option  value="5">Bolívar</option>                                                       
                                        <option  value="6">Sucre</option>                                                       
                                        <option  value="7">Arauca</option>                                                       
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                    
                    
                    <div class="form-group"><label class="col-sm-9 control-label">Municipio del colegio donde se graduo de bachiller</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="municipio_grado" id="municipio_grado">
                                        <option  value="1">Municipio</option>                                                       
                                        <option  value="2">Abejorral</option>                                                       
                                        <option  value="3">El Carmen</option>                                                       
                                        <option  value="4">El Cocuy</option>                                                       
                                        <option  value="5">El Roble</option>                                                       
                                        <option  value="6">El Zulia</option>                                                       
                                        <option  value="7">Gramalote</option>                                                       
                                                                                             
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                    
                    
                    <div class="form-group"><label class="col-sm-7 control-label">Colegio donde se graduo de bachiller</label>

                        <div class="col-sm-5"><input type="text" class="form-control" name="colegio_grado" id="colegio_grado" placeholder="" required></div>
                    </div>
                       <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-7 control-label">Especialidad del colegio donde se graduo</label>

                        <div class="col-sm-5"><input type="text" class="form-control" name="especialidad" id="especialidad" placeholder="especialidad" required></div>
                    </div>
                       <div class="hr-line-dashed"></div>
                      
                      
                      
                      <div class="form-group"><label class="col-sm-9 control-label">En que año se gradu de bachiller</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="ano_grado" id="ano_grado">
                                        <option  value="1">2005</option>                                                       
                                        <option  value="2">2006</option>                                                       
                                        <option  value="3">2007</option>                                                       
                                        <option  value="4">2008</option>                                                       
                                        <option  value="5">2010</option>                                                       
                                        <option  value="6">2011</option>                                                       
                                        <option  value="7">2012</option>                                                       
                                        <option  value="7">2013</option>                                                       
                                        <option  value="7">2014</option>                                                       
                                        <option  value="7">2015</option>                                                       
                                        <option  value="7">2016</option>                                                       
                                                                                             
                                                                                             
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                     <div class="hr-line-dashed"></div>
                     <div class="form-group"><label class="col-sm-9 control-label">valido bachiberato</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="valida" id="valida">
                                        <option  value="1">si</option>                                                       
                                        <option  value="2">no</option>                                                       
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-12 control-label">Idiomas que habla ademas del español ?</label>                
                    </div>
                     <div class="hr-line-dashed"></div>
                    
                     <div class="form-group">

                         <div class="col-sm-12"><label class="checkbox-inline"> <input type="checkbox" value="1" id="inlineCheckbox1"> </label> <label class="checkbox-inline col-sm-2">
                                 <input type="checkbox" value="2" name="idioma"   id="inlineCheckbox2"> Ingles</label> <label class="checkbox-inline col-sm-2">
                                     <input type="checkbox" value="3" name="idioma" id="inlineCheckbox3"> Frances </label> <label class="checkbox-inline col-sm-2">
                                         <input type="checkbox" value="4" name="idioma" id="inlineCheckbox4"> Aleman </label> <label class="checkbox-inline col-sm-2">
                                             <input type="checkbox" value="5" name="idioma" id="inlineCheckbox5"> Otros </label> <label class="checkbox-inline col-sm-2">
                                                 <input type="checkbox" value="6" name="idioma" id="inlineCheckbox6"> Ninguno </label></div>
                     </div>

                     <div class="hr-line-dashed"></div>

                    
                    
                    <div class="form-group"><label class="col-sm-9 control-label">Mecanismos para su ingreso a la universidad</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="ingreso" id="ingreso">
                                        <option  value="1">Trabaja</option>                                                       
                                        <option  value="2">Padres</option>                                                       
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                    
                    
                    <div class="form-group">
                        
                        <div class="col-sm-3"></div>
                        <label class="col-sm-3 control-label">Lectura</label>

                         <div class="col-sm-3"><input type="number" class="form-control" name="lectura" id="lectura" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
                    
                    <div class="form-group">
                        
                        <div class="col-sm-3"></div>
                        <label class="col-sm-3 control-label">Ciencias Naturales</label>

                         <div class="col-sm-3"><input type="number" class="form-control" name="naturales" id="naturales" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
                    
                    <div class="form-group">
                        
                        <div class="col-sm-3"></div>
                        <label class="col-sm-3 control-label">Ciencias Sociales</label>

                         <div class="col-sm-3"><input type="number" class="form-control" name="sociales" id="sociales" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
                    
                    <div class="form-group">
                        
                        <div class="col-sm-3"></div>
                        <label class="col-sm-3 control-label">Ingles</label>

                         <div class="col-sm-3"><input type="number" class="form-control" name="ingles" id="ingles" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
          
                   
                      
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-6">
                           <button  type="button"  data-loading-text="Loading..." id="botoacademi" class="btn btn-primary" onclick="RegistroDataAcademica();" >registrar</button>

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
                        <div class="fg-line" id="resultdataacedemica">

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
 <script src="../EstudiantesdeprimerSemestre/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script>

  

$('#data_1 .input-group.date').datepicker({
                 format: "yyyy-mm-dd",
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });
            $('#FromDataAcademica').submit(function (e) {
        var data = new FormData(this); //Creamos los datos a enviar con el formulario
        $.ajax({
            url: '../RegistraAcademica.jsp', //URL destino
            data: data,
            processData: false, //Evitamos que JQuery procese los datos, daría error
            contentType: false, //No especificamos ningún tipo de dato
            type: 'POST',
            success: function (data) {
                $('#resultdataacedemica').html(data);
            }
        });

        e.preventDefault(); //Evitamos que se mande del formulario de forma convencional
    });


</script>
<script src="../EstudiantesdeprimerSemestre/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            });
        </script>