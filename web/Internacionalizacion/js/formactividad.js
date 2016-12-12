/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var indice = 0;
var newdiv;


//Permite la consulta de las actividades por ajax :)
    $(document).ready(function () {
    $("#consultaractividades").click(function (evento) {
        evento.preventDefault();
        $("#destino").load("consultarActividades.jsp");
        
        
        //console.log("Hola");
    });
});

    //Permite la carga del formulario de registro de actividades por ajax :)
    $(document).ready(function () {
    $("#registraractividades").click(function (evento) {
        evento.preventDefault();
        $("#destino").load("formRegistraractividad.jsp");
        
        
        //console.log("Hola");
    });
});

//Permite la carga del listado de convenios por ajax :)
$(document).ready(function () {
    $("#consultarconvenios").click(function (evento) {
        evento.preventDefault();
        $("#destino").load("consultarConvenios.jsp");
        
        
        //console.log("Hola");
    });
});

//Permite la generacion del formulario informe por ajax:)
$(document).ready(function () {
    $("#generarinforme").click(function (evento) {
        evento.preventDefault();
        $("#destino").load("formInforme.jsp");
        
        
        //console.log("Hola");
    });
});

function desahabilitarboton(){
    document.getElementById('generarinforme').disabled = true;
}


function addInput(divName)
{
    var n;
    newdiv = document.createElement('div');
    //div2 = document.createElement('div');
    //newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label>";
    newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label><input type='text' class='ufps-input' name='estudiantes'>";
    //+ "<input type='button' class='ufps-btn' value='Quitar Estudiante' onClick=borrarInput('insertar');>";
    document.getElementById(divName).appendChild(newdiv);

    indice++;

}


/*function borrarInput(divName)
 {    
 var n;
 //var newdiv = document.removeChild();
 //newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label>";
 //newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label><input type='text' class='ufps-input' name='boton"+indice+"'>";
 String boton = document.getElementsByName("boton"+indice);
 document.getElementById(divName).removeChild(document.getElementsByName("boton"+indice));
 indice--;
 
 }*/

function consultarconvenios()
{

    $(document).ready(function () {
        $("#convenios").click(function (evento) {
            evento.preventDefault();
            $("#destino").load("consultarConvenios.jsp");


            console.log("Hola");
        });
    });
}

function fijarvalormin(valor) {

    document.getElementById('terminacion').min = valor;
}

function mostrarpasantia() {

    var actividad = document.getElementById('tipoactividad').value;
    document.getElementById('hora').disabled=false;
    if(document.getElementById('tipoactividad').value!=="Social")
            document.getElementById('hora').disabled=true;

    if (actividad === 'Pasantia') {
        if (document.getElementById('panelpasantia').style.display === 'none')
            document.getElementById('panelpasantia').style.display = 'block';
    } else
        document.getElementById('panelpasantia').style.display = 'none';
}
/*
 
 $(document).ready(function(){
 var i = 0;
 $("#convenio").change(function () {
 $("#convenio option:selected").each(function () {
 convenio=$(this).val();
 $.post("procesar_tipo_actividades.jsp", { convenio: convenio }, function(rta){
 var parsed = JSON.parse(rta);
 var arr = [];
 for (var x in parsed) {
 arr.push(parsed[x]);
 document.write(x) ;
 document.writeln(x);
 console.log(x);
 }
 $('#tipoactividad').empty();
 for(var t in arr){
 $('#tipoactividad').append("<option value='" + t + "'>" + t + "</option>");
 }
 
 });            
 });
 });
 });
 */
function cambiarTipo(convenio) {
    //var convenio = document.getElementById('convenio').value;
    //var elementos = document.getElementById('tipoactividad').value;
    //$("#convenio").change(function () {
    $('#tipoactividad').empty();
    console.log("hola");
    var i = 0;
    //var convenio = $("#convenio").val();
    $.ajax({
        url: "procesar_tipo_actividades.jsp",
        type: "post",
        
        data: {
            convenio: convenio
        }
    }).done(function (rta) {
//para fijar fechas min y max de los input date
//document.getElementById('creacion').min = obtener la fecha minima del procesar_tipo_actividades.
//document.getElementById('terminacion').max = obtener la fecha maxima del procesar_tipo_actividades.
//document.getElementById('tipoactividad').value;

        //json = eval('(' + rta + ')');
        var parsed = JSON.parse(rta);
        var arr = [];
        var i = parsed.length;
        for (var x=0;x<i-2;x++) {
        //for(var x in parsed){
            //arr.push(parsed[x]);
            
            
            $('#tipoactividad').append("<option value='" + parsed[x] + "'>" + parsed[x] + "</option>");
            
        }
        document.getElementById('creacion').min = parsed[i-2];
        document.getElementById('terminacion').max = parsed[i-1];
    });
    /*$.getJSON("procesar_tipo_actividades.jsp", function (resultado) {
     // aqui resultado sera directamente el boolean
     var parsed = JSON.parse(resultado);
     var arr = [];
     
     for (var x in parsed) {
     
     arr.push(parsed[x]);
     
     
     
     console.log("eso"+arr[0]);
     };
     });*/
}
/*
 var i = 0;
 var convenio = $("#convenio").val();
 //var opts;
 $.ajax({
 url: "procesar_tipo_actividades.jsp",
 type: "POST",
 data: {convenio: convenio},
 done: function (rta) {
 console.log(rta);
 
 var parsed = JSON.parse(rta);
 $("#tipoactividad").empty();
 //var yourArray = parsed.toArray();            
 var arr = [];
 
 for(var x in parsed) {
 
 arr.push(parsed[x]);
 
 document.write(x);
 document.writeln(x);
 console.log(x);
 }
 
 //elementos.each( function (){
 //opts += "<option value="+arr+">"+arr;
 //});
 $('#tipoactividad').append('<option value="example''" selected="selected" Opcion #'+" pasantia"+ '</option>');
 $('#tipoactividad').html('<option >'"pasantia"'</option>');
 //$("#tipoactividad").html(rta);
 
 //$('#tipoactividad').empty();
 //$('#tipoactividad').append("<option value=''>Seleccione un corregimiento</option>");
 //$.each(rta, function (index, arr) {
 //  $('#tipoactividad').append("<option value='" + index + "'>" + arr + "</option>");
 // });
 });
 $('#tipoactividad').append("<option value=''>Seleccione un corregimiento</option>");
 $('#tipoactividad').append("<option value='" +"Pasantia"+ "'>pasantia</option>");
 };
 };
 
 
 */
