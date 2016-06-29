var miramapApp = angular.module('miramapApp', [
    // Dépendances du "module"
    'ngRoute',
    'miramapAppControllers',
    'ngMap']);


miramapApp.run(function($rootScope) {
    $rootScope.base_url = "http://localhost:8888/CESI/miramap_php/#";
})
////////////////////////////////    DEBUT ROUTING    /////////////////////////////////////////////

miramapApp.config(['$routeProvider',
    function($routeProvider) { 
        
        // Système de routage
        $routeProvider
        .when('/', {
            templateUrl: 'partials/a-propos.html',
            controller: 'homeCtrl'
        })
        .when('/liste-paniers', {
            templateUrl: 'partials/liste-paniers.html',
            controller: 'listePaniersCtrl'
        })
        .when('/producteurs', {
            templateUrl: 'partials/liste-producteurs.html',
            controller: 'listeProducteursCtrl'
        })
        .when('/localisation-amap', {
            templateUrl: 'partials/localisation-amap.html',
            controller: 'locationCtrl'
        })
   	    .when('/a-propos', {
            templateUrl: 'partials/a-propos.html',
            controller: 'aboutCtrl'
        })
        .when('/contact', {
            templateUrl: 'partials/contact.html',
            controller: 'contactCtrl'
        })
        .when('/creation-panier', {
            templateUrl: 'partials/creation-panier.html',
            controller: 'creationPanierCtrl'
        })
        .when('/producteurs/:userId', {
            templateUrl: 'partials/producteur-paniers.html',
            controller: 'producteurPaniersCtrl'
        })
        .otherwise({
            redirectTo: '/'
        });
    }
]);

/**
 * Définition des contrôleurs
 */
var miramapAppControllers = angular.module('miramapAppControllers', []);

////////////////////////////////    FIN ROUTING    /////////////////////////////////////////////


////////////////////////////////    DEBUT INSCRIPTION    /////////////////////////////////////////////

    miramapApp.controller('inscriptionCtrl', function($scope, $http) {

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
                $('#inscription').children('form').slideUp();
                $('#inscription').prepend('<div class="loading-container"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours</p></div>');
                $('.loading').animate({width: "100%"}, 1700);

                setTimeout(function () {
                    $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien inscrit !</h2><p class="prim-color">Vous pouvez maintenant vous connecter.</p></div>');
                }, 1700);

                setTimeout(function () {
                    $.fancybox.close();
                }, 3000);
                $('.loading-container').remove();
                $('#inscription form').show();
                
                window.location.href = '#/';
                

            }).error(function (data) {
            
                console.log(data);

                alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

            });
        };
    });

////////////////////////////////   FIN INSCRIPTION  /////////////////////////////////////////////

////////////////////////////////    DEBUT LOGIN    /////////////////////////////////////////////

    miramapApp.controller('loginCtrl', function($scope, $http) {

        // Perform the login action when the user submits the login form
        $scope.loginAction = function() {

            var data = 
            {
                "email" : $scope.emailLogin,
                "password" : $scope.passwordLogin,
            };
            console.log(data);
            $http({
                method : 'post',
                url : "http://localhost/miramap_php/bower_components/php/connexion.php",
                data : data,
                dataType : 'application/json',
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
            }).success(function (data) {

                window.location.href = '#/';
                console.log(data);
                alert('Bien logged ! Vous pouvez vous connecter.' + data);
            
            }).error(function (data) {
            
                console.log(data);

                alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

            });
        };

    });

////////////////////////////////    FIN LOGIN    /////////////////////////////////////////////

// Contrôleur de la page de contact
miramapApp.controller('producteurPaniersCtrl', function($scope, $http) {

    $scope.pageId = 'producteur-paniers';
    var data = {
        "id_producteur": $scope.userId
    }

    $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/paniers.php",
        data : data,
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {

        $scope.paniers = data;

    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });
});

