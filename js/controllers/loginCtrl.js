'use strict';

app.controller('loginCtrl', function ($scope,$http, loginService) {

    $scope.pageId = 'connexion-page';
    
    // Perform the login action when the user submits the login form
        $scope.connexionAction = function(user) {

        	loginService.login(user);

        };

});
