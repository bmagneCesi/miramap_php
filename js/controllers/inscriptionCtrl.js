'use trict';

app.controller('inscriptionCtrl', function($scope, $http,$localStorage) {

    $scope.pageId = 'inscription-page';
    if ($localStorage.session.logged) {
        window.location.href = '#/';
    };
    $scope.regions =   [{"region" : "Alsace"},
                        {"region" : "Aquitaine"},
                        {"region" : "Auvergne"},
                        {"region" : "Basse Normandie"},
                        {"region" : "Bourgogne"},
                        {"region" : "Bretagne"},
                        {"region" : "Centre"},
                        {"region" : "Champagne Ardenne"},
                        {"region" : "Corse"},
                        {"region" : "Franche Comte"},
                        {"region" : "Haute Normandie"},
                        {"region" : "Ile de France"},
                        {"region" : "Languedoc Roussillon"},
                        {"region" : "Limousin"},
                        {"region" : "Lorraine"},
                        {"region" : "Midi-Pyrénées"},
                        {"region" : "Nord Pas de Calais"},
                        {"region" : "Provence Alpes Côte d'Azur"},
                        {"region" : "Pays de la Loire"},
                        {"region" : "Picardie"},
                        {"region" : "Poitou Charente"},
                        {"region" : "Rhone Alpes"}
                        ];

    // Perform the login action when the user submits the login form
    $scope.inscriptionAction = function() {

        var data = 
        {
            "email" : $scope.emailInscription,
            "password" : $scope.passwordInscription,
            "nom" : $scope.nomInscription,
            "prenom" : $scope.prenomInscription,
            "adresse" : $scope.adresseInscription,
            "ville" : $scope.villeInscription,
            "telephone" : $scope.telephoneInscription,
            "type_utilisateur" : $scope.typeUtilisateurInscription,
            "civilite" : $scope.civiliteInscription,
            "nationalite" : $scope.nationaliteInscription,
            "code_postal" : $scope.codePostalInscription,
            "region" : $scope.regionInscription,
            "date_naissance" : $('#inscription-date-naissance').val()
        };

        $http({
            method : 'post',
            url : "http://localhost:8888/CESI/miramap_php/bower_components/php/inscription.php",
            data : data,
            dataType : 'application/json',
            headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

        }).success(function (data) {
            // $('#inscription').children('form').slideUp();
            $('#inscription form').slideUp('fast').parent().prepend('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien inscrit !</h2><p class="prim-color">Vous pouvez maintenant vous connecter.</p></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#inscription form').slideDown();
            }, 5000);
            
            
            window.location.href = '#/';
            

        }).error(function (data) {
        
            console.log(data);

            alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

             $('#inscription form').slideUp('fast').parent().prepend('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-exclamation-triangle text-center" style="color:red;font-size:40px;margin:0 auto" aria-hidden="true"></i><br/><p style="color:red">Erreur : <strong>"'+data+'"</strong></p><p style="color:red">Veuillez réessayer.</p></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#inscription form').slideDown();
            }, 5000);

        });
    };
});
