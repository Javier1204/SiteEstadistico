/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var indice = 0;

function addInput(divName)
{    
        var n;
        var newdiv = document.createElement('div');
        //newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label>";
        newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label><input type='text' class='ufps-input' name='boton"+indice+"'>";
        document.getElementById(divName).appendChild(newdiv);
        indice++;
    
}


function borrarInput(divName)
{    
        var n;
        var newdiv = document.createElement('div');
        //newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label>";
        newdiv.innerHTML = "<label>Ingrese codigo estudiante: </label><input type='text' class='ufps-input' name='boton"+indice+"'>";
        document.getElementById(divName).appendChild(newdiv);
        indice++;
    
}

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