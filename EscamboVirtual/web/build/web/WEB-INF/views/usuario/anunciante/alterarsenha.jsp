<%-- 
    Document   : alterarsenha1
    Created on : 07/09/2016, 13:46:47
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Alterar Senha</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">    
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--SCRIPTS-->
        <script>
            var senhaatual = document.getElementById("senhaatual");
            var novasenha = document.getElementById("novasenha");
            var confirmarSenha = document.getElementById("confirmarSenha");

            function validatePassword() {
                if (novasenha.value != confirmarSenha.value) {
                    confirmarSenha.setCustomValidity("Repita a senha corretamente");
                } else {
                    confirmarSenha.setCustomValidity("");
                }

                if (senha != senhaatual.value) {
                    senhaatual.setCustomValidity("Senha atual incorreta");
                } else {
                    senhaatual.setCustomValidity("");
                }
            }
            novasenha.onchange = validatePassword;
            confirmarSenha.onkeyup = validatePassword;
            senhaatual.onkeyup = validatePassword;
        </script>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left:15%;padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col col s12 m6 l6">
                            <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                            <a href="#!" class="breadcrumb">Alterar Senha</a>
                        </div>
                    </div>
                </nav>
                <form class="card-panel z-depth-2 col s12" method="post">
                    <div class="card-title">                        
                        <h5>Alterar Senha</h5>
                        <div class="form divider"></div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6 l6">
                            <input id="senhaatual" name="senhaatual" type="password" class="validate" required/>
                            <label for="senhaatual">Senha Atual</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6 l6">
                            <input id="novasenha" name="novasenha" type="password" class="validate" required/>
                            <label for="novasenha">Nova Senha</label>
                        </div>
                        <div class="input-field col s12 m6 l6">
                            <input id="confirmarSenha" name="confirmarSenha" type="password" class="validate" required/>
                            <label for="confirmarSenha">Confirmar Nova Senha</label>
                        </div>
                    </div>
                    <div class="row">
                        <!--<input type="submit" class="waves-effect waves-light btn right col s12 m4 l2" value="Salvar" />&nbsp;-->
                        <button class="waves-effect waves-light btn blue right col s12 m4 l2" style="margin-left: 0.6rem;">Salvar</button>
                        <a class="waves-effect waves-light btn brown right col s12 m4 l2" href="<c:url value="/anunciante/home"/>">Cancelar</a>
                    </div>
                </form>
            </div>
        </header>
    </body>
</html>
