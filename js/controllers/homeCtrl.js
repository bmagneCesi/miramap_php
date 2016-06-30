'use strict';

app.controller('homeCtrl', function($scope,$localStorage) {

    $scope.pageId = 'home';
    console.log($localStorage.session);
});