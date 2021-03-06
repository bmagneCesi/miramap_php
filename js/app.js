'use strict';

var app = angular.module('app', [
'ngRoute',
'ngStorage'
]); 


app.run(function($rootScope,$localStorage) {
    $rootScope.baseUrl = 'http://localhost:8888/CESI/miramap_php/#'
    $rootScope.session = $localStorage.session;
});

app.filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});

////////////////////////////////    DEBUT ROUTING    /////////////////////////////////////////////

app.config(['$routeProvider',
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
        .when('/connexion', {
            templateUrl: 'partials/connexion.html',
            controller: 'loginCtrl'
        })
        .when('/inscription', {
            templateUrl: 'partials/inscription.html',
            controller: 'inscriptionCtrl'
        })
        .when('/profil', {
            templateUrl: 'partials/profil.html',
            controller: 'profilCtrl'
        })
        .when('/liste-paniers/achat/:idPanier', {
            templateUrl: 'partials/achat.html',
            controller: 'achatPanierCtrl'
        })
        .otherwise({
            redirectTo: '/'
        });
    }
]);