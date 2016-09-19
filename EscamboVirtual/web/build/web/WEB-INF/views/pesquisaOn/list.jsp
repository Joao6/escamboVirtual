<%-- 
    Document   : list
    Created on : 07/09/2016, 13:28:02
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Pesquisar</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">    
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--SCRIPTS-->
        <script>
            $(document).ready(function () {
                $('.modal-trigger').leanModal();
            });
        </script>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"></jsp:include>

                <div class="row" style="padding-left: 15%; padding-right: 15%; ">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                                <a href="#!" class="breadcrumb">Pesquisa</a>
                            </div>                        
                        </div>
                    </nav>
                    <div class="card-panel col s12 m12 l12" style="padding-bottom: 20px; padding-top: 5px;">
                        <div class="card-content">
                            <div class="row">
                                <form>                            
                                    <div class="row">
                                        <div class="input-field col s12 m6">
                                            <input id="pesquisar" name="nomeCriterium" type="text" value="${nomeCriterium}"/>
                                        <label for="pesquisar">Pesquise por nome de itens</label>
                                    </div>   
                                    <button type="submit" class="btn blue" style="margin-top: 25px;">Search</button>
                                </div>
                            </form>
                        </div>
                        <c:if test="${empty itemList}">
                            <div class="row">
                                <div class="card-panel">
                                    <div class="card-content">
                                        <i class="material-icons">thumb_down</i>
                                        <span class="card-title">Não foram encontrados resultados para esta busca.</span>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <ul>
                            <c:forEach var="item" items="${itemList}">
                                <a href="<c:url value="/anunciante/pesquisar/item/${item.id}/view"></c:url>" class="black-text painelAnuncios hoverable">
                                        <li>
                                            <div class="col s12 m12 z-depth-1 painelAnuncios hoverable">
                                                <div class="card medium" style="height: 160px;">                                       
                                                    <div class="row">                                               
                                                        <div class="card-image col s12 m4 l4">
                                                            <img src="<c:url value="/resources/img/background2.jpg"></c:url>" class="responsive-img" style="padding-top: 3px;">
                                                        </div>
                                                        <div class="card-content">
                                                            <span><strong>${item.nome}</strong></span>                                                    
                                                        <br/>
                                                        <div class="divider"></div>
                                                        <br/>
                                                        <span class=""><strong>Descrição:</strong></span>
                                                        <p>${item.descricao}</p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
