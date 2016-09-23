<%-- 
    Document   : item-not-found
    Created on : 23/09/2016, 10:33:23
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Ops!</title>
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
    </head>
    <body style="background-color: #b0bec5;">        
        <header>            
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="<c:url value="/anunciante/home"/>" class="breadcrumb">Home</a>                                
                                <a href="<c:url value="/anunciante/oferta/list"/>" class="breadcrumb">Ofertas Recebidas</a>                                
                                <a href="#!" class="breadcrumb">Erro!</a>
                            </div>                        
                        </div>
                    </nav>
                </div>

                <div class="card-panel" style="margin-top: -2%;">
                    <div class="card-content">
                        <div class="card-panel">
                            <div class="card-title center"><strong style="text-transform: uppercase;">Desculpe, mas a oferta que você está tentando acessar não pertence a um item seu...</strong></div>
                        </div>
                        <img class="responsive-img" src="<c:url value="/resources/img/background1.jpg"/>">
                    </div>
                </div>
            </div>                                   
        </header>
    </body>
</html>
