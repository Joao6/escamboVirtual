<%-- 
    Document   : form-oferta
    Created on : 16/09/2016, 09:44:43
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="ofertaApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Realizar Oferta</title>
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

        <script src="<c:url value="/resources/js/angular.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/oferta/app/oferta-app.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/oferta/controllers/oferta-controller.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/oferta/services/oferta-service.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/oferta/values/oferta-value.js"/>"></script>

        <script>
            $(document).ready(function () {
                $('.carousel').carousel();
            });
        </script>        
    </head>
    <body  style="background-color: #b0bec5;" ng-controller="OfertaController" ng-init="itens(${anunciante.id})">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="<c:url value="/anunciante/home"/>" class="breadcrumb">Home</a>
                                <a href="<c:url value="/anunciante/pesquisar/item"/>" class="breadcrumb">Pesquisa</a>
                                <a href="<c:url value="/anunciante/pesquisar/item/${itemReceptor.id}/view"/>" class="breadcrumb">Ver Item</a>
                                <a href="#!" class="breadcrumb">Fazer Oferta</a>
                            </div>                        
                        </div>
                    </nav>
                </div>                

                <div class="card-panel grey darken-3" style="margin-top: -2%;">
                    <div class="card-content">
                        <div class="card-panel">
                            <div class="card-content">
                                <div class="card-title"><h6 class="center-align" style="text-transform: uppercase;"><strong>Realizar Oferta ao Item:</strong> ${itemReceptor.nome}</h6></div>
                                <h6 class="center-align" style="text-transform: uppercase;"><strong>Pertencente ao anunciante: </strong>${itemReceptor.anunciante.nome}</h6>
                            </div>
                        </div> 
                        <div class="card-panel">
                            <div class="card-content">
                                <h6 class="center-align" style="text-transform: uppercase;"><strong>Imagens do item:</strong></h6>
                                <div class="carousel" style="margin-top: -70px;">
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background1.jpg"/>"></a>                                        
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background2.jpg"/>"></a>                                        
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background3.jpg"/>"></a>                                        
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background1.jpg"/>"></a>                                        
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background2.jpg"/>"></a>                                        
                                    <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background3.jpg"/>"></a>                                        
                                </div>
                                <p style="margin-top: -130px;"></p>
                            </div>
                        </div>
                        <div class="card-panel">
                            <div class="card-content">
                                <form name="formOferta">
                                    <div class="card-title"><h6 class="center-align" style="text-transform: uppercase;"><strong>Selecione os itens que você deseja ofertar</strong></h6></div>
                                    <br/>
                                    <select class="browser-default" style="border-color: grey;" ng-model="item.id" ng-change="addItem(item)">
                                        <option value="">Selecione</option>
                                        <option ng-repeat="item in itens" value="{{item.id}}">{{item.nome}}</option>
                                    </select>

                                    <div class="row">
                                        <div ng-repeat="item in itensOferta" ng-model="ofertaItem.itemList">                                                
                                            <!--aqui vai aparecer os itens selecionados-->
                                            <div class="card small col s12 m6 l6">
                                                <div class="card-image waves-effect waves-block waves-light">
                                                    <img class="activator" src="<c:url value="/resources/img/background3.jpg"/>">
                                                </div>
                                                <div class="card-content">
                                                    <span class="card-title activator grey-text text-darken-4">{{item.nome}}</span>
                                                    <br/>
                                                    <span class="center-align">Clique sobre a imagem para ver informações</span>
                                                </div>
                                                <div class="card-reveal">
                                                    <span class="card-title grey-text text-darken-4">Informações<i class="material-icons right">close</i></span>
                                                    <p>{{item.descricao}}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn blue large" ng-click="createOferta(${itemReceptor.id})" title="Após preencher os dados você poderá enviar uma proposta de troca ao anunciante.">Enviar Oferta</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
</body>
</html>