////////////////////////////////    DEBUT PANIERS    /////////////////////////////////////////////

    miramapApp.controller('creationPanierCtrl', function($scope, $http, $filter) {

        $scope.pageId = 'creation-panier';

            var data = {
                "producteur" : 1
            }

            $http({
                method : 'post',
                url : "http://localhost:8888/CESI/miramap_php/bower_components/php/produits.php",
                data : data,
                dataType : 'application/json',
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

            }).success(function (data) {
                $scope.produitsPanier = data;  
            }).error(function (data) {
            
                console.log(data);
                alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

            });

        $scope.total = 0;
        $('#submitPanier').prop('disabled', true);
        $scope.produitsListed = [];
        $scope.ajoutLigneAction = function(item){

            if ($scope.nomProduitPanier && $scope.quantiteProduitPanier && $scope.quantiteProduitPanier > 0) {
                if ($('.liste-produits-panier').is(':hidden')) {
                    $('.liste-produits-panier').slideDown();
                };
                $scope.produitsListed.push({"libelle": $scope.nomProduitPanier.replace(/(.*) - ([0-9]+)€/, '$1'), "quantite": $scope.quantiteProduitPanier, "prix": $scope.quantiteProduitPanier * $scope.nomProduitPanier.replace(/(.*) - ([0-9]+)€/, '$2')});
                $scope.total += $scope.quantiteProduitPanier * $scope.nomProduitPanier.replace(/(.*) - ([0-9]+)€/, '$2');
                console.log($scope.produitsListed);

                $('#submitPanier').prop('disabled', false);
            };
            
        };

        //supprimer item de la liste
        $scope.supprimerProduitPanier = function(index){

            $scope.total -= $scope.produitsListed[index].prix;
            $scope.produitsListed.splice(index, 1);
            if ($scope.produitsListed.length == 0) {
                $('#submitPanier').prop('disabled', true);
                $('.liste-produits-panier').slideUp();
            }
                           
        };

        $scope.creerPanier = function(){

            if (typeof $scope.nomPanier != undefined) {


                var data = {
                    "libelle" : $scope.nomPanier,
                    "prix_total" : $scope.total,
                    "produits" : $scope.produitsListed,
                    "producteur" : $('#produit-producteur').val()
                }

                
                $http({
                    method : 'post',
                    url : "http://localhost:8888/CESI/miramap_php/bower_components/php/creation-panier.php",
                    data : data,
                    dataType : 'application/json',
                    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

                }).success(function (data) {
                    $('#form-panier-container').children('form').slideUp();
                    $('#form-panier-container').prepend('<div class="loading-container"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours de création</p></div>');
                    $('.loading').animate({width: "100%"}, 1700);
                    setTimeout(function () {
                        $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien ajouté !</h2></div>');
                    }, 1700);

                    setTimeout(function () {
                        $('.loading-container').remove();
                        $('#form-panier-container form').slideDown();   
                        $('#form-panier-container input').val('');
                        $('#form-panier-container select').val('');
                        $('.liste-produits-panier').slideUp();
                    }, 5000);
                    
                }).error(function (data) {
                
                    console.log(data);
                    alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

                });
            };
        }

        // au click du bouton
        $scope.ajoutProduitAction = function() {

            var data = {
                "libelle" : $scope.nomProduit,
                "prix_unitaire" : $scope.prixProduit,
                "quantite" : $scope.quantiteProduit,
                "producteur" : $('#produit-producteur').val()
            }

            $http({
                method : 'post',
                url : "http://localhost:8888/CESI/miramap_php/bower_components/php/creation-produit.php",
                data : data,
                dataType : 'application/json',
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

            }).success(function (data) {
                $('#form-produit-container').children('form').slideUp();
                $('#form-produit-container').prepend('<div class="loading-container"><div style="height:30px;width:400px;background:#E7E7E7;border-radius:5px;margin:0 auto"><div class="loading" style="height:100%;width:0px;background-color:#57AB4C;border-radius:5px"></div></div><br/><p class="text-center prim-color">En cours d\'ajout</p></div>');
                $('.loading').animate({width: "100%"}, 1700);
                setTimeout(function () {
                    $('.loading-container').html('<div class="text-center" style="width:100%"><i class="fa fa-check-circle text-center" style="color:#57AB4C;font-size:40px;margin:0 auto" aria-hidden="true"></i><h2 class="prim-color">Bien ajouté !</h2><p class="prim-color">Vous pouvez maintenant ajouter ce produit à un panier.</p></div>');
                }, 1700);

                setTimeout(function () {
                    $('.loading-container').remove();
                    $('#form-produit-container form').slideDown();   
                    $('#form-produit-container input').val('');
                }, 5000);

                var data = {
                    "producteur" : 1
                }

                $http({
                    method : 'post',
                    url : "http://localhost:8888/CESI/miramap_php/bower_components/php/produits.php",
                    data : data,
                    dataType : 'application/json',
                    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

                }).success(function (data) {
                    $scope.produitsPanier = data;  
                }).error(function (data) {
                
                    console.log(data);
                    alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

                });
                
            }).error(function (data) {
            
                console.log(data);
                alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

            });


        };
    });

////////////////////////////////   FIN PANIERS  /////////////////////////////////////////////

// Contrôleur de la page d'accueil
miramapApp.controller('homeCtrl', function($scope) {

    $scope.pageId = 'home';

});

// Contrôleur de la page des producteurs
miramapApp.controller('listeProducteursCtrl', function($scope, $http) {
    
    $scope.pageId = 'liste-producteurs';
    $http({
        method : 'get',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/producteurs.php",
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
    }).success(function (data) {

        console.log(data);
        $scope.producteurs = data;

    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });

});

// Contrôleur de la page de localisation des points de vente
miramapApp.controller('locationCtrl', function($scope) {

    $scope.pageId = 'localisation-amap';

});

// Contrôleur de la page de contact
miramapApp.controller('contactCtrl', function($scope) {

    $scope.pageId = 'contact';

});
