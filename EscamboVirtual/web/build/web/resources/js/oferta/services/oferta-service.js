/*
 * global angular
 */
(function () {
    angular.module('ofertaApp')
            .factory('OfertaService', function ($http, OfertaValue) {

                var HEADERS = {headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                        "Accept": "application/json;charset=utf-8"
                    },
                    dataType: "json"};
                
                
                var _getItensAnunciante = function(id){
                    return $http.get(OfertaValue.url_get_itens_anunciante + id, HEADERS);
                };
                
                var _createOferta = function(itemList, id){
                    return $http.post('/web/oferta/create/'+id, itemList, HEADERS);
                };
                
                return{
                  getItensAnunciante: _getItensAnunciante,
                  createOferta: _createOferta
                };
                
                
            });
})();