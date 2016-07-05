'use strict';

app.controller('listeProducteursCtrl', function($scope, $http) {
    
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