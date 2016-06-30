'use strict';

app.controller('loginCtrl', function ($scope,$http) {

    $scope.pageId = 'connexion-page';

    $scope.credentials = {
        username: '',
        password: ''
    };

    // Perform the login action when the user submits the login form
        $scope.loginAction = function(credentials) {

        	var data = {};

        $http({
            method : 'post',
            url : "http://localhost:8888/CESI/miramap_php/bower_components/php/connexion.php",
            data : data,
            dataType : 'application/json',
            headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

        }).success(function (data) {
            // $('#inscription').children('form').slideUp();
            $('#connexion form').slideUp('fast').parent().prepend('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien connecté !</h2></div>');
            }, 1700);

            setTimeout(function () {
               window.location.href = '#/';
            }, 4000);
            

        }).error(function (data) {

             $('#connexion form').slideUp('fast').parent().prepend('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-exclamation-triangle text-center" style="color:red;font-size:40px;margin:0 auto" aria-hidden="true"></i><br/><p style="color:red">Erreur : <br><strong>"'+data+'"</strong></p><p style="color:red">Veuillez réessayer.</p></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#connexion form').slideDown();
            }, 5000);

        });
        };

});
