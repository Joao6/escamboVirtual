<%-- 
    Document   : novo-anunciante
    Created on : 20/05/2016, 14:24:13
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="anuncianteApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Novo Cadastro de Anunciante</title>

        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/anunciante/cadastro-anunciante.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <!--ANGULAR-->
        <script src="<c:url value="/resources/js/angular.js"/>"></script>
        <!--APP-->
        <script src="<c:url value="/resources/js/anunciante/app/anunciante-app.js"/>"></script>
        <!--CONTROLLERS-->
        <script src="<c:url value="/resources/js/anunciante/controllers/anunciante-controller.js"/>"></script>
        <!--SERVICES-->
        <script src="<c:url value="/resources/js/anunciante/services/anunciante-service.js"/>"></script>
        <!--VALUES-->
        <script src="<c:url value="/resources/js/anunciante/values/anunciante-value.js"/>"></script>
        <!--MASCARA-->
        <script src="<c:url value="/resources/js/anunciante/mask-cadastro.js"/>"></script>
        
        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });
        </script>
    </head>

    <body ng-controller="AnuncianteController">
        <jsp:include page="../login.jsp"></jsp:include>
            <!-- NAVBAR -->
            <div class="navbar-fixed">
                <nav class="grey darken-3" id="navbarTop">
                    <div class="nav-wrapper container">
                        <a id="logo-container" href="<c:url value="/"/>" class="brand-logo white-text">Escambo Virtual</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons white-text">menu</i></a>
                    <ul class="right hide-on-med-and-down">                                                
                        <li><i class="material-icons">perm_identity</i></li>
                        <li><a class='modal-trigger btn blue white-text' href='#modalLogin' style="margin-right: 30px;">Entrar</a></li>                               
                    </ul>                                                
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="#modalLogin">Entrar</a></li>                        
                    </ul>
                </div>
            </nav>
        </div>
        <!-- FIM NAVBAR-->

        <!-- FORMULARIO -->           
        <div class="fundo-cadastro">
            <div class="container">
                <form id="anuncianteForm" name="anuncianteForm">
                    <div class="row">
                        <div class="card-panel col s12 m12" id="form1">
                            <div class="card-title">                        
                                <h5>INFORMAÇÕES PESSOAIS</h5>
                                <div class="form divider"></div>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="inputNome" name="nome" type="text" class="validate" ng-model="anunciante.nome" required=""/>
                                        <label for="inputNome">Nome</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="inputApelido" name="apelido" type="text" class="validate" ng-model="anunciante.apelido" required=""/>
                                        <label for="inputApelido">Apelido</label>
                                    </div>                                
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6 l6">
                                        <input id="email" name="email" type="email" class="" ng-blur="checkEmail(anunciante.email)"  ng-model="anunciante.email" required=""/>
                                        <label for="email">Email</label>
                                    </div>                                    
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="senha1" name="senha" type="password" class="validate"  ng-model="anunciante.senha" required=""/>
                                        <label for="senha1">Senha</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="senha2" name="conSenha" type="password" class="validate" ng-blur="checkSenha()" required=""/>
                                        <label for="conSenha">Confirmar Senha</label>                                        
                                    </div>
                                </div>                                
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="inputTelefone" name="telefone" type="text" ng-model="anunciante.telefone" class="validate"/>
                                        <label for="inputTelefone">Telefone</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="inputNascimento" name="nascimento" type="text" class="validate"  ng-model="anunciante.nascimento" required=""/>
                                        <label for="inputNascimento">Data de Nascimento</label>                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6">                                    
                                        <select id="inputSexo" name="sexo" required="" class="browser-default validate"  ng-model="anunciante.sexo" style="border-color: grey;">
                                            <option value="" disabled selected>Selecione o Sexo</option>
                                            <option ng-repeat="sexo in sexos" value="{{sexo.sexo}}">{{sexo.sexo}}</option>                                            
                                        </select>                                        
                                    </div>
                                    <div class="input-field col s12 m6" style="padding-top: 20px;">
                                        <span ng-show="anuncianteForm.$invalid" class="red-text"><strong>*Preencha corretamente todos os campos!</strong></span>
                                    </div>
                                </div>                                
                            </div>
                            <button type="button" id="btn-cadastrar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light blue" ng-click="create(anunciante)" ng-disabled="anuncianteForm.$invalid || !emailOk || !senhaOk" style="margin-bottom: 10px">Cadastrar</button>                            
                            <a href="<c:url value="/"/>" class="show-on-med-and-down"> <button type="button" class="btn btn-large btn-cancelar brown col s12 m3 push-m6">Cancelar</button></a>
                        </div> 
                    </div>            
                </form>
            </div>
        </div>        


        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>                
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </body>
</html>
