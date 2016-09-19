/*
 * global angular */
/* global Materialize*/
/* global $ */

(function () {
    angular.module('anuncianteApp')
            .controller('AnuncianteController', function ($scope, AnuncianteService) {

                //MENSAGENS//
                this.MESSAGE_EMAIL_CADASTRADO = "Este e-mail já está cadastrado no sistema!";
                this.MESSAGE_EMAIL_DISPONIVEL = "Este e-mail está disponível para cadastro!";
                this.MESSAGE_ERRO_PROCESSAR_EMAIL = "Erro ao tentar processar e-mail!";
                this.MESSAGE_CONNECTION_ERROR = "Erro ao comunicar com o servidor!";
                this.MESSAGE_ANUNCIANTE_CADASTRO_SUCCESS = "Cadastro realizado com sucesso!";
                this.MESSAGE_ANUNCIANTE_CADASTRO_ERROR = "Erro ao cadastrar anunciante!";
                this.MESSAGE_SENHAS_OK = "As senhas coincidem!!";
                this.MESSAGE_SENHAS_ERROR = "As senhas não coincidem!!";

                var app = this;

                //$scope//
                $scope.emailOk = false;
                $scope.senhaOk = false;
                $scope.anunciante = {};                                
                
                //lista de sexo do select
                $scope.sexos = [
                    {'id': 1, 'sexo': 'Masculino'}, {'id': 2, 'sexo': 'Feminino'}
                ];

                /*Método para checar se o email está disponível ou não
                 * 
                 * @param {type} email
                 * @returns {undefined}
                 */

                var _checkEmailAnunciante = function (email) {
                    try {
                        if (email !== "" && email !== undefined) {
                            AnuncianteService.checkEmail(email)
                                    .success(function (data) {
                                        if (data.result === 'exist') {
                                            Materialize.toast(app.MESSAGE_EMAIL_CADASTRADO, 4000, 'orange rounded toast');
                                            $("form #email").css({"background-color": "rgba(255, 192, 206, 0.4)"});
                                            $scope.emailOk = false;
                                        } else if (data.result === 'not') {
                                            Materialize.toast(app.MESSAGE_EMAIL_DISPONIVEL, 4000, 'green rounded toast');
                                            $("form #email").css({"background-color": "#FFF"});
                                            $scope.emailOk = true;
                                        }
                                        console.log(data.result);                                        
                                    })
                                    .error(function (data) {
                                        Materialize.toast(app.MESSAGE_ERRO_PROCESSAR_EMAIL, 4000, 'red rounded toast');
                                        $scope.emailOk = false;
                                        console.log(data);
                                    });
                        } else {
                            $("form #email").css({"background-color": "rgba(255, 192, 206, 0.4)"});
                            $scope.emailOk = false;
                        }
                    } catch (e) {
                        Materialize.toast(app.MESSAGE_CONNECTION_ERROR, 4000, 'red rounded toast');
                        $scope.emailOk = false;
                    }
                    return $scope.emailOk;
                };

                var _checkSenha = function () {
                    try {
                        var senha = document.getElementById('senha').value;
                        var senha2 = document.getElementById('senha2').value;
                        if (senha === senha2) {
                            $("form #senha").css({"background-color": "rgba(0, 255, 0, 0.1)"});
                            $("form #senha2").css({"background-color": "rgba(0, 255, 0, 0.1)"});
                            Materialize.toast(app.MESSAGE_SENHAS_OK, 4000, 'green rounded toast');
                            $scope.senhaOk = true;
                        } else {
                            $("form #senha").css({"background-color": "rgba(255, 192, 206, 0.5)"});
                            $("form #senha2").css({"background-color": "rgba(255, 192, 206, 0.5)"});
                            Materialize.toast(app.MESSAGE_SENHAS_ERROR, 4000, 'red rounded toast');
                            $scope.senhaOk = false;
                        }
                    } catch (e) {
                        Materialize.toast(app.MESSAGE_CONNECTION_ERROR, 4000, 'red rounded toast');
                        $scope.senhaOk = false;
                    }
                    return $scope.senhaOk;
                };

                $scope.create = function (anunciante) {
                    try {
                        AnuncianteService.createAnunciante(anunciante)
                                .success(function () {
                                    Materialize.toast(app.MESSAGE_ANUNCIANTE_CADASTRO_SUCCESS, 3000, 'green rounded toast', function (){
                                        window.location.href = window.location.protocol + "//" + window.location.host + "/web";
                                    });                                    
                                    delete $scope.anunciante;
                                })
                                .error(function (data) {
                                    console.log(data);
                                    Materialize.toast(app.MESSAGE_ANUNCIANTE_CADASTRO_ERROR, 5000, 'red rounded toast');
                                });
                    } catch (e) {
                        console.log(e);
                    }
                };


                /*
                 * 
                 * @param {type} email
                 * @returns {undefined|Boolean}
                 */
                $scope.checkEmail = function (email) {
                    return _checkEmailAnunciante(email);
                };

                $scope.checkSenha = function (senha, ConSenha) {
                    return _checkSenha(senha, ConSenha);
                };


            });
})();

