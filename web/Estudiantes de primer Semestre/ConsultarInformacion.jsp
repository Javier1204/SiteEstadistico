  <link href="../EstudiantesdeprimerSemestre/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
  <link href="../EstudiantesdeprimerSemestre/css/plugins/dataTables/datatables.min.css" rel="stylesheet">

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <h2 class="text-center"><a href="#" onclick="MDEconsultarFormulario();">Consultar Informacion</a></h2>
    </div>
  
    <div class="col-sm-3"></div>
</div>

<div class="row" >
<div class="col-lg-12">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-content p-xl">
            <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <form role="form" class="form-horizontal" enctype="multipart/form-data"   method="post"  id="FromRegistroDocente"> 
                    

                     <div class="form-group">
                         
                         <label class="col-sm-2 control-label">Edad</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="poredad" > 
                                    </div>
                         <label class="col-sm-1 control-label">Rango</label>

                              <div class="col-sm-3"><input type="number" class="form-control" name="edad1" id="edad1" placeholder="" required></div>
                              <div class="col-sm-2 text-center"> A </div>
                              <div class="col-sm-3"><input type="number" class="form-control" name="edad2" id="edad2" placeholder="" required></div>

                      </div>
                    
                    <div class="hr-line-dashed"></div>
                    
                    <div class="form-group"><label class="col-sm-2 control-label">Genero</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="porgene" > 
                                    </div>

                         <div class="col-sm-3"><select class="form-control m-b" name="genero" id="genero">
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>                   
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                      
                    <div class="form-group"><label class="col-sm-2 control-label">Estado Cvil</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="porcivi" > 
                                    </div>
                         <div class="col-sm-3"><select class="form-control m-b" name="estado_civil" id="estado_civil">
                                        <option value="1">Soltero</option>
                                        <option value="2">Casado</option>                   
                                        <option value="3">Union Libre</option>                                                                           
                                        <option value="4">...</option>                   
                                    </select>
                                    </div>
                     </div>
                      
                      <div class="hr-line-dashed"></div>
                      
                     <div class="form-group">
                        
                       
                        <label class="col-sm-2 control-label">lectura</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="porlec" > 
                                    </div>

                         <div class="col-sm-3"><input type="number" class="form-control" name="lectura" id="lectura" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                      
                   <div class="hr-line-dashed"></div> 
                    
                    
                    <div class="form-group">
                        
                       
                       <label class="col-sm-2 control-label">Ciencias naturales</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="porcienc" > 
                                    </div>

                         <div class="col-sm-3"><input type="number" class="form-control" name="naturales" id="naturales" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   
                   <div class="hr-line-dashed"></div> 
                    
                
                    <div class="form-group">
                        
                       
                       <label class="col-sm-2 control-label">Ciencias Sociales</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="porsoci" > 
                                    </div>
                         <div class="col-sm-3"><input type="number" class="form-control" name="sociales" id="sociales" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
                    
                    <div class="form-group">
                        
                      
                        <label class="col-sm-2 control-label">Ingles</label>

                                    <div class="col-sm-1">
                                        <input type="checkbox" id="poring" > 
                                    </div>

                         <div class="col-sm-3"><input type="number" class="form-control" name="ingles" id="ingles" placeholder="" required></div>
                         <div class="col-sm-2"></div>
                    </div>
                   <div class="hr-line-dashed"></div> 
                    
                   
                   
                    <div class="form-group">
                        
                        <div class="col-sm-12 text-center">
                                             <button  type="button"  data-loading-text="Loading..." id="butactvoconsultaavar" class="btn btn-primary" onclick="BsquedaAvnzada();" >Buscar</button>

                                             <%--     <button class="btn btn-primary" type="submit">Aceptar</button> --%>
                        </div>
                      
                    </div>
                       
                         
                     </div>
                      
                       
                    
                   
                      
                    
                </form> 
            </div>
            <div class="col-sm-2"></div>
          </div>
           <div class="row">
               
                <div class="col-sm-12">
                    <div class="form-group">
                        <div class="fg-line" id="resultconsultavanxa">

                        </div>
                    </div>
                </div>
               
            </div> 



        </div>
    </div>
</div>
</div>

   <script src="../EstudiantesdeprimerSemestre/js/plugins/dataTables/datatables.min.js"></script>
<script>

  




</script>
