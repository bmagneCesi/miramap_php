var miramapApp = angular.module('miramapApp', [
    // Dépendances du "module"
    'ngRoute',
    'miramapAppControllers',
    'ngMap']);

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
        .when('/liste-producteurs', {
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
        .otherwise({
            redirectTo: '/'
        });
    }
]);

/**
 * Définition des contrôleurs
 */
var miramapAppControllers = angular.module('miramapAppControllers', []);

////////////////////////////////    DEBUT INSCRIPTION    /////////////////////////////////////////////

    miramapApp.controller('inscriptionCtrl', function($scope, $http) {

        $scope.regions = [{"region" : "Île-de-France"},
                          {"region" : "Berry"},
                          {"region" : "Orléanais"},
                          {"region" : "Normandie"},
                          {"region" : "Languedoc"},
                          {"region" : "Lyonnais"},
                          {"region" : "Dauphiné"},
                          {"region" : "Champagne"},
                          {"region" : "Aunis"},
                          {"region" : "Saintonge"},
                          {"region" : "Poitou"},
                          {"region" : "Guyenne et Gascogne"},
                          {"region" : "Bourgogne"},
                          {"region" : "Picardie"},
                          {"region" : "Anjou"},
                          {"region" : "Provence"},
                          {"region" : "Angoumois"},
                          {"region" : "Bourbonnais"},
                          {"region" : "Marche"},
                          {"region" : "Bretagne"},
                          {"region" : "Maine"},
                          {"region" : "Touraine"},
                          {"region" : "Limousin"},
                          {"region" : "Comté de Foix"},
                          {"region" : "Auvergne"},
                          {"region" : "Béarn"},
                          {"region" : "Alsace"},
                          {"region" : "Artois"},
                          {"region" : "Roussillon"},
                          {"region" : "Flandre française et Hainaut français"},
                          {"region" : "Franche-Comté"},
                          {"region" : "Lorraine"},
                          {"region" : "Corse"},
                          {"region" : "Nivernais"}];

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
                "nationalite" : $scope.nationaliteeInscription,
                "code_postal" : $scope.codePostalInscription,
                "region" : $scope.regionInscription,
                "date_naissance" : $scope.dateNaissanceInscription,
            };
            console.log(data);
            $http({
                method : 'post',
                url : "http://localhost:8888/CESI/miramap_php/bower_components/php/inscription.php",
                data : data,
                dataType : 'application/json',
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
            }).success(function (data) {

                window.location.href = '#/';
                alert('Bien inscrit ! Vous pouvez vous connecter.');
                console.log(data);
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

// Contrôleur de la page d'accueil
miramapApp.controller('homeCtrl', function($scope) {
    $scope.pageId = 'home';
});

// Contrôleur de la page de localisation des points de vente
miramapApp.controller('locationCtrl', function($scope) {
    $scope.pageId = 'localisation-amap';
});

// Contrôleur de la page de contact
miramapApp.controller('contactCtrl', function($scope) {
    $scope.pageId = 'contact';
});

////////////////////////////////    FIN ROUTING    /////////////////////////////////////////////
