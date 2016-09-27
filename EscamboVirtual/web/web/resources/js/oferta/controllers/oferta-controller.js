/*
 * global angular */
/* global Materialize*/
/* global $ */

angular.module('ofertaApp').controller('OfertaController', function ($scope, OfertaService) {

    this.MESSAGE_ERROR_BUSCAR_ITENS = 'Erro ao buscar itens do anunciante.';
    this.MESSAGE_SUCCESS_CREATE_OFERTA = 'Oferta enviada com sucesso.';
    this.MESSAGE_ERROR_CREATE_OFERTA = 'Erro enviar oferta.';

    var app = this;

    $scope.oferta = {};
    $scope.ofertaItem = {};
    $scope.itemList = [];
    $scope.item = {};
    $scope.itensOferta = [];
    $scope.itensID = [];


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
    
//    _getItensAnunciante();

    $scope.addItem = function (item) {
        if (item.id !== "" && item.id !== undefined) {
            $scope.itens = $scope.itens.filter(function (a) {
                if (a.id != item.id) {
                    return a;
                } else {
                    $scope.itensOferta.push(a);
                    $scope.itensID.push(a.id);
                }
            });
        }
    };

    $scope.removeItemOferta = function (id) {
        if (id !== "" && id !== undefined) {
            $scope.itensOferta = $scope.itensOferta.filter(function (a) {
                if (a.id !== id) {
                    return a;
                } else {
                    $scope.itensOferta.push(angular.copy(a));
                    $scope.itensID.push(a.id);
                }
            });            
        }
    };

    $scope.createOferta = function (id) {
        try {
            OfertaService.createOferta($scope.itensID, id)
                    .success(function () {
                        delete $scope.itensOferta;
                        delete $scope.itensID;
                        Materialize.toast(app.MESSAGE_SUCCESS_CREATE_OFERTA, 2000, 'green rounded toast', function () {
                            window.location.href = window.location.protocol + "//" + window.location.host + "/web/anunciante/pesquisar/item/" + id + "/view";
                        });
                        //redirecionar para lista de ofertas enviadas.
                    })
                    .error(function (data) {
                        console.log(data);
                        Materialize.toast(app.MESSAGE_ERROR_CREATE_OFERTA, 4000, 'red rounded toast');
                    });
        } catch (e) {
            console.log(e);
            Materialize.toast("Algo estranho aconteceu! =(", 4000, 'red rounded toast');
        }
    };

    $scope.isItemListEmpty = function () {
        return $scope.itemList.length < 1;
    };

});