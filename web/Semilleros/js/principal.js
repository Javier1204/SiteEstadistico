/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
function hola(){
    alert(document.getElementById('nombreS').value);
   $.ajax({
      url:'../Servlet',
      type:'get',
      datatype:'json',
      data:{valor:document.getElementById('nombreS').value},
      success:function(resultado){
          alert(resultado);
      }
   });
}
*/
var app=angular.module("myApp",[]);

app.controller('cntrl', function($scope,$http){
    $scope.mostrar=function(){
         $http.get('../servletGrupoI')
            .success(function(data) {
                 $scope.grupo=data;
            });
    };
   $scope.mostrar();
   
   $scope.registrarSemillero=function(){
    
       $.ajax({
      url:'../servletSemillero',
      type:'post',
      datatype:'json',
      data:{accion:"registrar",siglaS:$scope.siglaS,nombreS:$scope.nombreS,directorS:$scope.directorS,grupoS:$scope.grupoS},
      success:function(resultado){
          if(resultado==1){
              alert("registro exitoso");
          }else{
              alert("problema el registrar");
          }
      }
   });
      
      
      
   };
});
app.controller('index', function($scope,$http){

    $scope.mostrar=function(){
         $http.get('../servletSemillero')
            .success(function(data) {
                 $scope.data=data;
            });
    };
   $scope.mostrar();
      
      
      
   
});
