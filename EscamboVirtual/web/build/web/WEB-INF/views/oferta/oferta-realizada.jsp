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
        <title>Ver Oferta Realizada</title>
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
                                <a href="<c:url value="/anunciante/pesquisar/item"/>" class="breadcrumb">Pesquisa</a>
                                <a href="<c:url value="#"/>" class="breadcrumb">Ver Item</a>
                                <a href="#!" class="breadcrumb">Ver Oferta Sobre Item</a>
                            </div>                        
                        </div>
                    </nav>
                </div>

                <div class="card-panel grey darken-3" style="margin-top: -2%;">
                    <div class="card-content">
                        <div class="card-title white-text"><strong style="text-transform: uppercase;">Número de ofertas realizadas sobre este item: ${count}</strong></div>                        
                        <c:forEach items="${ofertaList}" var="oferta">
                            <div class="card-panel">
                                <div class="card-panel">
                                    <div class="card-title center"><strong style="text-transform: uppercase;">Oferta realizada sobre o item "${oferta.item.nome}", do anunciante "${oferta.item.anunciante.nome}"</strong></div>
                                </div>
                                <!--<div class="card-panel">-->
                                <!--<div class="card-content">-->
                                <div class="row">
                                    <br/>
                                    <div class="card-title center"><strong style="text-transform: uppercase; text-decoration: underline;">Os itens que você incluiu nesta oferta foram:</strong></div>   
                                    <br/>
                                    <c:forEach items="${oferta.ofertaItem.itemList}" var="item">
                                        <div class="card small col s12 m6 l6">
                                            <div class="card-image waves-effect waves-block waves-light">
                                                <img class="activator" src="<c:url value="/resources/img/background3.jpg"/>">
                                            </div>
                                            <div class="card-content">
                                                <span class="card-title activator grey-text text-darken-4">${item.nome}</span>
                                                <br/>
                                                <span class="center-align">Clique sobre a imagem para ver informações</span>
                                            </div>
                                            <div class="card-reveal">
                                                <span class="card-title grey-text text-darken-4">Informações<i class="material-icons right">close</i></span>
                                                <p>${item.descricao}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!--</div>-->
                                <!--</div>-->
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>                                   
        </header>
    </body>
</html>
