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

        <!--SCRIPTS-->
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </head>

    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">    
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/administrador/home" class="breadcrumb">Home</a>                                
                                <a href="#" class="breadcrumb"></a>                                
                            </div>
                        </div>
                    </nav>
                </div>
                
                    <div class="row" style="margin-top: -2%;">
                        <div class="card-panel">
                            <div class="card-content">
                                <table class="bordered">
                                    <tr>                                               
                                        <td colspan="4">
                                            <div class="card-title">                        
                                                <h5>Algumas informações do sistema</h5>                                                            
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="" class="center"><img class="z-depth-2" src="<c:url value="/resources/img/estatisticas.png"/>" height="250" width="250"></td>
                                    </tr>
                                    <tr>
                                        <td><b>Número de itens publicados: </b>${itemPublicado}</td>                                                    
                                    </tr> 
                                    <tr>
                                        <td><b>Número de itens aguardando avaliação: </b><c:if test="${not empty itemAvaliacao}">${itemAvaliacao}</c:if><c:if test="${empty itemAvaliacao}">Nenhum no momento</c:if></td>
                                        </tr>
                                        <tr>
                                            <td><b>Número de administradores: </b>${countAdmin}</td>
                                        </tr>                                
                                    </table>
                                </div>
                            </div>
                        </div>                  
        </header>
    </body>
</html>