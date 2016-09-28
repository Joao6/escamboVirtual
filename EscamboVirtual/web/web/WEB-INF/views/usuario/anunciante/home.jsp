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
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </head>

    <body style="background-color: #b0bec5 ;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">    
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/administrador/home" class="breadcrumb">Home</a>                                                                                              
                            </div>
                        </div>
                    </nav>
                </div>

                <c:if test="${countItem > 0}">
                    <div class="row" style="margin-top: -2%;">
                        <div class="card-panel">
                            <div class="card-content">
                                <table class="bordered">
                                    <tr>                                               
                                        <td colspan="4">
                                            <div class="card-title">                        
                                                <h5>Algumas informações da sua conta</h5>                                                            
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="" class="center"><img class="z-depth-2" src="<c:url value="/resources/img/estatisticas.png"/>" height="250" width="250"></td>
                                    </tr>
                                    <tr>
                                        <td><b>Número de itens cadastrados: </b>${countItem}</td>                                                    
                                    </tr> 
                                    <tr>
                                        <td><b>Número de ofertas recebidas: </b><c:if test="${not empty countOferta}">${countOferta}</c:if><c:if test="${empty countOferta}">Nenhuma até o momento</c:if></td>
                                        </tr>
                                        <tr>
                                            <td><b>Número de trocas realizadas: </b>Nenhuma até o momento</td>
                                        </tr>                                
                                    </table>
                                </div>
                            </div>
                        </div>  
                </c:if>
                <c:if test="${countItem == 0}">
                    <div class="row" style="margin-top: -2%;">
                        <div class="card-panel">
                            <div class="card-content">
                                <table class="bordered">
                                    <tr>                                               
                                        <td colspan="4">
                                            <div class="card-title">                        
                                                <h5>Seja bem vindo(a)!</h5>                                                            
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4" class=""><img class="z-depth-2" src="<c:url value="/resources/img/cadastrar.png"/>" height="250" width="250"></td>
                                    </tr>
                                    <tr>
                                        <td><b>Você ainda não possui itens cadastrados</b></td>                                                    
                                    </tr> 
                                    <tr>
                                        <td><b>Cadastre itens para utilizar nossas funcionalidades</b></td>
                                        </tr>
                                        <tr>
                                            <td><a href="<c:url value="/anunciante/item/new"/>" class="btn blue center btn-large">Cadastrar Item</a></td>
                                        </tr>                                
                                    </table>
                                </div>
                            </div>
                        </div>  
                </c:if>
            </div>
        </header>
    </body>
</html>


