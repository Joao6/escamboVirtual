(function () {
    angular.module('admApp')
            .factory('AdministradorService', function ($http, AdministradorValue) {

                var HEADERS = {headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                        "Accept": "application/json;charset=utf-8"
                    },
                    dataType: "json"};

                var _checkEmail = function (email) {
                    return $http.post(AdministradorValue.url_check_email, email, HEADERS);
                };

                var _createAdministrador = function (administrador) {
                    return $http.post(AdministradorValue.url_create_administrador, administrador, HEADERS);
                };

                return {
                    checkEmail: _checkEmail,
                    createAdministrador: _createAdministrador
                };

            });
})();

