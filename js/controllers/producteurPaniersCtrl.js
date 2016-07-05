app.controller('producteurPaniersCtrl', function($scope, $http, $routeParams) {

    $scope.pageId = 'producteur-paniers';
    var data = {
        "id_producteur": $routeParams.userId
    }

    $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/producteur-paniers.php",
        data : data,
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {

        $scope.paniers = data;

    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });

    $scope.achatPanierAction = function(panier){
        
    var data = {
        "id_producteur": $routeParams.userId
    }

    $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/producteur-paniers.php",
        data : data,
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {

        $scope.paniers = data;

    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });

    }

});