/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function fijarfechainicio_inicio(fechamin){
    
    document.getElementById('fechainicio').min = fechamin;
    document.getElementById('fechaterminacion').min = fechamin;
}

function fijarfechainicio_terminacion(fechamin){
         
    document.getElementById('fecharadicacion').max = fechamin;      
    document.getElementById('fechaterminacion').min = fechamin;
}

function fijarfechalimite_inicio(fechamax){
    
    document.getElementById('fechainicio').max = fechamax;
    document.getElementById('fecharadicacion').max = fechamax;   
}