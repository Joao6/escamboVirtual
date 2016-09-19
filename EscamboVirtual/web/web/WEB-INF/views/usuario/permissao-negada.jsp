<%-- 
    Document   : permissao-negada
    Created on : 11/09/2016, 11:08:23
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Novo Cadastro de Anunciante</title>

        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/anunciante/cadastro-anunciante.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
                
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <!--Angular-->
        <script src="<c:url value="/resources/js/angular.js"/>"></script>
        <script src="<c:url value="/resources/js/angular-route.js"/>"></script>
    </head>
    <body>
        <!-- TOP BAR -->
        <nav class="grey darken-3" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="<c:url value="/"/>" class="brand-logo white-text">Escambo Virtual</a>
                <ul class="right hide-on-med-and-down">
                    <li><a class="white-text" href="<c:url value="#"/>">Entrar</a></li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#">Entrar</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <!-- FIM TOP BAR -->
            
        <div class="container">
            <div class="card-panel">
                <div class="card-content">
                    <div class="card-image center"><img class="responsive-img" src="<c:url value="/resources/img/erros-e-descricoes1.png"/>"/></div>                
                </div>
            </div>
        </div>


            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </body>
</html>
