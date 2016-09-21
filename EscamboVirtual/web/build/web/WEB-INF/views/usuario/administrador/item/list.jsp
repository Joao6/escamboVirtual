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
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col s12">
                            <a href="/web/administrador/home" class="breadcrumb">Home</a>
                            <a href="#!" class="breadcrumb">Avaliar Itens </a>
                        </div>
                    </div>
                </nav>

                <c:if test="${empty itemList}">
                    <div class="card-panel col s12 z-depth-2 grey darken-3">
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

                <table>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td>
                                    <c:if test="${item.status == 'Em Avaliação'}">
                                        <div class="card-panel col s12 z-depth-2">
                                            <form method="post" action="/web/administrador/item/${item.id}/edit">
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
                                                        <td colspan="3"><b>ID Item: &nbsp;</b>${item.id}</td>
                                                    </tr>
                                                    <tr>
                                                        <td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>
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
                                                        <td><b>Status</b></td>
                                                        <td>
                                                            <select name="status" class="browser-default" style="border-color: grey;">
                                                                <option value="${item.status}" selected="">${item.status}</option>
                                                                <option value="Publicar">Publicar</option>
                                                                <option value="Cancelar Publicação">Cancelar Publicação</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" class="right-align">                                                            
                                                            <button class="waves-effect waves-light btn right blue">Salvar</button>            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>                
                    </tbody>
                </table>                
            </div>
        </header>
    </body>
</html>
