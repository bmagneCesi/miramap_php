app.controller('achatPanierCtrl', function($scope, $http, $routeParams, $rootScope) {

    $scope.pageId = 'achat-paniers';
    $scope.mois = [];
    $scope.annee = [];

    for (var i = 1; i <= 12; i++) {
        $scope.mois.push(i);
    };

    for (var i = 2016; i <= 2030; i++) {
        $scope.annee.push(i);
    };

    var data = {
        "id_panier": $routeParams.idPanier
    }

    $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/paniers.php",
        data : data,
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {
        $scope.panierRecap = data.panier[0];
        $scope.livraison = data.livraison;

    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });



     // Perform the login action when the user submits the login form
    $scope.paiementAction = function() {
        var data = 
        {
            "id_utilisateur" : $rootScope.session.id,
            "id_panier" : $('#id_panier').val(),
            "livraison" : $scope.achatLivraison
        };
        
        console.log(data);
        
        $http({
            method : 'post',
            url : "http://localhost:8888/CESI/miramap_php/bower_components/php/creation-contrat.php",
            data : data,
            dataType : 'application/json',
            headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

        }).success(function (data) {
            $('#achat-form').slideUp('fast').parent().append('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);
            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Merci pour votre achat !</h2><p class="prim-color">'+$('#producteur-infos').val()+' doit maintenant valider votre commande.</p></div>');
            }, 1700);

            setTimeout(function () {
                window.location.href = '#/profil';
            }, 5000);
            
            
            
            

        }).error(function (data) {
        
            console.log(data);

            alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

             $('#achat-form form').slideUp('fast').parent().append('<div class="loading-container" style="margin-top:20px"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
            $('.loading').animate({width: "100%"}, 1700);

            setTimeout(function () {
                $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-exclamation-triangle text-center" style="color:red;font-size:40px;margin:0 auto" aria-hidden="true"></i><br/><p style="color:red">Erreur : <strong>"'+data+'"</strong></p><p style="color:red">Veuillez réessayer.</p></div>');
            }, 1700);

            setTimeout(function () {
                $('.loading-container').remove();
                $('#inscription form').slideDown();
            }, 5000);

        });
    }     
});