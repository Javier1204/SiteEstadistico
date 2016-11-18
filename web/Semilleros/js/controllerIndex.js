/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app=angular.module("myApp",[]);

app.controller('cntrlSem', function($scope,$http){
    $scope.mostrar=function(){
         $http.get('servletSemillero')
            .success(function(data) {
                 $scope.semillero=data;
            });
    };
   $scope.mostrar();
  
  $scope.cargarModal=function(sigla,nombre,telefono,ubicacion,correo,historia){
                   
                    $scope.nombreS=nombre; 
                    $scope.telefono=telefono;
                    $scope.ubicacion=ubicacion;
                    $scope.correo=correo;
                    $scope.historia=historia;
                 
     
  };
   
});
app.controller('cntrlBox', function($scope,$http){
    $scope.desactivarC=true;
    $scope.mostrarS=function(){
         $http.get('servletSemillero')
            .success(function(data) {
    
                 $scope.semilleros=data;
            });
    };
   $scope.mostrarS();
 
   $scope.buscarEstudiante=function(){
       if($scope.codigo==undefined){
           alert("Debe escribir primero el codigo");
       }else{
          
       $.ajax({
                url:'servletEstudiante',
                type:'get',
                datatype:'json',
                data:{accion:"consultar",codigo:$scope.codigo},
                success:function(resultado){
                    var myobj = JSON.parse(resultado);
                    
                    if(myobj.length>0){
                      alert("BUSQUEDA EXITOSA");
                    $scope.$apply(function () {
                    $scope.desactivarCC=true;
                    $scope.desactivarC=false;
                    $scope.nombres=myobj[0].nombres;
                    $scope.apellidos=myobj[0].apellidos;
                    $scope.documento=myobj[0].documentoId;
                   });
                    
                    }else{
                        alert("NO SE ENCONTRO ESTUDIANTE CON ESE CODIGO");
                    }
                   
                  
                }
             });
       }
   };
   
});



