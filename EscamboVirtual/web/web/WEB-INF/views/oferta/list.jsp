<%-- 
    Document   : list
    Created on : 21/09/2016, 14:47:17
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Ofertas Recebidas</title>
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
                                <a href="#!" class="breadcrumb">Ofertas Recebidas</a>
                            </div>                        
                        </div>
                    </nav>
                </div>                

                <div class="card-panel" style="margin-top: -2%;">
                    <div class="card-content">
                        <c:if test="${empty ofertaList}">
                            <div class="card-title center"><strong style="text-transform: uppercase;">Não existem ofertas encaminhadas para seus itens! =(</strong></div>                        
                        </c:if>
                        <c:if test="${not empty ofertaList}">                        
                            <div class="card-title"><strong style="text-transform: uppercase;">Você recebeu as seguintes ofertas:</strong></div>                        
                            <br/>
                            <c:forEach items="${ofertaList}" var="oferta"> 
                                <a href="<c:url value="/anunciante/oferta/${oferta.id}/view"></c:url>" class="black-text hoverable">
                                        <div class="row">                                               
                                            <div class="col s12 m12 z-depth-1 hoverable">                                                                   
                                                <div class="card-image col s12 m4 l4">
                                                    <img src="<c:url value="/resources/img/background2.jpg"></c:url>" class="responsive-img" style="padding-top: 4%;">
                                                </div>
                                                <div class="card-content">
                                                    <span><strong>Para o item: ${oferta.item.nome}</strong></span>                                                    
                                                <br/>
                                                <div class="divider"></div>
                                                <br/>
                                                <span class=""><strong>Clique para ver mais detalhes:</strong></span>                                            
                                            </div> 
                                        </div>                                
                                    </div>
                                </a>
                            </c:forEach>
                        </c:if>
                    </div>                        
                </div>
            </div>               
        </header>        
    </body>
</html>
