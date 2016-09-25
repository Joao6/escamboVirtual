<%-- 
    Document   : new
    Created on : 07/09/2016, 20:37:57
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="admApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Novo Administrador</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">    
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--SCRIPTS-->
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        
        <!--ANGULAR-->
        <script src="<c:url value="/resources/js/angular.js"/>"></script>
        <!--APP-->
        <script src="<c:url value="/resources/js/administrador/app/admApp.js"/>"></script>
        <!--CONTROLLERS-->
        <script src="<c:url value="/resources/js/administrador/controllers/adm-controller.js"/>"></script>
        <!--SERVICES-->
        <script src="<c:url value="/resources/js/administrador/services/adm-service.js"/>"></script>
        <!--VALUES-->
        <script src="<c:url value="/resources/js/administrador/values/adm-value.js"/>"></script>
        <!--MASCARA-->
        <script src="<c:url value="/resources/js/mask-cadastro.js"/>"></script>
    </head>
    <body style="background-color: #b0bec5;" ng-controller="AdministradorController">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col s12">
                            <a href="/web/administrador/home" class="breadcrumb">Home</a>
                            <a href="/web/administrador/list" class="breadcrumb">Administradores</a>
                            <a href="#!" class="breadcrumb">Novo Administrador</a>
                        </div>
                    </div>
                </nav>
                <form name="admForm" id="admForm">
                    <div class="row">
                        <div class="card-panel col s12 m12" id="form1">
                            <div class="card-title">                        
                                <h5>INFORMAÇÕES PESSOAIS</h5>
                                <div class="form divider"></div>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="inputNome" name="nome" type="text" class="validate" required="" ng-model="administrador.nome"/>
                                        <label for="inputNome">Nome</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="inputCpf" name="cpf" type="text" class="validate" required="" ng-model="administrador.cpf"/>
                                        <label for="inputCpf">CPF</label>
                                    </div>                                
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6 l6">
                                        <input id="email" name="email" type="email" class="validate" required="" ng-model="administrador.email" ng-blur="checkEmail(administrador.email)"/>
                                        <label for="email">Email</label>
                                    </div>                                
                                    <div class="input-field col s12 m6 l6">
                                        <input id="inputApelido" name="apelido" type="text" class="validate" required="" ng-model="administrador.apelido"/>
                                        <label for="inputApelido">Apelido</label>
                                    </div>                                
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="senha" name="senha" type="password" class="validate" required="" ng-model="administrador.senha"/>
                                        <label for="senha">Senha</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="senha2" name="confirmaSenha" type="password" class="validate" required="" ng-blur="checkSenha()"/>
                                        <label for="senha2">Confirmar Senha</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6">
                                        <input id="inputTelefone" name="telefone" type="text" class="validate" ng-model="administrador.telefone" required=""/>
                                        <label for="inputTelefone">Telefone</label>
                                    </div>
                                    <div class="input-field col s12 m6">
                                        <input id="inputNascimento" name="nascimento" type="text" class="validate" ng-model="administrador.nascimento" required=""/>
                                        <label for="inputNascimento">Data de Nascimento</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12 m6">                                    
                                        <select id="inputSexo" name="sexo" class="browser-default" style="border-color: grey;" ng-model="administrador.sexo" required="">
                                            <option value="" disabled selected>Sexo</option>
                                            <option ng-repeat="sexo in sexos" value="{{sexo.sexo}}">{{sexo.sexo}}</option>                                            
                                        </select>                                        
                                    </div>
                                    <div class="input-field col s12 m6" style="padding-top: 20px;">
                                        <span ng-show="admForm.$invalid" class="red-text"><strong>*Preencha corretamente todos os campos!</strong></span>
                                    </div>
                                </div>                        
                                <button id="btn-cadastrar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light blue" ng-click="create(administrador)" ng-disabled="admForm.$invalid || !emailOk || !senhaOk" style="margin-bottom: 10px; margin-right: 0.4rem;">Cadastrar</button>
                                <a href="<c:url value="/administrador/home"/>"><button type="button" id="btn-cancelar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light brown">Cancelar</button></a>                                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </header>

    </body>
</html>
