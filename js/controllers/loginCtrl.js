'use strict';

app.controller('loginCtrl', function ($scope,$http,loginService,$localStorage) {

    $scope.pageId = 'connexion-page';
    if ($localStorage.session.logged) {
    	window.location.href = '#/profil';
    };
    // Perform the login action when the user submits the login form
        $scope.connexionAction = function(user) {

        	loginService.login(user);

        };

});
