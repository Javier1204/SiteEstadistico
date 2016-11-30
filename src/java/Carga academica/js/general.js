/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('.horasE').keyup(function () {
    alert("hola");
    // initialize the sum (total price) to zero
    var sum = 0;
    $('.horasE').each(function() {
        sum += Number($(this).val());
    });
    $('#horaSemestre').val(sum);
     
});

