<%-- 
    Document   : list
    Created on : 07/09/2016, 20:42:50
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Avaliar Itens</title>
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
        <script>
            $(document).ready(function () {
                $('.carousel').carousel();
            });

            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });

            function setId(id) {
                document.getElementById('item-id').value = id;
            }
            ;
        </script>
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <!--MODAL NÂO PUBLICAR ITEM-->
            <div id="modalNaoPublicar" class="modal">
                <div class="modal-content">
                    <h4>Não publicar Item</h4>
                    <p><strong>Descreva abaixo o motivo da não aprovação da publicação deste item</strong></p>
                    <form action="/web/administrador/item/nao-publicar" method="post">
                        <input type="hidden" name="idItem" value="" id="item-id">
                        <div class="row">                            
                            <div class="row">
                                <div class="input-field col s12">
                                    <textarea name="motivo" id="motivo" class="materialize-textarea" placeholder="Esta descrição será enviada ao anunciante responsável pelo item"></textarea>
                                    <label for="motivo">Descrição</label>
                                </div>
                            </div>                            
                        </div>
                        <button type="submit" class="btn red modal-close" style="margin-right: 0.6rem;">Confirmar</button>
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn brown">Cancelar</a>                            
                    </form>
                </div>
            </div>
            <!--FIM MODAL-->

            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/administrador/home" class="breadcrumb">Home</a>
                                <a href="#!" class="breadcrumb">Avaliar Itens </a>
                            </div>
                        </div>
                    </nav>
                </div>

                <c:if test="${empty itemList}">
                    <div class="card-panel col s12 z-depth-2 grey darken-3" style="margin-top: -2%;">
                        <div class="card-content">
                            <div class="card-panel">
                                <div class="card-content">
                                    <div class="card-title">
                                        <span style="font-size: 16pt;"><i class="material-icons small">thumb_up</i>
                                            <strong>Não existem itens em status de avaliação no momento!</strong></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty itemList}">
                    <div class="card-panel grey darken-3" style="margin-top: -2%;">
                        <div class="card-content">
                            <span class="white-text"><strong>Total de itens para avaliação: ${count}</strong></span>
                            <table>
                                <tbody>
                                    <c:forEach items="${itemList}" var="item">
                                        <tr>
                                            <td>
                                                <c:if test="${item.status == 'Em Avaliação'}">
                                                    <div class="card-panel col s12 z-depth-2">                                                        
                                                        <table class="bordered">
                                                            <tr>                                               
                                                                <td  colspan="4">
                                                                    <div class="card-title">                        
                                                                        <h5>${item.nome}</h5>
                                                                        <!--<div class="form divider"></div>-->
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="5">
                                                                    <c:if test="${empty item.itemImagemList}">
                                                                        <img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">
                                                                    </c:if>
                                                                    <c:if test="${not empty item.itemImagemList}">
                                                                        <div class="carousel" style="margin-top: -10%; margin-bottom: -15%;">
                                                                            <c:forEach items="${item.itemImagemList}" var="itemImagem">
                                                                                <a class="carousel-item" href="#one!">
                                                                                    <img src="<c:url value="/anunciante/item/img/${itemImagem.hash}"/>" height="200" width="200">
                                                                                </a>                                        
                                                                            </c:forEach>
                                                                        </div>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Anunciante: &nbsp;</b>${item.anunciante.nome}</td>
                                                                <td><b>Interesse 1: &nbsp;</b>${item.interesse1}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Data de Aquisição: &nbsp;</b>${item.dataAquisicao}</td>
                                                                <td><b>Interesse 2: &nbsp;</b>${item.interesse2}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Status: &nbsp;</b>${item.status}</td>                                                        
                                                                <td><b>Interesse 3: &nbsp;</b>${item.interesse3}</td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Descrição: </b></td>
                                                                <td colspan="3">${item.descricao}</td> 
                                                            </tr>                                                    
                                                            <tr>                                                                    
                                                                <td class="center-align">
                                                                    <a class="btn waves-effect blue" href="<c:url value="/administrador/item/${item.id}/publicar"/>">Publicar</a>                                                                        
                                                                </td>
                                                                <td class="centr-align">
                                                                    <a class="btn waves-effect red modal-trigger" href="<c:url value="#modalNaoPublicar"/>" onclick="setId(${item.id})">Não Publicar</a>
                                                                </td>
                                                            </tr>                                                                
                                                        </table>                                                        
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>                    
                                </tbody>
                            </table>

                            <ul class="pagination center">
                                <c:if test="${offset > 0}">
                                    <li><a class="white-text" href="<c:url value="/administrador/list/itens?limit=${limit}&offset=${offset - limit}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                    </c:if>

                                <c:if test="${offset <= 0}">
                                    <li><a class="white-text" href="<c:url value="/administrador/list/itens?limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                    </c:if>


                                <c:if test="${(offset + limit) < count}">
                                    <li><a class="white-text" href="<c:url value="/administrador/list/itens?limit=${limit}&offset=${offset + limit}"/>"><i class="material-icons">chevron_right</i></a></li>
                                    </c:if>

                                <c:if test="${(offset + limit) >= count}">
                                    <li><a class="white-text" href="<c:url value="/administrador/list/itens?limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_right</i></a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>
        </header>
    </body>
</html>
