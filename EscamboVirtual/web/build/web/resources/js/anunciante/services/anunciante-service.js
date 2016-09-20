/*
 * global angular
 */
(function (){
   angular.module('anuncianteApp') 
           .factory('AnuncianteService', function ($http, AnuncianteValue){
           
           var HEADERS = {headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                    "Accept": "application/json;charset=utf-8"
                 },
                 dataType: "json"};
           
           var _checkEmail = function(email){
             return $http.post(AnuncianteValue.url_check_email, email, HEADERS);
           };
           
           var _createAnunciante = function(anunciante){
             return $http.post(AnuncianteValue.url_create_anunciante, anunciante, HEADERS)  ;
           };
           
           var _getEstados = function(){
             return $http.get('/web/anunciante/estados/api', HEADERS);  
           };
           
           return {
             checkEmail: _checkEmail,
             createAnunciante: _createAnunciante,
             getEstados: _getEstados
           };
   });
})();

