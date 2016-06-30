app.controller('creationPanierCtrl', function($scope, $http, $filter) {

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