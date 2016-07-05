app.controller('listePaniersCtrl', function($scope, $http) {

    $scope.pageId = 'liste-paniers';


    $http({
        method : 'post',
        url : "http://localhost:8888/CESI/miramap_php/bower_components/php/paniers.php",
        dataType : 'application/json',
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},

    }).success(function (data) {

        $scope.paniers = data;
        console.log(data);
        
    }).error(function (data) {
    
        console.log(data);
        alert('L\'application n\'a pas pu mettre à jour le contenu : ' + data);

    });

});