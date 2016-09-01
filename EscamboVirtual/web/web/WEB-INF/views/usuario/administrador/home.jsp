<%-- 
    Document   : menu
    Created on : 20/05/2016, 14:24:13
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Home</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>

    <body style="background-color: #b0bec5;">
        <header>
            
            <div class="container">
                <a href="#" data-activates="nav-mobile" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only">
                    <i class="material-icons grey-text">menu</i>
                </a>

                <!--
                <nav class="grey darken-3 card-panel col s8" style="padding:1%;" role="navigation">
                    <div class="brand-logo white-text">Escambo Virtual</div>
                </nav>
                -->
            </div>    
            <ul id="nav-mobile" class="side-nav fixed collapsible grey lighten-4" style="transform: translateX(0%);">
                <li class="logo">
                    <!--<a href="escambovirtual"><img src="resources/img/LogoDiferenciada.png" height="60" width="60"></a>-->
                    <h5>Escambo Virtual</h5>
                </li>
                <center>
                    <a href="<c:url value="/administrador/home"/>"><img class="img circle" src="<c:url value="/resources/img/background1.jpg"/>" height="80" width="80"></a>
                    <br/>
                    ${administrador.nome}
                </center>
                <br/>                
                <li class="no-padding">
                    <ul class="collapsible">                       
                        <li>
                            <a class="collapsible-header black-text waves-effect waves-teal" href="<c:url value="/administrador/alterar-senha" />"><i class="material-icons">vpn_key</i>Alterar Senha</a>
                        </li>
                        <li>
                            <a class="collapsible-header black-text waves-effect waves-teal" href="<c:url value="#"/>"><i class="material-icons">perm_identity</i>Perfil</a>
                        </li>
                        <li>
                            <a class="collapsible-header black-text waves-effect waves-teal" href="<c:url value="/administrador/new"/>"><i class="material-icons">note_add</i>Cadastrar Admin</a>
                        </li>
                        <li>
                            <a class="collapsible-header black-text waves-effect waves-teal" href="<c:url value="/administrador/list"/>"><i class="material-icons">assignment</i>Avaliar Itens</a>
                        </li>                        
                        <li>
                            <a class="collapsible-header black-text waves-effect waves-teal" href="<c:url value="/sair"/>"><i class="material-icons">settings_power</i>Sair</a>
                        </li>
                    </ul>
                </li>
            </ul>