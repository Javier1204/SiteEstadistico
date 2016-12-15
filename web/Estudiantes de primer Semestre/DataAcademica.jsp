<link href="../EstudiantesdeprimerSemestre/css/plugins/iCheck/custom.css" rel="stylesheet">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-2"></div>
    <div class="col-sm-4">
        <h2 class="text-center text-navy"><a href="#" onclick="MDEregistrarFormulario();">Datos Personales</a></h2>
    </div>
    <div class="col-sm-4">
        <h2 class="text-center "><a href="#" onclick="MDEregistrarFormulario2();">Datos Academicos</a></h2>
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
                                         <input type="hidden" class="form-control" name="id_estudiante" id="id_estudiante" value="<%=session.getAttribute("codigo") %>" placeholder="id_estudiante" >

                     <div class="form-group"><label class="col-sm-9 control-label">Departamento del colegio donde se graduo de bachiller</label>

                         <div class="col-sm-3">
                             <select class="form-control m-b" name="departamento_grado" id="departamento_grado">                        
                                        <option value="1">AMAZONAS</option>
                                        <option value="2">ANTIOQUIA</option>
                                        <option value="3">ARAUCA</option>
                                        <option value="4">ATLANTICO</option>
                                        <option value="5">BOLIVAR</option>
                                        <option value="6">BOYACA</option>
                                        <option value="7">CALDAS</option>
                                        <option value="8">CAQUETA</option>
                                        <option value="9">CASANARE</option>
                                        <option value="10">CAUCA</option>
                                        <option value="11">CESAR</option>
                                        <option value="12">CHOCO</option>
                                        <option value="13">CORDOBA</option>
                                        <option value="14">CUNDINAMARCA</option>
                                        <option value="15">GUAINIA</option>
                                        <option value="16">GUAVIARE</option>
                                        <option value="17">HUILA</option>
                                        <option value="18">LA GUAJIRA</option>
                                        <option value="19">MAGDALENA</option>
                                        <option value="20">META</option>
                                        <option value="21">NARINO</option>
                                        <option value="22">NORTE DE SANTANDER</option>
                                        <option value="23">PUTUMAYO</option>
                                        <option value="24">QUINDIO</option>
                                        <option value="25">RISARALDA</option>
                                        <option value="26">SAN ANDRES Y ROVIDENCIA</option>
                                        <option value="27">SANTANDER</option>
                                        <option value="28">SUCRE</option>
                                        <option value="29">TOLIMA</option>
                                        <option value="30">VALLE DEL CAUCA</option>
                                        <option value="31">VAUPES</option>
                                        <option value="32">VICHADA</option>
                                    </select>
                                    </div>
                     </div>
                      <div class="hr-line-dashed"></div>
                    
                    
                    <div class="form-group"><label class="col-sm-9 control-label">Municipio del colegio donde se graduo de bachiller</label>

                        <div class="col-sm-3"><select class="form-control m-b" name="municipio_grado" id="municipio_grado">
                                                                                         
                                                                                             
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

                         <div class="col-sm-12"><label class="checkbox-inline"> <input type="checkbox" value="1" id="inlineCheckbox1"> Portuges</label> <label class="checkbox-inline col-sm-2">
                                 <input type="checkbox" value="2" name="idioma"   id="inlineCheckbox2"> Ingles</label> <label class="checkbox-inline col-sm-2">
                                     <input type="checkbox" value="3" name="idioma" id="inlineCheckbox3"> Frances </label> <label class="checkbox-inline col-sm-2">
                                         <input type="checkbox" value="4" name="idioma" id="inlineCheckbox4"> Aleman </label> <label class="checkbox-inline col-sm-2">
                                             <input type="checkbox" value="5" name="idioma" id="inlineCheckbox5"> Otros </label> </div>
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
                        <label class="col-sm-12 text-center">acontinuacion ud debe ingresar el resulado de sus puebas saber</label>
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
            
            
            
            
            
              $("#departamento_grado").change(function () {
            var selec = $("#departamento_grado option:selected").val();
            if (selec == 0) {
                var opti = '<option value="0">Selecione</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }


            if (selec == 1) {
                var opti = '<option value="0">Seleccione</option>' +
                        '<option value="1">EL ENCANTO</option> '+
  '<option value="2">LA CHORRERA</option> '+
  '<option value="3">LA PEDRERA</option> '+
  '<option value="4">LA VICTORIA</option> '+
  '<option value="5">LETICIA</option> '+
  '<option value="6">MIRITI</option> '+
  '<option value="7">PUERTO ALEGRIA</option> '+
  '<option value="8">PUERTO ARICA</option> '+
  '<option value="9">PUERTO NARINO</option> '+
  '<option value="10">PUERTO SANTANDER</option> '+
  '<option value="11">TURAPACA</option> '+

                        '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 2) {
                var opti = '<option value="0">Selecione</option>' +
                    '<option value="1">ABEJORRAL</option> '+
  '<option value="2">ABRIAQUI</option> '+
  '<option value="3">ALEJANDRIA</option> '+
  '<option value="4">AMAGA</option> '+
  '<option value="5">AMALFI</option> '+
  '<option value="6">ANDES</option> '+
  '<option value="7">ANGELOPOLIS</option> '+
  '<option value="8">ANGOSTURA</option> '+
  '<option value="9">ANORI</option> '+
  '<option value="10">ANTIOQUIA</option> '+
  '<option value="11">ANZA</option> '+
  '<option value="12">APARTADO</option> '+
  '<option value="13">ARBOLETES</option> '+
  '<option value="14">ARGELIA</option> '+
  '<option value="15">ARMENIA</option> '+
  '<option value="16">BARBOSA</option> '+
  '<option value="17">BELLO</option> '+
  '<option value="18">BELMIRA</option> '+
  '<option value="19">BETANIA</option> '+
  '<option value="20">BETULIA</option> '+
  '<option value="21">BOLIVAR</option> '+
  '<option value="22">BRICENO</option> '+
  '<option value="23">BURITICA</option> '+
  '<option value="24">CACERES</option> '+
  '<option value="25">CAICEDO</option> '+
  '<option value="26">CALDAS</option> '+
  '<option value="27">CAMPAMENTO</option> '+
  '<option value="28">CANASGORDAS</option> '+
  '<option value="29">CARACOLI</option> '+
  '<option value="30">CARAMANTA</option> '+
  '<option value="31">CAREPA</option> '+
  '<option value="32">CARMEN DE VIBORAL</option> '+
  '<option value="33">CAROLINA DEL PRINCIPE</option> '+
  '<option value="34">CAUCASIA</option> '+
  '<option value="35">CHIGORODO</option> '+
  '<option value="36">CISNEROS</option> '+
  '<option value="37">COCORNA</option> '+
  '<option value="38">CONCEPCION</option> '+
  '<option value="39">CONCORDIA</option> '+
  '<option value="40">COPACABANA</option> '+
  '<option value="41">DABEIBA</option> '+
  '<option value="42">DONMATIAS</option> '+
  '<option value="43">EBEJICO</option> '+
  '<option value="44">EL BAGRE</option> '+
  '<option value="45">EL PENOL</option> '+
  '<option value="46">EL RETIRO</option> '+
  '<option value="47">ENTRERRIOS</option> '+
  '<option value="48">ENVIGADO</option> '+
  '<option value="49">FREDONIA</option> '+
  '<option value="50">FRONTINO</option> '+
  '<option value="51">GIRALDO</option> '+
  '<option value="52">GIRARDOTA</option> '+
  '<option value="53">GOMEZ PLATA</option> '+
  '<option value="54">GRANADA</option> '+
  '<option value="55">GUADALUPE</option> '+
  '<option value="56">GUARNE</option> '+
  '<option value="57">GUATAQUE</option> '+
  '<option value="58">HELICONIA</option> '+
  '<option value="59">HISPANIA</option> '+
  '<option value="60">ITAGUI</option> '+
  '<option value="61">ITUANGO</option> '+
  '<option value="62">JARDIN</option> '+
  '<option value="63">JERICO</option> '+
  '<option value="64">LA CEJA</option> '+
  '<option value="65">LA ESTRELLA</option> '+
  '<option value="66">LA PINTADA</option> '+
  '<option value="67">LA UNION</option> '+
  '<option value="68">LIBORINA</option> '+
  '<option value="69">MACEO</option> '+
  '<option value="70">MARINILLA</option> '+
  '<option value="71">MEDELLIN</option> '+
  '<option value="72">MONTEBELLO</option> '+
  '<option value="73">MURINDO</option> '+
  '<option value="74">MUTATA</option> '+
  '<option value="75">NARINO</option> '+
  '<option value="76">NECHI</option> '+
  '<option value="77">NECOCLI</option> '+
  '<option value="78">OLAYA</option> '+
  '<option value="79">PEQUE</option> '+
  '<option value="80">PUEBLORRICO</option> '+
  '<option value="81">PUERTO BERRIO</option> '+
  '<option value="82">PUERTO NARE</option> '+
  '<option value="83">PUERTO TRIUNFO</option> '+
  '<option value="84">REMEDIOS</option> '+
  '<option value="85">RIONEGRO</option> '+
  '<option value="86">SABANALARGA</option> '+
  '<option value="87">SABANETA</option> '+
  '<option value="88">SALGAR</option> '+
  '<option value="89">SAN ANDRES DE CUERQUIA</option> '+
  '<option value="90">SAN CARLOS</option> '+
  '<option value="91">SAN FRANCISCO</option> '+
  '<option value="92">SAN JERONIMO</option> '+
  '<option value="93">SAN JOSE DE LA MONTANA</option> '+
  '<option value="94">SAN JUAN DE URABA</option> '+
  '<option value="95">SAN LUIS</option> '+
  '<option value="96">SAN PEDRO DE LOS MILAGROS</option> '+
  '<option value="97">SAN PEDRO DE URABA</option> '+
  '<option value="98">SAN RAFAEL</option> '+
  '<option value="99">SAN ROQUE</option> '+
  '<option value="100">SAN VICENTE</option> '+
  '<option value="101">SANTA BARBARA</option> '+
  '<option value="102">SANTA ROSA DE OSOS</option> '+
  '<option value="103">SANTO DOMINGO</option> '+
  '<option value="104">SANTUARIO</option> '+
  '<option value="105">SEGOVIA</option> '+
  '<option value="106">SONSON</option> '+
  '<option value="107">SOPETRAN</option> '+
  '<option value="108">TAMESIS</option> '+
  '<option value="109">TARAZA</option> '+
  '<option value="110">TARSO</option> '+
  '<option value="111">TITIRIBI</option> '+
  '<option value="112">TOLEDO</option> '+
  '<option value="113">TURBO</option> '+
  '<option value="114">URAMITA</option> '+
  '<option value="115">URRAO</option> '+
  '<option value="116">VALDIVIA</option> '+
  '<option value="117">VALPARAISO</option> '+
  '<option value="118">VEGACHI</option> '+
  '<option value="119">VENECIA</option> '+
  '<option value="120">VIGIA DEL FUERTE</option> '+
  '<option value="121">YALI</option> '+
  '<option value="122">YARUMAL</option> '+
  '<option value="123">YOLOMBO</option> '+
  '<option value="124">YONDO</option> '+
  '<option value="125">ZARAGOZA</option> '

                        + '';
                $('#municipio_grado').html(opti);
            }

            if (selec == 3) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ARAUCA</option>' +
                        '<option value="2">ARAUQUITA</option>' +
                        '<option value="3">CRAVO NORTE</option>' +
                        '<option value="4">FORTUL</option>' +
                        '<option value="5">PUERTO RONDON</option>' +
                        '<option value="6">SARAVENA</option>' +
                        '<option value="7">TAME</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }

            if (selec == 4) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">BARANOA</option>' +
                        '<option value="2">BARRANQUILLA</option>' +
                        '<option value="3">CAMPO DE LA CRUZ</option>' +
                        '<option value="4">CANDELARIA</option>' +
                        '<option value="5">GALAPA</option>' +
                        '<option value="6">JUAN DE ACOSTA</option>' +
                        '<option value="7">LURUACO</option>' +
                        '<option value="8">MALAMBO</option>' +
                        '<option value="9">MANATI</option>' +
                        '<option value="10">PALMAR DE VARELA</option>' +
                        '<option value="11">PIOJO</option>' +
                        '<option value="12">POLO NUEVO</option>' +
                        '<option value="13">PONEDERA</option>' +
                        '<option value="14">PUERTO COLOMBIA</option>' +
                        '<option value="15">REPELON</option>' +
                        '<option value="16">SABANAGRANDE</option>' +
                        '<option value="17">SABANALARGA</option>' +
                        '<option value="18">SANTA LUCIA</option>' +
                        '<option value="19">SANTO TOMAS</option>' +
                        '<option value="20">SOLEDAD</option>' +
                        '<option value="21">SUAN</option>' +
                        '<option value="22">TUBARA</option>' +
                        '<option value="23">USIACURI</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }

            if (selec == 5) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ACHI</option>' +
                        '<option value="2">ALTOS DEL ROSARIO</option>' +
                        '<option value="3">ARENAL</option>' +
                        '<option value="4">ARJONA</option>' +
                        '<option value="5">ARROYOHONDO</option>' +
                        '<option value="6">BARRANCO DE LOBA</option>' +
                        '<option value="7">BRAZUELO DE PAPAYAL</option>' +
                        '<option value="8">CALAMAR</option>' +
                        '<option value="9">CANTAGALLO</option>' +
                        '<option value="10">CARTAGENA DE INDIAS</option>' +
                        '<option value="11">CICUCO</option>' +
                        '<option value="12">CLEMENCIA</option>' +
                        '<option value="13">CORDOBA</option>' +
                        '<option value="14">EL CARMEN DE BOLIVAR</option>' +
                        '<option value="15">EL GUAMO</option>' +
                        '<option value="16">EL PENION</option>' +
                        '<option value="17">HATILLO DE LOBA</option>' +
                        '<option value="18">MAGANGUE</option>' +
                        '<option value="19">MAHATES</option>' +
                        '<option value="20">MARGARITA</option>' +
                        '<option value="21">MARIA LA BAJA</option>' +
                        '<option value="22">MONTECRISTO</option>' +
                        '<option value="23">MORALES</option>' +
                        '<option value="24">MORALES</option>' +
                        '<option value="25">NOROSI</option>' +
                        '<option value="26">PINILLOS</option>' +
                        '<option value="27">REGIDOR</option>' +
                        '<option value="28">RIO VIEJO</option>' +
                        '<option value="29">SAN CRISTOBAL</option>' +
                        '<option value="30">SAN ESTANISLAO</option>' +
                        '<option value="31">SAN FERNANDO</option>' +
                        '<option value="32">SAN JACINTO</option>' +
                        '<option value="33">SAN JACINTO DEL CAUCA</option>' +
                        '<option value="34">SAN JUAN DE NEPOMUCENO</option>' +
                        '<option value="35">SAN MARTIN DE LOBA</option>' +
                        '<option value="36">SAN PABLO</option>' +
                        '<option value="37">SAN PABLO NORTE</option>' +
                        '<option value="38">SANTA CATALINA</option>' +
                        '<option value="39">SANTA CRUZ DE MOMPOX</option>' +
                        '<option value="40">SANTA ROSA</option>' +
                        '<option value="41">SANTA ROSA DEL SUR</option>' +
                        '<option value="42">SIMITI</option>' +
                        '<option value="43">SOPLAVIENTO</option>' +
                        '<option value="44">TALAIGUA NUEVO</option>' +
                        '<option value="45">TUQUISIO</option>' +
                        '<option value="46">TURBACO</option>' +
                        '<option value="47">TURBANA</option>' +
                        '<option value="48">VILLANUEVA</option>' +
                        '<option value="49">ZAMBRANO</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 6) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AQUITANIA</option>' +
                        '<option value="2">ARCABUCO</option>' +
                        '<option value="3">BELÉN</option>' +
                        '<option value="4">BERBEO</option>' +
                        '<option value="5">BETÉITIVA</option>' +
                        '<option value="6">BOAVITA</option>' +
                        '<option value="7">BOYACA</option>' +
                        '<option value="8">BRICE~NO</option>' +
                        '<option value="9">BUENAVISTA</option>' +
                        '<option value="10">BUSBANZA</option>' +
                        '<option value="11">CALDAS</option>' +
                        '<option value="12">CAMPO HERMOSO</option>' +
                        '<option value="13">CERINZA</option>' +
                        '<option value="14">CHINAVITA</option>' +
                        '<option value="15">CHIQUINQUIRA</option>' +
                        '<option value="16">CHIQUIZA</option>' +
                        '<option value="17">CHISCAS</option>' +
                        '<option value="18">CHITA</option>' +
                        '<option value="19">CHITARAQUE</option>' +
                        '<option value="20">CHIVATA</option>' +
                        '<option value="21">CIÉNEGA</option>' +
                        '<option value="22">CÓMBITA</option>' +
                        '<option value="23">COPER</option>' +
                        '<option value="24">CORRALES</option>' +
                        '<option value="25">COVARACHIA</option>' +
                        '<option value="26">CUBARA</option>' +
                        '<option value="27">CUCAITA</option>' +
                        '<option value="28">CUITIVA</option>' +
                        '<option value="29">DUITAMA</option>' +
                        '<option value="30">EL COCUY</option>' +
                        '<option value="31">EL ESPINO</option>' +
                        '<option value="32">FIRAVITOBA</option>' +
                        '<option value="33">FLORESTA</option>' +
                        '<option value="34">GACHANTIVA</option>' +
                        '<option value="35">GAMEZA</option>' +
                        '<option value="36">GARAGOA</option>' +
                        '<option value="37">GUACAMAYAS</option>' +
                        '<option value="38">GÜICAN</option>' +
                        '<option value="39">IZA</option>' +
                        '<option value="40">JENESANO</option>' +
                        '<option value="41">JERICÓ</option>' +
                        '<option value="42">LA UVITA</option>' +
                        '<option value="43">LA VICTORIA</option>' +
                        '<option value="44">LABRANZA GRANDE</option>' +
                        '<option value="45">MACANAL</option>' +
                        '<option value="46">MARIPI</option>' +
                        '<option value="47">MIRAFLORES</option>' +
                        '<option value="48">MONGUA</option>' +
                        '<option value="49">MONGUI</option>' +
                        '<option value="50">MONIQUIRA</option>' +
                        '<option value="51">MOTAVITA</option>' +
                        '<option value="52">MUZO</option>' +
                        '<option value="53">NOBSA</option>' +
                        '<option value="54">NUEVO COLÓN</option>' +
                        '<option value="55">OICATA</option>' +
                        '<option value="56">OTANCHE</option>' +
                        '<option value="57">PACHAVITA</option>' +
                        '<option value="58">PAEZ</option>' +
                        '<option value="59">PAIPA</option>' +
                        '<option value="60">PAJARITO</option>' +
                        '<option value="61">PANQUEBA</option>' +
                        '<option value="62">PAUNA</option>' +
                        '<option value="63">PAYA</option>' +
                        '<option value="64">PAZ DE RIO</option>' +
                        '<option value="65">PESCA</option>' +
                        '<option value="66">PISBA</option>' +
                        '<option value="67">PUERTO BOYACA</option>' +
                        '<option value="68">QUIPAMA</option>' +
                        '<option value="69">RAMIRIQUI</option>' +
                        '<option value="70">RAQUIRA</option>' +
                        '<option value="71">RONDÓN</option>' +
                        '<option value="72">SABOYA</option>' +
                        '<option value="73">SACHICA</option>' +
                        '<option value="74">SAMACA</option>' +
                        '<option value="75">SAN EDUARDO</option>' +
                        '<option value="76">SAN JOSÉ DE PARE</option>' +
                        '<option value="77">SAN LUIS DE GACENO</option>' +
                        '<option value="78">SAN MATEO</option>' +
                        '<option value="79">SAN MIGUEL DE SEMA</option>' +
                        '<option value="80">SAN PABLO DE BORBUR</option>' +
                        '<option value="81">SANTA MARIA</option>' +
                        '<option value="82">SANTA ROSA DE VITERBO</option>' +
                        '<option value="83">SANTA SOFIA</option>' +
                        '<option value="84">SANTANA</option>' +
                        '<option value="85">SATIVANORTE</option>' +
                        '<option value="86">SATIVASUR</option>' +
                        '<option value="87">SIACHOQUE</option>' +
                        '<option value="88">SOATA</option>' +
                        '<option value="89">SOCHA</option>' +
                        '<option value="90">SOCOTA</option>' +
                        '<option value="91">SOGAMOSO</option>' +
                        '<option value="92">SORA</option>' +
                        '<option value="93">SORACA</option>' +
                        '<option value="94">SOTAQUIRA</option>' +
                        '<option value="95">SUSACÓN</option>' +
                        '<option value="96">SUTARMACHAN</option>' +
                        '<option value="97">TASCO</option>' +
                        '<option value="98">TIBANA</option>' +
                        '<option value="99">TIBASOSA</option>' +
                        '<option value="100">TINJACA</option>' +
                        '<option value="101">TIPACOQUE</option>' +
                        '<option value="102">TOCA</option>' +
                        '<option value="103">TOGÜI</option>' +
                        '<option value="104">TÓPAGA</option>' +
                        '<option value="105">TOTA</option>' +
                        '<option value="106">TUNJA</option>' +
                        '<option value="107">TUNUNGUA</option>' +
                        '<option value="108">TURMEQUÉ</option>' +
                        '<option value="109">TUTA</option>' +
                        '<option value="110">TUTAZA</option>' +
                        '<option value="111">UMBITA</option>' +
                        '<option value="112">VENTA QUEMADA</option>' +
                        '<option value="113">VILLA DE LEYVA</option>' +
                        '<option value="114">VIRACACHA</option>' +
                        '<option value="115">ZETAQUIRA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 7) {
                var opti = '<option value="0">Selecione</option>' +
                         '<option value="1">AGUADAS</option> '+
  '<option value="2">ANSERMA</option> '+
  '<option value="3">ARANZAZU</option> '+
  '<option value="4">BELALCAZAR</option> '+
  '<option value="5">CHINCHINA</option> '+
  '<option value="6">FILADELFIA</option> '+
  '<option value="7">LA DORADA</option> '+
  '<option value="8">LA MERCED</option> '+
  '<option value="9">MANIZALES</option> '+
  '<option value="10">MANZANARES</option> '+
  '<option value="11">MARMATO</option> '+
  '<option value="12">MARQUETALIA</option> '+
  '<option value="13">MARULANDA</option> '+
  '<option value="14">NEIRA</option> '+
  '<option value="15">NORCASIA</option> '+
  '<option value="16">PACORA</option> '+
  '<option value="17">PALESTINA</option> '+
  '<option value="18">PENSILVANIA</option> '+
  '<option value="19">RIOSUCIO</option> '+
  '<option value="20">RISARALDA</option> '+
  '<option value="21">SALAMINA</option> '+
  '<option value="22">SAMANA</option> '+
  '<option value="23">SAN JOSE</option> '+
  '<option value="24">SUPIA</option> '+
  '<option value="25">VICTORIA</option> '+
  '<option value="26">VILLAMARIA</option> '+
  '<option value="27">VITERBO</option> '


                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 8) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALBANIA</option>' +
                        '<option value="2">BELÉN ANDAQUIES</option>' +
                        '<option value="3">CARTAGENA DEL CHAIRA</option>' +
                        '<option value="4">CURILLO</option>' +
                        '<option value="5">EL DONCELLO</option>' +
                        '<option value="6">EL PAUJIL</option>' +
                        '<option value="7">FLORENCIA</option>' +
                        '<option value="8">LA MONTA~NITA</option>' +
                        '<option value="9">MILAN</option>' +
                        '<option value="10">MORELIA</option>' +
                        '<option value="11">PUERTO RICO</option>' +
                        '<option value="12">SAN  VICENTE DEL CAGUAN</option>' +
                        '<option value="13">SAN JOSÉ DE FRAGUA</option>' +
                        '<option value="14">SOLANO</option>' +
                        '<option value="15">SOLITA</option>' +
                        '<option value="16">VALPARAISO</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 9) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AGUAZUL</option>' +
                        '<option value="2">CHAMEZA</option>' +
                        '<option value="3">HATO COROZAL</option>' +
                        '<option value="4">LA SALINA</option>' +
                        '<option value="5">MANI</option>' +
                        '<option value="6">MONTERREY</option>' +
                        '<option value="7">NUNCHIA</option>' +
                        '<option value="8">OROCUE</option>' +
                        '<option value="9">PAZ DE ARIPORO</option>' +
                        '<option value="10">PORE</option>' +
                        '<option value="11">RECETOR</option>' +
                        '<option value="12">SABANA LARGA</option>' +
                        '<option value="13">SACAMA</option>' +
                        '<option value="14">SAN LUIS DE PALENQUE</option>' +
                        '<option value="15">TAMARA</option>' +
                        '<option value="16">TAURAMENA</option>' +
                        '<option value="17">TRINIDAD</option>' +
                        '<option value="18">VILLANUEVA</option>' +
                        '<option value="19">YOPAL</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 10) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALMAGUER</option>' +
                        '<option value="2">ARGELIA</option>' +
                        '<option value="3">BALBOA</option>' +
                        '<option value="4">BOLIVAR</option>' +
                        '<option value="5">BUENOS AIRES</option>' +
                        '<option value="6">CAJIBIO</option>' +
                        '<option value="7">CALDONO</option>' +
                        '<option value="8">CALOTO</option>' +
                        '<option value="9">CORINTO</option>' +
                        '<option value="10">EL TAMBO</option>' +
                        '<option value="11">FLORENCIA</option>' +
                        '<option value="12">GUAPI</option>' +
                        '<option value="13">INZA</option>' +
                        '<option value="14">JAMBALÓ</option>' +
                        '<option value="15">LA SIERRA</option>' +
                        '<option value="16">LA VEGA</option>' +
                        '<option value="17">LÓPEZ</option>' +
                        '<option value="18">MERCADERES</option>' +
                        '<option value="19">MIRANDA</option>' +
                        '<option value="20">MORALES</option>' +
                        '<option value="21">PADILLA</option>' +
                        '<option value="22">PAEZ</option>' +
                        '<option value="23">PATIA (EL BORDO)</option>' +
                        '<option value="24">PIAMONTE</option>' +
                        '<option value="25">PIENDAMO</option>' +
                        '<option value="26">POPAYAN</option>' +
                        '<option value="27">PUERTO TEJADA</option>' +
                        '<option value="28">PURACE</option>' +
                        '<option value="29">ROSAS</option>' +
                        '<option value="30">SAN SEBASTIAN</option>' +
                        '<option value="31">SANTA ROSA</option>' +
                        '<option value="32">SANTANDER DE QUILICHAO</option>' +
                        '<option value="33">SILVIA</option>' +
                        '<option value="34">SOTARA</option>' +
                        '<option value="35">SUAREZ</option>' +
                        '<option value="36">SUCRE</option>' +
                        '<option value="37">TIMBIO</option>' +
                        '<option value="38">TIMBIQUI</option>' +
                        '<option value="39">TORIBIO</option>' +
                        '<option value="40">TOTORO</option>' +
                        '<option value="41">VILLA RICA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 11) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AGUACHICA</option>' +
                        '<option value="2">AGUSTIN CODAZZI</option>' +
                        '<option value="3">ASTREA</option>' +
                        '<option value="4">BECERRIL</option>' +
                        '<option value="5">BOSCONIA</option>' +
                        '<option value="6">CHIMICHAGUA</option>' +
                        '<option value="7">CHIRIGUANA</option>' +
                        '<option value="8">CURUMANI</option>' +
                        '<option value="9">EL COPEY</option>' +
                        '<option value="10">EL PASO</option>' +
                        '<option value="11">GAMARRA</option>' +
                        '<option value="12">GONZALEZ</option>' +
                        '<option value="13">LA GLORIA</option>' +
                        '<option value="14">LA JAGUA IBIRICO</option>' +
                        '<option value="15">MANAURE BALCÓN DEL CESAR</option>' +
                        '<option value="16">PAILITAS</option>' +
                        '<option value="17">PELAYA</option>' +
                        '<option value="18">PUEBLO BELLO</option>' +
                        '<option value="19">RIO DE ORO</option>' +
                        '<option value="20">ROBLES (LA PAZ)</option>' +
                        '<option value="21">SAN ALBERTO</option>' +
                        '<option value="22">SAN DIEGO</option>' +
                        '<option value="23">SAN MARTIN</option>' +
                        '<option value="24">TAMALAMEQUE</option>' +
                        '<option value="25">VALLEDUPAR</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 12) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ACANDI</option>' +
                        '<option value="2">ALTO BAUDO (PIE DE PATO)</option>' +
                        '<option value="3">ATRATO</option>' +
                        '<option value="4">BAGADO</option>' +
                        '<option value="5">BAHIA SOLANO (MUTIS)</option>' +
                        '<option value="6">BAJO BAUDO (PIZARRO)</option>' +
                        '<option value="7">BOJAYA (BELLAVISTA)</option>' +
                        '<option value="8">CANTON DE SAN PABLO</option>' +
                        '<option value="9">CARMEN DEL DARIEN</option>' +
                        '<option value="10">CERTEGUI</option>' +
                        '<option value="11">CONDOTO</option>' +
                        '<option value="12">EL CARMEN</option>' +
                        '<option value="13">ISTMINA</option>' +
                        '<option value="14">JURADO</option>' +
                        '<option value="15">LITORAL DEL SAN JUAN</option>' +
                        '<option value="16">LLORO</option>' +
                        '<option value="17">MEDIO ATRATO</option>' +
                        '<option value="18">MEDIO BAUDO (BOCA DE PEPE)</option>' +
                        '<option value="19">MEDIO SAN JUAN</option>' +
                        '<option value="20">NOVITA</option>' +
                        '<option value="21">NUQUI</option>' +
                        '<option value="22">QUIBDO</option>' +
                        '<option value="23">RIO IRO</option>' +
                        '<option value="24">RIO QUITO</option>' +
                        '<option value="25">RIOSUCIO</option>' +
                        '<option value="26">SAN JOSE DEL PALMAR</option>' +
                        '<option value="27">SIPI</option>' +
                        '<option value="28">TADO</option>' +
                        '<option value="29">UNGUIA</option>' +
                        '<option value="30">UNIÓN PANAMERICANA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 13) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AYAPEL</option>' +
                        '<option value="2">BUENAVISTA</option>' +
                        '<option value="3">CANALETE</option>' +
                        '<option value="4">CERETÉ</option>' +
                        '<option value="5">CHIMA</option>' +
                        '<option value="6">CHINU</option>' +
                        '<option value="7">CIENAGA DE ORO</option>' +
                        '<option value="8">COTORRA</option>' +
                        '<option value="9">LA APARTADA</option>' +
                        '<option value="10">LORICA</option>' +
                        '<option value="11">LOS CÓRDOBAS</option>' +
                        '<option value="12">MOMIL</option>' +
                        '<option value="13">MONTELIBANO</option>' +
                        '<option value="14">MONTERIA</option>' +
                        '<option value="15">MONITOS</option>' +
                        '<option value="16">PLANETA RICA</option>' +
                        '<option value="17">PUEBLO NUEVO</option>' +
                        '<option value="18">PUERTO ESCONDIDO</option>' +
                        '<option value="19">PUERTO LIBERTADOR</option>' +
                        '<option value="20">PURISIMA</option>' +
                        '<option value="21">SAHAGUN</option>' +
                        '<option value="22">SAN ANDRÉS SOTAVENTO</option>' +
                        '<option value="23">SAN ANTERO</option>' +
                        '<option value="24">SAN BERNARDO VIENTO</option>' +
                        '<option value="25">SAN CARLOS</option>' +
                        '<option value="26">SAN PELAYO</option>' +
                        '<option value="27">TIERRALTA</option>' +
                        '<option value="28">VALENCIA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 14) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AGUA DE DIOS</option>' +
                        '<option value="2">ALBAN</option>' +
                        '<option value="3">ANAPOIMA</option>' +
                        '<option value="4">ANOLAIMA</option>' +
                        '<option value="5">ARBELAEZ</option>' +
                        '<option value="6">BELTRAN</option>' +
                        '<option value="7">BITUIMA</option>' +
                        '<option value="8">BOGOTA DC</option>' +
                        '<option value="9">BOJACA</option>' +
                        '<option value="10">CABRERA</option>' +
                        '<option value="11">CACHIPAY</option>' +
                        '<option value="12">CAJICA</option>' +
                        '<option value="13">CAPARRAPI</option>' +
                        '<option value="14">CAQUEZA</option>' +
                        '<option value="15">CARMEN DE CARUPA</option>' +
                        '<option value="16">CHAGUANI</option>' +
                        '<option value="17">CHIA</option>' +
                        '<option value="18">CHIPAQUE</option>' +
                        '<option value="19">CHOACHI</option>' +
                        '<option value="20">CHOCONTA</option>' +
                        '<option value="21">COGUA</option>' +
                        '<option value="22">COTA</option>' +
                        '<option value="23">CUCUNUBA</option>' +
                        '<option value="24">EL COLEGIO</option>' +
                        '<option value="25">EL PENÓN</option>' +
                        '<option value="26">EL ROSAL1</option>' +
                        '<option value="27">FACATATIVA</option>' +
                        '<option value="28">FÓMEQUE</option>' +
                        '<option value="29">FOSCA</option>' +
                        '<option value="30">FUNZA</option>' +
                        '<option value="31">FUQUENE</option>' +
                        '<option value="32">FUSAGASUGA</option>' +
                        '<option value="33">GACHALA</option>' +
                        '<option value="34">GACHANCIPA</option>' +
                        '<option value="35">GACHETA</option>' +
                        '<option value="36">GAMA</option>' +
                        '<option value="37">GIRARDOT</option>' +
                        '<option value="38">GRANADA2</option>' +
                        '<option value="39">GUACHETA</option>' +
                        '<option value="40">GUADUAS</option>' +
                        '<option value="41">GUASCA</option>' +
                        '<option value="42">GUATAQUI</option>' +
                        '<option value="43">GUATAVITA</option>' +
                        '<option value="44">GUAYABAL DE SIQUIMA</option>' +
                        '<option value="45">GUAYABETAL</option>' +
                        '<option value="46">GUTIÉRREZ</option>' +
                        '<option value="47">JERUSALÉN</option>' +
                        '<option value="48">JUNIN</option>' +
                        '<option value="49">LA CALERA</option>' +
                        '<option value="50">LA MESA</option>' +
                        '<option value="51">LA PALMA</option>' +
                        '<option value="52">LA PE~NA</option>' +
                        '<option value="53">LA VEGA</option>' +
                        '<option value="54">LENGUAZAQUE</option>' +
                        '<option value="55">MACHETA</option>' +
                        '<option value="56">MADRID</option>' +
                        '<option value="57">MANTA</option>' +
                        '<option value="58">MEDINA</option>' +
                        '<option value="59">MOSQUERA</option>' +
                        '<option value="60">NARINO</option>' +
                        '<option value="61">NEMOCÓN</option>' +
                        '<option value="62">NILO</option>' +
                        '<option value="63">NIMAIMA</option>' +
                        '<option value="64">NOCAIMA</option>' +
                        '<option value="65">OSPINA PÉREZ</option>' +
                        '<option value="66">PACHO</option>' +
                        '<option value="67">PAIME</option>' +
                        '<option value="68">PANDI</option>' +
                        '<option value="69">PARATEBUENO</option>' +
                        '<option value="70">PASCA</option>' +
                        '<option value="71">PUERTO SALGAR</option>' +
                        '<option value="72">PULI</option>' +
                        '<option value="73">QUEBRADANEGRA</option>' +
                        '<option value="74">QUETAME</option>' +
                        '<option value="75">QUIPILE</option>' +
                        '<option value="76">RAFAEL REYES</option>' +
                        '<option value="77">RICAURTE</option>' +
                        '<option value="78">SAN  ANTONIO DEL  TEQUENDAMA</option>' +
                        '<option value="79">SAN BERNARDO</option>' +
                        '<option value="80">SAN CAYETANO</option>' +
                        '<option value="81">SAN FRANCISCO</option>' +
                        '<option value="82">SAN JUAN DE RIOSECO</option>' +
                        '<option value="83">SASAIMA</option>' +
                        '<option value="84">SESQUILÉ</option>' +
                        '<option value="85">SIBATÉ</option>' +
                        '<option value="86">SILVANIA</option>' +
                        '<option value="87">SIMIJACA</option>' +
                        '<option value="88">SOACHA</option>' +
                        '<option value="89">SOPO</option>' +
                        '<option value="90">SUBACHOQUE</option>' +
                        '<option value="91">SUESCA</option>' +
                        '<option value="92">SUPATA</option>' +
                        '<option value="93">SUSA</option>' +
                        '<option value="94">SUTATAUSA</option>' +
                        '<option value="95">TABIO</option>' +
                        '<option value="96">TAUSA</option>' +
                        '<option value="97">TENA</option>' +
                        '<option value="98">TENJO</option>' +
                        '<option value="99">TIBACUY</option>' +
                        '<option value="100">TIBIRITA</option>' +
                        '<option value="101">TOCAIMA</option>' +
                        '<option value="102">TOCANCIPA</option>' +
                        '<option value="103">TOPAIPI</option>' +
                        '<option value="104">UBALA</option>' +
                        '<option value="105">UBAQUE</option>' +
                        '<option value="106">UBATÉ</option>' +
                        '<option value="107">UNE</option>' +
                        '<option value="108">UTICA</option>' +
                        '<option value="109">VERGARA</option>' +
                        '<option value="110">VIANI</option>' +
                        '<option value="111">VILLA GOMEZ</option>' +
                        '<option value="112">VILLA PINZÓN</option>' +
                        '<option value="113">VILLETA</option>' +
                        '<option value="114">VIOTA</option>' +
                        '<option value="115">YACOPI</option>' +
                        '<option value="116">ZIPACÓN</option>' +
                        '<option value="117">ZIPAQUIRA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 15) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">BARRANCO MINAS</option>' +
                        '<option value="2">CACAHUAL</option>' +
                        '<option value="3">INIRIDA</option>' +
                        '<option value="4">LA GUADALUPE</option>' +
                        '<option value="5">MAPIRIPANA</option>' +
                        '<option value="6">MORICHAL</option>' +
                        '<option value="7">PANA PANA</option>' +
                        '<option value="8">PUERTO COLOMBIA</option>' +
                        '<option value="9">SAN FELIPE</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 16) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">CALAMAR</option>' +
                        '<option value="2">EL RETORNO</option>' +
                        '<option value="3">MIRAFLOREZ</option>' +
                        '<option value="4">SAN JOSÉ DEL GUAVIARE</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 17) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ACEVEDO</option>' +
                        '<option value="2">AGRADO</option>' +
                        '<option value="3">AIPE</option>' +
                        '<option value="4">ALGECIRAS</option>' +
                        '<option value="5">ALTAMIRA</option>' +
                        '<option value="6">BARAYA</option>' +
                        '<option value="7">CAMPO ALEGRE</option>' +
                        '<option value="8">COLOMBIA</option>' +
                        '<option value="9">ELIAS</option>' +
                        '<option value="10">GARZÓN</option>' +
                        '<option value="11">GIGANTE</option>' +
                        '<option value="12">GUADALUPE</option>' +
                        '<option value="13">HOBO</option>' +
                        '<option value="14">IQUIRA</option>' +
                        '<option value="15">ISNOS</option>' +
                        '<option value="16">LA ARGENTINA</option>' +
                        '<option value="17">LA PLATA</option>' +
                        '<option value="18">NATAGA</option>' +
                        '<option value="19">NEIVA</option>' +
                        '<option value="20">OPORAPA</option>' +
                        '<option value="21">PAICOL</option>' +
                        '<option value="22">PALERMO</option>' +
                        '<option value="23">PALESTINA</option>' +
                        '<option value="24">PITAL</option>' +
                        '<option value="25">PITALITO</option>' +
                        '<option value="26">RIVERA</option>' +
                        '<option value="27">SALADO BLANCO</option>' +
                        '<option value="28">SAN AGUSTIN</option>' +
                        '<option value="29">SANTA MARIA</option>' +
                        '<option value="30">SUAZA</option>' +
                        '<option value="31">TARQUI</option>' +
                        '<option value="32">TELLO</option>' +
                        '<option value="33">TERUEL</option>' +
                        '<option value="34">TESALIA</option>' +
                        '<option value="35">TIMANA</option>' +
                        '<option value="36">VILLAVIEJA</option>' +
                        '<option value="37">YAGUARA</option>'



                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 18) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALBANIA</option>' +
                        '<option value="2">BARRANCAS</option>' +
                        '<option value="3">DIBULLA</option>' +
                        '<option value="4">DISTRACCIÓN</option>' +
                        '<option value="5">EL MOLINO</option>' +
                        '<option value="6">FONSECA</option>' +
                        '<option value="7">HATO NUEVO</option>' +
                        '<option value="8">LA JAGUA DEL PILAR</option>' +
                        '<option value="9">MAICAO</option>' +
                        '<option value="10">MANAURE</option>' +
                        '<option value="11">RIOHACHA</option>' +
                        '<option value="12">SAN JUAN DEL CESAR</option>' +
                        '<option value="13">URIBIA</option>' +
                        '<option value="14">URUMITA</option>' +
                        '<option value="15">VILLANUEVA</option>'


                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 19) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALGARROBO</option>' +
                        '<option value="2">ARACATACA</option>' +
                        '<option value="3">ARIGUANI</option>' +
                        '<option value="4">CERRO SAN ANTONIO</option>' +
                        '<option value="5">CHIVOLO</option>' +
                        '<option value="6">CIENAGA</option>' +
                        '<option value="7">CONCORDIA</option>' +
                        '<option value="8">EL BANCO</option>' +
                        '<option value="9">EL PI~NON</option>' +
                        '<option value="10">EL RETEN</option>' +
                        '<option value="11">FUNDACION</option>' +
                        '<option value="12">GUAMAL</option>' +
                        '<option value="13">NUEVA GRANADA</option>' +
                        '<option value="14">PEDRAZA</option>' +
                        '<option value="15">PIJINO DEL CARMEN</option>' +
                        '<option value="16">PIVIJAY</option>' +
                        '<option value="17">PLATO</option>' +
                        '<option value="18">PUEBLO VIEJO</option>' +
                        '<option value="19">REMOLINO</option>' +
                        '<option value="20">SABANAS DE SAN ANGEL</option>' +
                        '<option value="21">SALAMINA</option>' +
                        '<option value="22">SAN SEBASTIAN DE BUENAVISTA</option>' +
                        '<option value="23">SAN ZENON</option>' +
                        '<option value="24">SANTA ANA</option>' +
                        '<option value="25">SANTA BARBARA DE PINTO</option>' +
                        '<option value="26">SANTA MARTA</option>' +
                        '<option value="27">SITIONUEVO</option>' +
                        '<option value="28">TENERIFE</option>' +
                        '<option value="29">ZAPAYAN</option>' +
                        '<option value="30">ZONA BANANERA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 20) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ACACIAS</option>' +
                        '<option value="2">BARRANCA DE UPIA</option>' +
                        '<option value="3">CABUYARO</option>' +
                        '<option value="4">CASTILLA LA NUEVA</option>' +
                        '<option value="5">CUBARRAL</option>' +
                        '<option value="6">CUMARAL</option>' +
                        '<option value="7">EL CALVARIO</option>' +
                        '<option value="8">EL CASTILLO</option>' +
                        '<option value="9">EL DORADO</option>' +
                        '<option value="10">FUENTE DE ORO</option>' +
                        '<option value="11">GRANADA</option>' +
                        '<option value="12">GUAMAL</option>' +
                        '<option value="13">LA MACARENA</option>' +
                        '<option value="14">LA URIBE</option>' +
                        '<option value="15">LEJANIAS</option>' +
                        '<option value="16">MAPIRIPAN</option>' +
                        '<option value="17">MESETAS</option>' +
                        '<option value="18">PUERTO CONCORDIA</option>' +
                        '<option value="19">PUERTO GAITAN</option>' +
                        '<option value="20">PUERTO LLERAS</option>' +
                        '<option value="21">PUERTO LÓPEZ</option>' +
                        '<option value="22">PUERTO RICO</option>' +
                        '<option value="23">RESTREPO</option>' +
                        '<option value="24">SAN  JUAN DE ARAMA</option>' +
                        '<option value="25">SAN CARLOS GUAROA</option>' +
                        '<option value="26">SAN JUANITO</option>' +
                        '<option value="27">SAN MARTIN</option>' +
                        '<option value="28">VILLAVICENCIO</option>' +
                        '<option value="29">VISTA HERMOSA</option>' +
                        '<option value="30">ZONA BANANERA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 21) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALBAN</option>' +
                        '<option value="2">ALDANA</option>' +
                        '<option value="3">ANCUYA</option>' +
                        '<option value="4">ARBOLEDA</option>' +
                        '<option value="5">BARBACOAS</option>' +
                        '<option value="6">BELEN</option>' +
                        '<option value="7">BUESACO</option>' +
                        '<option value="8">CHACHAGUI</option>' +
                        '<option value="9">COLON (GENOVA)</option>' +
                        '<option value="10">CONSACA</option>' +
                        '<option value="11">CONTADERO</option>' +
                        '<option value="12">CORDOBA</option>' +
                        '<option value="13">CUASPUD</option>' +
                        '<option value="14">CUMBAL</option>' +
                        '<option value="15">CUMBITARA</option>' +
                        '<option value="16">EL CHARCO</option>' +
                        '<option value="17">EL PENOL</option>' +
                        '<option value="18">EL ROSARIO</option>' +
                        '<option value="19">EL TABLÓN</option>' +
                        '<option value="20">EL TAMBO</option>' +
                        '<option value="21">FUNES</option>' +
                        '<option value="22">GUACHUCAL</option>' +
                        '<option value="23">GUAITARILLA</option>' +
                        '<option value="24">GUALMATAN</option>' +
                        '<option value="25">ILES</option>' +
                        '<option value="26">IMUES</option>' +
                        '<option value="27">IPIALES</option>' +
                        '<option value="28">LA CRUZ</option>' +
                        '<option value="29">LA FLORIDA</option>' +
                        '<option value="30">LA LLANADA</option>' +
                        '<option value="31">LA TOLA</option>' +
                        '<option value="32">LA UNION</option>' +
                        '<option value="33">LEIVA</option>' +
                        '<option value="34">LINARES</option>' +
                        '<option value="35">LOS ANDES</option>' +
                        '<option value="36">MAGUI</option>' +
                        '<option value="37">MALLAMA</option>' +
                        '<option value="38">MOSQUEZA</option>' +
                        '<option value="39">NARINO</option>' +
                        '<option value="40">OLAYA HERRERA</option>' +
                        '<option value="41">OSPINA</option>' +
                        '<option value="42">PASTO</option>' +
                        '<option value="43">PIZARRO</option>' +
                        '<option value="44">POLICARPA</option>' +
                        '<option value="45">POTOSI</option>' +
                        '<option value="46">PROVIDENCIA</option>' +
                        '<option value="47">PUERRES</option>' +
                        '<option value="48">PUPIALES</option>' +
                        '<option value="49">RICAURTE</option>' +
                        '<option value="50">ROBERTO PAYAN</option>' +
                        '<option value="51">SAMANIEGO</option>' +
                        '<option value="52">SAN BERNARDO</option>' +
                        '<option value="53">SAN LORENZO</option>' +
                        '<option value="54">SAN PABLO</option>' +
                        '<option value="55">SAN PEDRO DE CARTAGO</option>' +
                        '<option value="56">SANDONA</option>' +
                        '<option value="57">SANTA BARBARA</option>' +
                        '<option value="58">SANTACRUZ</option>' +
                        '<option value="59">SAPUYES</option>' +
                        '<option value="60">TAMINANGO</option>' +
                        '<option value="61">TANGUA</option>' +
                        '<option value="62">TUMACO</option>' +
                        '<option value="63">TUQUERRES</option>' +
                        '<option value="64">YACUANQUER</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 22) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ABREGO</option>' +
                        '<option value="2">ARBOLEDAS</option>' +
                        '<option value="3">BOCHALEMA</option>' +
                        '<option value="4">BUCARASICA</option>' +
                        '<option value="5">CACHIRA</option>' +
                        '<option value="6">CACOTA</option>' +
                        '<option value="7">CHINACOTA</option>' +
                        '<option value="8">CHITAGA</option>' +
                        '<option value="9">CONVENCIÓN</option>' +
                        '<option value="10">CUCUTA</option>' +
                        '<option value="11">CUCUTILLA</option>' +
                        '<option value="12">DURANIA</option>' +
                        '<option value="13">EL CARMEN</option>' +
                        '<option value="14">EL TARRA</option>' +
                        '<option value="15">EL ZULIA</option>' +
                        '<option value="16">GRAMALOTE</option>' +
                        '<option value="17">HACARI</option>' +
                        '<option value="18">HERRAN</option>' +
                        '<option value="19">LA ESPERANZA</option>' +
                        '<option value="20">LA PLAYA</option>' +
                        '<option value="21">LABATECA</option>' +
                        '<option value="22">LOS PATIOS</option>' +
                        '<option value="23">LOURDES</option>' +
                        '<option value="24">MUTISCUA</option>' +
                        '<option value="25">OCANA</option>' +
                        '<option value="26">PAMPLONA</option>' +
                        '<option value="27">PAMPLONITA</option>' +
                        '<option value="28">PUERTO SANTANDER</option>' +
                        '<option value="29">RAGONVALIA</option>' +
                        '<option value="30">SALAZAR</option>' +
                        '<option value="31">SAN CALIXTO</option>' +
                        '<option value="32">SAN CAYETANO</option>' +
                        '<option value="33">SANTIAGO</option>' +
                        '<option value="34">SARDINATA</option>' +
                        '<option value="35">SILOS</option>' +
                        '<option value="36">TEORAMA</option>' +
                        '<option value="37">TIBU</option>' +
                        '<option value="38">TOLEDO</option>' +
                        '<option value="39">VILLA CARO</option>' +
                        '<option value="40">VILLA DEL ROSARIO</option>' +
                        '<option value="41">OSPINA</option>' +
                        '<option value="42">PASTO</option>' +
                        '<option value="43">PIZARRO</option>' +
                        '<option value="44">POLICARPA</option>' +
                        '<option value="45">POTOSI</option>' +
                        '<option value="46">PROVIDENCIA</option>' +
                        '<option value="47">PUERRES</option>' +
                        '<option value="48">PUPIALES</option>' +
                        '<option value="49">RICAURTE</option>' +
                        '<option value="50">ROBERTO PAYAN</option>' +
                        '<option value="51">SAMANIEGO</option>' +
                        '<option value="52">SAN BERNARDO</option>' +
                        '<option value="53">SAN LORENZO</option>' +
                        '<option value="54">SAN PABLO</option>' +
                        '<option value="55">SAN PEDRO DE CARTAGO</option>' +
                        '<option value="56">SANDONA</option>' +
                        '<option value="57">SANTA BARBARA</option>' +
                        '<option value="58">SANTACRUZ</option>' +
                        '<option value="59">SAPUYES</option>' +
                        '<option value="60">TAMINANGO</option>' +
                        '<option value="61">TANGUA</option>' +
                        '<option value="62">TUMACO</option>' +
                        '<option value="63">TUQUERRES</option>' +
                        '<option value="64">YACUANQUER</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 23) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">COLÓN</option>' +
                        '<option value="2">MOCOA</option>' +
                        '<option value="3">ORITO</option>' +
                        '<option value="4">PUERTO ASIS</option>' +
                        '<option value="5">PUERTO CAYCEDO</option>' +
                        '<option value="6">PUERTO GUZMAN</option>' +
                        '<option value="7">PUERTO LEGUIZAMO</option>' +
                        '<option value="8">SAN FRANCISCO</option>' +
                        '<option value="9">SAN MIGUEL</option>' +
                        '<option value="10">SANTIAGO</option>' +
                        '<option value="11">SIBUNDOY</option>' +
                        '<option value="12">VALLE DEL GUAMUEZ</option>' +
                        '<option value="13">VILLAGARZÓN</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 24) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ARMENIA</option>' +
                        '<option value="2">BUENAVISTA</option>' +
                        '<option value="3">CALARCA</option>' +
                        '<option value="4">CIRCASIA</option>' +
                        '<option value="5">CÓRDOBA</option>' +
                        '<option value="6">FILANDIA</option>' +
                        '<option value="7">GÉNOVA</option>' +
                        '<option value="8">LA TEBAIDA</option>' +
                        '<option value="9">MONTENEGRO</option>' +
                        '<option value="10">PIJAO</option>' +
                        '<option value="11">QUIMBAYA</option>' +
                        '<option value="12">SALENTO</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 25) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">APIA</option>' +
                        '<option value="2">BALBOA</option>' +
                        '<option value="3">BELÉN DE UMBRIA</option>' +
                        '<option value="4">DOS QUEBRADAS</option>' +
                        '<option value="5">GUATICA</option>' +
                        '<option value="6">LA CELIA</option>' +
                        '<option value="7">LA VIRGINIA</option>' +
                        '<option value="8">MARSELLA</option>' +
                        '<option value="9">MISTRATO</option>' +
                        '<option value="10">PEREIRA</option>' +
                        '<option value="11">PUEBLO RICO</option>' +
                        '<option value="12">QUINCHIA</option>' +
                        '<option value="13">SANTA ROSA DE CABAL</option>' +
                        '<option value="14">SANTUARIO</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 26) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">PROVIDENCIA</option>' +
                        '<option value="2">SAN ANDRES</option>' +
                        '<option value="3">SANTA CATALINA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 27) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">AGUADA</option>' +
                        '<option value="2">ALBANIA</option>' +
                        '<option value="3">ARATOCA</option>' +
                        '<option value="4">BARBOSA</option>' +
                        '<option value="5">BARICHARA</option>' +
                        '<option value="6">BARRANCABERMEJA</option>' +
                        '<option value="7">BETULIA</option>' +
                        '<option value="8">BOLIVAR</option>' +
                        '<option value="9">BUCARAMANGA</option>' +
                        '<option value="10">CABRERA</option>' +
                        '<option value="11">CALIFORNIA</option>' +
                        '<option value="12">CAPITANEJO</option>' +
                        '<option value="13">CARCASI</option>' +
                        '<option value="14">CEPITA</option>' +
                        '<option value="15">CERRITO</option>' +
                        '<option value="16">CHARALA</option>' +
                        '<option value="17">CHARTA</option>' +
                        '<option value="18">CHIMA</option>' +
                        '<option value="19">CHIPATA</option>' +
                        '<option value="20">CIMITARRA</option>' +
                        '<option value="21">CONCEPCIÓN</option>' +
                        '<option value="22">CONFINES</option>' +
                        '<option value="23">CONTRATACIÓN</option>' +
                        '<option value="24">COROMORO</option>' +
                        '<option value="25">CURITI</option>' +
                        '<option value="26">EL CARMEN</option>' +
                        '<option value="27">EL GUACAMAYO</option>' +
                        '<option value="28">EL PE~NÓN</option>' +
                        '<option value="29">EL PLAYÓN</option>' +
                        '<option value="30">ENCINO</option>' +
                        '<option value="31">ENCISO</option>' +
                        '<option value="32">FLORIAN</option>' +
                        '<option value="33">FLORIDABLANCA</option>' +
                        '<option value="34">GALAN</option>' +
                        '<option value="35">GAMBITA</option>' +
                        '<option value="36">GIRÓN</option>' +
                        '<option value="37">GUACA</option>' +
                        '<option value="38">GUADALUPE</option>' +
                        '<option value="39">GUAPOTA</option>' +
                        '<option value="40">GUAVATA</option>' +
                        '<option value="41">GUEPSA</option>' +
                        '<option value="42">HATO</option>' +
                        '<option value="43">JESUS MARIA</option>' +
                        '<option value="44">JORDAN</option>' +
                        '<option value="45">LA BELLEZA</option>' +
                        '<option value="46">LA PAZ</option>' +
                        '<option value="47">LANDAZURI</option>' +
                        '<option value="48">LEBRIJA</option>' +
                        '<option value="49">LOS SANTOS</option>' +
                        '<option value="50">MACARAVITA</option>' +
                        '<option value="51">MALAGA</option>' +
                        '<option value="52">MATANZA</option>' +
                        '<option value="53">MOGOTES</option>' +
                        '<option value="54">MOLAGAVITA</option>' +
                        '<option value="55">OCAMONTE</option>' +
                        '<option value="56">OIBA</option>' +
                        '<option value="57">ONZAGA</option>' +
                        '<option value="58">PALMAR</option>' +
                        '<option value="59">PALMAS DEL SOCORRO</option>' +
                        '<option value="60">PARAMO</option>' +
                        '<option value="61">PIEDECUESTA</option>' +
                        '<option value="62">PINCHOTE</option>' +
                        '<option value="63">PUENTE NACIONAL</option>' +
                        '<option value="64">PUERTO PARRA</option>' +
                        '<option value="65">PUERTO WILCHES</option>' +
                        '<option value="66">RIONEGRO</option>' +
                        '<option value="67">SABANA DE TORRES</option>' +
                        '<option value="68">SAN ANDRÉS</option>' +
                        '<option value="69">SAN BENITO</option>' +
                        '<option value="70">SAN GIL</option>' +
                        '<option value="71">SAN JOAQUIN</option>' +
                        '<option value="72">SAN JOSÉ DE MIRANDA</option>' +
                        '<option value="73">SAN MIGUEL</option>' +
                        '<option value="74">SAN VICENTE DE CHUCURI</option>' +
                        '<option value="75">SANTA BARBARA</option>' +
                        '<option value="76">SANTA HELENA</option>' +
                        '<option value="77">SIMACOTA</option>' +
                        '<option value="78">SOCORRO</option>' +
                        '<option value="79">SUAITA</option>' +
                        '<option value="80">SUCRE</option>' +
                        '<option value="81">SURATA</option>' +
                        '<option value="82">TONA</option>' +
                        '<option value="83">VALLE SAN JOSÉ</option>' +
                        '<option value="84">VÉLEZ</option>' +
                        '<option value="85">VETAS</option>' +
                        '<option value="86">VILLANUEVA</option>' +
                        '<option value="87">ZAPATOCA</option>'


                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 28) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">BUENAVISTA</option>' +
                        '<option value="2">CAIMITO</option>' +
                        '<option value="3">CHALAN</option>' +
                        '<option value="4">COLOSO</option>' +
                        '<option value="5">COROZAL</option>' +
                        '<option value="6">EL ROBLE</option>' +
                        '<option value="7">GALERAS</option>' +
                        '<option value="8">GUARANDA</option>' +
                        '<option value="9">LA UNIÓN</option>' +
                        '<option value="10">LOS PALMITOS</option>' +
                        '<option value="11">MAJAGUAL</option>' +
                        '<option value="12">MORROA</option>' +
                        '<option value="13">OVEJAS</option>' +
                        '<option value="14">PALMITO</option>' +
                        '<option value="15">SAMPUES</option>' +
                        '<option value="16">SAN BENITO ABAD</option>' +
                        '<option value="17">SAN JUAN DE BETULIA</option>' +
                        '<option value="18">SAN MARCOS</option>' +
                        '<option value="19">SAN ONOFRE</option>' +
                        '<option value="20">SAN PEDRO</option>' +
                        '<option value="21">SINCÉ</option>' +
                        '<option value="22">SINCELEJO</option>' +
                        '<option value="23">SUCRE</option>' +
                        '<option value="24">TOLU</option>' +
                        '<option value="25">TOLUVIEJO</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 29) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALPUJARRA</option>' +
                        '<option value="2">ALVARADO</option>' +
                        '<option value="3">AMBALEMA</option>' +
                        '<option value="4">ANZOATEGUI</option>' +
                        '<option value="5">ARMERO (GUAYABAL)</option>' +
                        '<option value="6">ATACO</option>' +
                        '<option value="7">CAJAMARCA</option>' +
                        '<option value="8">CARMEN DE APICALA</option>' +
                        '<option value="9">CASABIANCA</option>' +
                        '<option value="10">CHAPARRAL</option>' +
                        '<option value="11">COELLO</option>' +
                        '<option value="12">COYAIMA</option>' +
                        '<option value="13">CUNDAY</option>' +
                        '<option value="14">DOLORES</option>' +
                        '<option value="15">ESPINAL</option>' +
                        '<option value="16">FALAN</option>' +
                        '<option value="17">FLANDES</option>' +
                        '<option value="18">FRESNO</option>' +
                        '<option value="19">GUAMO</option>' +
                        '<option value="20">HERVEO</option>' +
                        '<option value="21">HONDA</option>' +
                        '<option value="22">IBAGUÉ</option>' +
                        '<option value="23">ICONONZO</option>' +
                        '<option value="24">LÉRIDA</option>' +
                        '<option value="25">LIBANO</option>' +
                        '<option value="26">MARIQUITA</option>' +
                        '<option value="27">MELGAR</option>' +
                        '<option value="28">MURILLO</option>' +
                        '<option value="29">NATAGAIMA</option>' +
                        '<option value="30">ORTEGA</option>' +
                        '<option value="31">PALOCABILDO</option>' +
                        '<option value="32">PIEDRAS PLANADAS</option>' +
                        '<option value="33">PRADO</option>' +
                        '<option value="34">PURIFICACIÓN</option>' +
                        '<option value="35">RIOBLANCO</option>' +
                        '<option value="36">RONCESVALLES</option>' +
                        '<option value="37">ROVIRA</option>' +
                        '<option value="38">SALDANA</option>' +
                        '<option value="39">SAN ANTONIO</option>' +
                        '<option value="40">SAN LUIS</option>' +
                        '<option value="41">SANTA ISABEL</option>' +
                        '<option value="42">SUAREZ</option>' +
                        '<option value="43">VALLE DE SAN JUAN</option>' +
                        '<option value="44">VENADILLO</option>' +
                        '<option value="45">VILLAHERMOSA</option>' +
                        '<option value="46">VILLARRICA</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 30) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">ALCALA</option>' +
                        '<option value="2">ANDALUCIA</option>' +
                        '<option value="3">ANSERMA NUEVO</option>' +
                        '<option value="4">ARGELIA</option>' +
                        '<option value="5">BOLIVAR</option>' +
                        '<option value="6">BUENAVENTURA</option>' +
                        '<option value="7">BUGA</option>' +
                        '<option value="8">BUGALAGRANDE</option>' +
                        '<option value="9">CAICEDONIA</option>' +
                        '<option value="10">CALI</option>' +
                        '<option value="11">CALIMA (DARIEN)</option>' +
                        '<option value="12">CANDELARIA</option>' +
                        '<option value="13">CARTAGO</option>' +
                        '<option value="14">DAGUA</option>' +
                        '<option value="15">EL AGUILA</option>' +
                        '<option value="16">EL CAIRO</option>' +
                        '<option value="17">EL CERRITO</option>' +
                        '<option value="18">EL DOVIO</option>' +
                        '<option value="19">FLORIDA</option>' +
                        '<option value="20">GINEBRA GUACARI</option>' +
                        '<option value="21">JAMUNDI</option>' +
                        '<option value="22">LA CUMBRE</option>' +
                        '<option value="23">LA UNIÓN</option>' +
                        '<option value="24">LA VICTORIA</option>' +
                        '<option value="25">OBANDO</option>' +
                        '<option value="26">PALMIRA</option>' +
                        '<option value="27">PRADERA</option>' +
                        '<option value="28">RESTREPO</option>' +
                        '<option value="29">RIO FRIO</option>' +
                        '<option value="30">ROLDANILLO</option>' +
                        '<option value="31">SAN PEDRO</option>' +
                        '<option value="32">SEVILLA</option>' +
                        '<option value="33">TORO</option>' +
                        '<option value="34">TRUJILLO</option>' +
                        '<option value="35">TULUA</option>' +
                        '<option value="36">ULLOA</option>' +
                        '<option value="37">VERSALLES</option>' +
                        '<option value="38">VIJES</option>' +
                        '<option value="39">YOTOCO</option>' +
                        '<option value="40">YUMBO</option>' +
                        '<option value="41">ZARZAL</option>'

                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 31) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">CARURU</option>' +
                        '<option value="2">MITU</option>' +
                        '<option value="3">PACOA</option>' +
                        '<option value="4">PAPUNAUA</option>' +
                        '<option value="5">TARAIRA</option>' +
                        '<option value="6">YAVARATÉ</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
            if (selec == 32) {
                var opti = '<option value="0">Selecione</option>' +
                        '<option value="1">CUMARIBO</option>' +
                        '<option value="2">LA PRIMAVERA</option>' +
                        '<option value="3">PUERTO CARRENO</option>' +
                        '<option value="4">SANTA ROSALIA</option>'
                        + '';
                $('#municipio_grado').html(opti);
            }
        }
                ); 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        </script>