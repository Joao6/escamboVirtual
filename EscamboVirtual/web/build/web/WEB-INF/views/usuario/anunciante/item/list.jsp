<%-- 
    Document   : list
    Created on : 07/09/2016, 14:10:38
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Meus Itens</title>
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
            
            <div class="row" style="padding-left:15%;padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col s12">
                            <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                            <a href="#!" class="breadcrumb">Meus Itens</a>
                        </div>
                    </div>
                </nav>
                <div class="card-panel col s12 m12 l12">
                    <div class="right-align">
                        <a class="waves-effect waves-light btn blue" href="<c:url value="/anunciante/item/new"/>" style="margin-top: 1rem;">Cadastrar item</a>
                    </div>
                    <table>
                        <tbody>
                            <c:forEach items="${itemList}" var="item">
                                <tr>
                                    <td>
                                        <div class="card-panel col s12 m12 l12 z-depth-2">

                                            <table class="bordered">
                                                <tr>                                               
                                                    <td colspan="2">
                                                        <div class="card-title">                        
                                                            <h5>${item.nome}</h5>                                                
                                                        </div>
                                                    </td>                                        
                                                </tr>                                    
                                                <tr>
                                                    <td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Data de Publicação: &nbsp;</b>${item.dataCadastro}</td>
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
                                                    <td>${item.descricao}</td> 
                                                </tr>
                                                <tr>
                                                    <td class="right-align" colspan="4">
                                                        <a class="waves-effect waves-light btn brown" href="<c:url value="/anunciante/item/${item.id}/edit"/>" style="margin-left: 0.6rem;">Editar</a>
                                                        <a class="waves-effect waves-light btn red" href="<c:url value="/anunciante/item/${item.id}/del"/>">Apagar</a>                                        
                                                    </td>
                                                </tr>
                                            </table>

                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>                
                        </tbody>
                    </table>
                </div>

            </div>
        </header>
                    ${msg}
    </body>
</html>
