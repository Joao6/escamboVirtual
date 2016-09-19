/*
 * global angular */
/* global Materialize*/
/* global $ */

angular.module('ofertaApp').controller('OfertaController', function ($scope, OfertaService) {

    this.MESSAGE_ERROR_BUSCAR_ITENS = 'Erro ao buscar itens do anunciante.';

    var app = this;

    $scope.oferta = {};
    $scope.ofertaItem = {};
    $scope.itemList = [];
    $scope.item = {};
    $scope.itensOferta = [];


//    $scope.itens = [];


    $scope.itens = function _getItensAnunciante(id) {
        try {
            OfertaService.getItensAnunciante(id).success(function (data) {
                $scope.itens = data;
                console.log($scope.itens);
            }).error(function () {
                //mensagem de erro
                Materialize.toast(app.MESSAGE_ERROR_BUSCAR_ITENS, 3000, 'orange rounded toast');
            });
        } catch (e) {
            console.log(e);
        }
    };

    $scope.addItem = function (item) {
        if (item.id !== "" && item.id !== undefined) {
            $scope.itens = $scope.itens.filter(function (a) {
                if (a.id != item.id) {
                    return a;
                } else {
                    $scope.itensOferta.push(a);
                }
            });
        }
    };

    $scope.createOferta = function (id) {
        try {
            OfertaService.createOferta($scope.itensOferta, id)
                    .success(function () {
                        Materialize.toast("Oferta cadastrada com sucesso", 4000, 'red rounded toast');
                    })
                    .error(function (data) {
                        console.log(data);
                        Materialize.toast("Deu erro de função", 4000, 'red rounded toast');
                    });
        } catch (e) {
            console.log(e);
            Materialize.toast("Deu exception", 4000, 'red rounded toast');
        }
    };

    $scope.isItemListEmpty = function () {
        return $scope.itemList.length < 1;
    };

});