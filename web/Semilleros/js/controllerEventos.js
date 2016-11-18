var app=angular.module("myApp",[]);

app.controller('cntrlTipoEventos', function($scope,$http){
   
    $scope.mostrar=function(){
         $http.get('../servletTipoEvento')
            .success(function(data) {
                 $scope.tipoEvento=data;
            });
    };
   $scope.mostrar();
  
  $scope.registrarTipoEvento=function(){
        $.ajax({
      url:'../servletTipoEvento',
      type:'post',
      datatype:'json',
      data:{nombre:$scope.nombre,descripcion:$scope.descripcion},
      success:function(resultado){
          if(resultado==1){
              alert("registro exitoso");
              $scope.mostrar();
          }else{
              alert("no se ha podido registrar");
          }
              
      }
   });
      
     
  };
   
});
app.controller('Eventos', function($scope,$http){
   
    $scope.mostrar=function(){
         $http.get('../servletTipoEvento')
            .success(function(data) {
                 $scope.tipoEvento=data;
            });
    };
   $scope.mostrar();
  
  $scope.registrarEvento=function(){
   
        $.ajax({
      url:'../servletEvento',
      type:'post',
      datatype:'json',
      data:{sigla:$scope.sigla,descripcion:$scope.descripcion,fechaini:document.getElementById("inicio").value,fechafin:document.getElementById("fin").value,organizador:$scope.organizador,costo:$scope.costo,tipoEs:$scope.tipoEs,capacidad:$scope.capacidad},
      success:function(resultado){
          if(resultado==1){
              alert("registro exitoso");
              $scope.mostrar();
          }else{
              alert("no se ha podido registrar");
          }
              
      }
   });
      
     
  };
   
});

app.controller('index', function($scope,$http){
   
    $scope.mostrar=function(){
         $http.get('servletEvento')
            .success(function(data) {
                 $scope.Eventos=data;
            });
    };
   $scope.mostrar();
  

   
});

