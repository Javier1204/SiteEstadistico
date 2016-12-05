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
                <form role="form" class="form-horizontal" enctype="multipart/form-data"   method="post"  id="FromDataPersonal"> 
                    
                  
                

                     <input type="hidden" class="form-control" name="id_estudiante" id="id_estudiante" placeholder="id_estudiante" >
             
                    <div class="form-group"><label class="col-sm-3 control-label">Nombre</label>

                        <div class="col-sm-9"><input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" required></div>
                    </div>
                     <div class="hr-line-dashed"></div>
                    <div class="form-group"><label class="col-sm-3 control-label">Apellidos</label>

                        <div class="col-sm-9"><input type="text" class="form-control" name="apellido" id="apellido" placeholder="Apellido" required></div>
                    </div>
                     <div class="hr-line-dashed"></div>
                     <div class="form-group"><label class="col-sm-3 control-label">Tipo Documento</label>

                         <div class="col-sm-4"><select class="form-control m-b" name="tipo_documento" id="tipo_documento">
                                 <option value="1">Cedula</option>
                                        <option value="2">Tarjeta</option>                   
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                      
                     <div class="form-group"><label class="col-sm-3 control-label">Numero Documento</label>

                         <div class="col-sm-9"><input type="number" class="form-control" name="documento" id="documento" placeholder="Numero Documento" required></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                      
                     <div class="form-group"><label class="col-sm-3 control-label">Fecha Nacimiento</label>

                         <div class="col-sm-9">
                            <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="fecha_nacimiento"  name="fecha_nacimiento" class="form-control date-picker" >
                                </div>
                         </div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                      
                    <div class="form-group"><label class="col-sm-3 control-label">Lugar de Nacimiento</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="pais" id="pais" placeholder="Pais">
                                        <option value="1">Pais</option>                                                        
                                        <option value="2">colombia</option>                                                        
                                        <option value="3">argentina</option>                                                        
                                        <option value="4">peru</option>                                                        
                                    </select>
                                    </div>
                        <div class="col-sm-3"><select class="form-control m-b" name="departamento" id="departamento" placeholder="Departamento">
                                         <option  value="1">Departamento</option>                                                       
                                        <option  value="2">Antioquia</option>                                                       
                                        <option  value="3">Caldas</option>                                                       
                                        <option  value="4">Bogotá D.C.</option>                                                       
                                        <option  value="5">Bolívar</option>                                                       
                                        <option  value="6">Sucre</option>                                                       
                                        <option  value="7">Arauca</option>                                                         
                                    </select>
                                    </div>
                                    <div class="col-sm-3"><select class="form-control m-b" name="municipio" id="municipio" placeholder="Municipio">
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
                      
                      <div class="form-group"><label class="col-sm-3 control-label">Genero</label>

                          <div class="col-sm-4"><select class="form-control m-b" name="genero" id="genero">
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>                   
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                      
                      
                      <div class="form-group"><label class="col-sm-3 control-label">Edad</label>

                          <div class="col-sm-4"><select class="form-control m-b" name="edad" id="edad">
                                        <option value="1">1</option>
                                        <option value="2">2</option>                   
                                        <option value="3">3</option>                   
                                        <option value="4">4</option>                   
                                        <option value="5">5</option>                   
                                        <option value="6">6</option>                   
                                        <option value="7">7</option>                   
                                        <option value="8">8</option>                   
                                        <option value="9">9</option>                   
                                        <option value="10">10</option>                   
                                        <option value="11">11</option>                   
                                        <option value="12">12</option>                   
                                        <option value="13">13</option>                   
                                        <option value="14">14</option>                   
                                        <option value="15">15</option>                   
                                        <option value="16">16</option>                   
                                        <option value="17">17</option>                   
                                        <option value="18">18</option>                   
                                        <option value="19">19</option>                   
                                        <option value="20">20</option>                   
                                        <option value="21">21</option>                   
                                        <option value="22">22</option>                   
                                        <option value="23">23</option>                   
                                        <option value="24">24</option>                   
                                        <option value="25">25</option>                   
                                        <option value="26">26</option>                   
                                                       
                                                         
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                      <div class="form-group"><label class="col-sm-3 control-label">Estado Civil</label>

                          <div class="col-sm-4"><select class="form-control m-b" name="estado_civil" id="estado_civil">
                                        <option value="1">Soltero</option>
                                        <option value="2">Casado</option>                   
                                        <option value="3">Union Libre</option>                                                                           
                                                         
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                      
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-6">
                                             <button  type="button"  data-loading-text="Loading..." id="butactualizar" class="btn btn-primary" onclick="RegistroDataPersonal();" >registrar</button>

                                             <%--     <button class="btn btn-primary" type="submit">Aceptar</button> --%>
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
                        <div class="fg-line" id="resultDataPersonal">

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

  

$('#fecha_nacimiento').datepicker({
                 format: "yyyy-mm-dd",
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

   

</script>
