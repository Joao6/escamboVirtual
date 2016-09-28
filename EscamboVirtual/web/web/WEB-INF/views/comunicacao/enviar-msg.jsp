    <%-- 
    Document   : enviar-msg
    Created on : 15/09/2016, 13:55:08
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Visualização de Item</title>
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

            <div class="row" style="padding-right: 15%; padding-left: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="<c:url value="/anunciante/home"/>" class="breadcrumb">Home</a>
                                <a href="<c:url value="/anunciante/pesquisar/item"/>" class="breadcrumb">Pesquisa</a>
                                <a href="<c:url value="/anunciante/pesquisar/item/${item.id}/view"/>" class="breadcrumb">Ver Item</a>
                                <a href="#!" class="breadcrumb">Enviar Mensagem</a>
                            </div>                        
                        </div>
                    </nav>
                </div>

                <div class="card-panel grey darken-3" style="margin-top: -20px;">
                    <div class="card-panel">
                        <div class="card-content">
                            <div class="card-content">
                                <div class="card-panel">
                                    <div class="card-content">
                                        <div class="card-title"><h6 class="center-align" style="text-transform: uppercase;"><strong>Enviar mensagem ao anunciante deste item</strong></h6></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <br/>
                                    <h6 class="left-align" style="text-transform: uppercase;"><strong>Item:</strong> ${item.nome}</h6>
                                    <h6 class="left-align" style="text-transform: uppercase;"><strong>Anunciante:</strong> ${item.anunciante.nome}</h6>
                                    <br/>                            
                                    <div class="row">
                                        <form class="col s12" method="post">
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <textarea id="mensagem" name="mensagem" class="materialize-textarea"></textarea>
                                                    <label for="mensagem">Mensagem</label>
                                                </div>
                                            </div>
                                            <!--<div class="row">-->
                                            <a class="waves-effect waves-light btn brown right" href="<c:url value="/anunciante/pesquisar/item/${item.id}/view"/>">Cancelar</a>
                                            <button class="waves-effect waves-light btn blue right" style="margin-right: 0.6rem;">Enviar</button>

                                            <!--</div>-->
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
