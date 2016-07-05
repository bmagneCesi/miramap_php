'use strict';

app.controller('navCtrl', function($scope,$localStorage) {

	$scope.logout = function(){

		$localStorage.session = 
		{
			"logged": false
		}

		window.location.reload();
		window.location.href = "#/";

	};

	

});