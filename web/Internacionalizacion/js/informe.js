/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function habilitarrango(){
    
    var rango = document.getElementById('rango').checked;
    
    if(rango){
        document.getElementById('desde').disabled = true;
        document.getElementById('hasta').disabled = true;
    }
    else{
        document.getElementById('desde').disabled = false;
        document.getElementById('hasta').disabled = false;
    }
   
}


