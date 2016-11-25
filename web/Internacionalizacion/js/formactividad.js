/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var indice = 0;
var newdiv;

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

function mostrarpasantia(){
    
    var actividad = document.getElementById('tipoactividad').value;
    
    if(actividad==='Pasantia'){
        if(document.getElementById('panelpasantia').style.display==='none')
            document.getElementById('panelpasantia').style.display = 'block';                    
    }
    else
            document.getElementById('panelpasantia').style.display = 'none';
}