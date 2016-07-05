'use strict';

app.controller('profilCtrl', function ($scope,$http,$localStorage) {

    $scope.pageId = 'profil-page';
    $scope.visibilityInput = false;
    $scope.visibilityText = true;
    $scope.dateLivraison = false;

    var data= {
    	"id_utilisateur": $localStorage.session.id,
        "role": $localStorage.session.role
    };
    console.log($localStorage.session.id);
      $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/profil.php",
        data : data,
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {

        $scope.profil = data;
        console.log(data);
        
    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });

    $scope.modifierProfilAction = function(){

    	$scope.visibilityInput = true;
    	$scope.visibilityText = false;

    }

    $scope.updateProfilAction = function(){

        var data = 
        {
        	"id_utilisateur": $localStorage.session.id,
            "mail" : $scope.mail,
            "nom" : $scope.nom,
            "prenom" : $scope.prenom,
            "adresse" : $scope.adresse,
            "ville" : $scope.ville,
            "telephone" : $scope.telephone,
            "date_naissance" : $('#date_naissance').text()
        };

        console.log(data);

	  	$http({
	        method : 'post',
	        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/profilUpdate.php",
	        data : data,
	        dataType : 'application/json',
	        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

	    }).success(function (data) {
	    	console.log(data);
            $('#profil-form').slideUp('fast').parent().append('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);
            $scope.visibilityText = true;
            $scope.visibilityInput = false;
            
            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien modifié !</h2></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#profil-form').slideDown();
            }, 5000);
            
        }).error(function (data) {
        
            console.log(data);

            alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

             $('#profil-form').slideUp('fast').parent().append('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-exclamation-triangle text-center" style="color:red;font-size:40px;margin:0 auto" aria-hidden="true"></i><br/><p style="color:red">Erreur : <strong>"'+data+'"</strong></p><p style="color:red">Veuillez réessayer.</p></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#profil-form').slideDown();
            }, 5000);

        });

    }

    $scope.updateLivraisonAction = function(dateLivraisonProducteur){

        var date = $('.input-date').val();
        $('.input-date').parent().html('<p>'+date+'</p>');
        $('.etat').html('<p class="label label-success">VALIDÉ</p>');
        $('.updateLivraison').parent().html('<i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:20px;margin:0 auto" aria-hidden="true"></i>');
    }

});
