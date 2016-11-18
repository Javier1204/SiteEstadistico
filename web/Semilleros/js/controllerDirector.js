var app=angular.module("myApp",[]);
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
app.controller('inicio', function($scope,$http){
    $scope.desactivarC=true;
    $scope.desactivarCC=true;
    $scope.mostrar=function(){
         $http.get('../servlerDatosSemillero')
            .success(function(data) {
                $scope.nombre=data[0].nombre;
                $scope.sigla=data[0].sigla;
                $scope.telefono=data[0].telefono;
                $scope.ubicacion=data[0].ubicacion;
                $scope.paginaW=data[0].paginaWeb;
                $scope.grupoI=data[0].grupoInvestigacionAsoc;
                $scope.mision=data[0].mision;
                $scope.vision=data[0].vision;
                $scope.objetivos=data[0].objetivos;
                $scope.historia=data[0].historia;
                $scope.correo=data[0].correo;
            });
    };
 
  $scope.mostrar();
  $scope.habilitarC=function(){
      $scope.desactivarC=false;
  };
  
  $scope.actualizar=function(){

         $.ajax({
      url:'../servlerDatosSemillero',
      type:'post',
      datatype:'json',
      data:{telefono:$scope.telefono,ubicacion:$scope.ubicacion,pagina:$scope.paginaW,mision:$scope.mision,vision:$scope.vision,objetivos:$scope.objetivos,historia:$scope.historia,correo:$scope.correo},
      success:function(resultado){
          if(resultado==1){
              alert("ACTUALIZACION EXITOSA");
               $scope.desactivarC=true;
              $scope.mostrar();
          }else{
              alert("no se ha podido registrar");
          }
              
      }
   });
      
  };
 
});
app.controller('lineasI', function($scope,$http){
    
    $scope.mostrar=function(){
         $http.get('../servletLineasI')
            .success(function(data) {
                $scope.lineas=data;
            });
    };
 
  $scope.mostrar();
  
  
  $scope.registrarL=function(){

         $.ajax({
      url:'../servletLineasI',
      type:'post',
      datatype:'json',
      data:{nombre:$scope.nombre,descripcion:$scope.descripcion,estado:$scope.estado,objetivos:$scope.objetivos},
      success:function(resultado){
          if(resultado==1){
              alert("REGISTRO EXITOSO");
              $scope.nombre="";
              $scope.descripcion="";
              $scope.estado="";
              $scope.objetivos="";
              $scope.mostrar();
          }else{
              alert("no se ha podido registrar");
          }
              
      }
   });
      
  };
 
});

app.controller('proyectos', function($scope,$http){
    
    $scope.mostrar=function(){
         $http.get('../servletLineasI')
            .success(function(data) {
                $scope.lineas=data;
            });
    };
  $scope.mostrar();
 
  
  $scope.mostrarD=function(){
         $http.get('../servletDocente')
            .success(function(data) {
                $scope.docentes=data;
            });
    };
 
 
  $scope.mostrarD();
  
  $scope.registrarP=function(){
alert($scope.lineaI);
         $.ajax({
      url:'../servletProyecto',
      type:'post',
      datatype:'json',
      data:{nombre:$scope.nombre,estado:$scope.estado,director:$scope.director,lineaI:$scope.lineaI,fechaini:document.getElementById("inicio").value,fechafin:document.getElementById("fin").value},
      success:function(resultado){
          if(resultado==1){
              alert("REGISTRO EXITOSO");
              $scope.nombre="";
              $scope.descripcion="";
              $scope.estado="";
              $scope.objetivos="";
              $scope.mostrar();
          }else{
              alert("no se ha podido registrar");
          }
              
      }
   });
      
  };
 
});

app.controller('consultaP', function($scope,$http){
   
    $scope.mostrar=function(){
         
         $http.get('../servletProyecto')
            .success(function(data) {
                $scope.data=data;
            });
    };
  $scope.mostrar();
});

app.controller('consultaPP', function($scope,$http){
   
    $scope.mostrar=function(){
         
         $http.get('servletProyecto')
            .success(function(data) {
                $scope.data=data;
            });
    };
  $scope.mostrar();
});
