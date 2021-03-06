<%-- 
    Document   : view
    Created on : 07/09/2016, 18:25:53
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
        <script>
            $(document).ready(function () {
                $('.carousel').carousel();
            });
        </script>
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col s12">
                            <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                            <a href="/web/anunciante/pesquisar/item" class="breadcrumb">Pesquisa</a>
                            <a href="#!" class="breadcrumb">Ver Item</a>
                        </div>                        
                    </div>
                </nav>

                <table>
                    <tbody>
                        <tr>
                            <td>
                                <div class="card-panel col s12 m12 l12 z-depth-2" style="margin-top: -2%;">

                                    <table class="bordered">
                                        <tr>                                               
                                            <td colspan="2">
                                                <div class="card-title">                        
                                                    <h5>${item.nome}</h5>                                                
                                                </div>
                                            </td>                                        
                                        </tr>                                    
                                        <tr>
                                            <!--<td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>-->
                                            <td colspan="4">
                                                <c:if test="${empty item.itemImagemList}">
                                                    <img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">
                                                </c:if>
                                                <c:if test="${not empty item.itemImagemList}">
                                                    <div class="carousel" style="margin-top: -10%; margin-bottom: -20%;">
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
                                            <td><b>Data de Publicação: &nbsp;</b>${item.dataCadastro}</td>
                                            <td><b>Interesse 3: &nbsp;</b>${item.interesse3}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Telefone do Anunciante: </b>${item.anunciante.telefone}</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><b>Descrição: </b><p>${item.descricao}</p></td>
                                            <!--<td>${item.descricao}</td>--> 
                                        </tr>
                                        <c:if test="${fezOferta == true}">
                                            <tr>
                                                <td><strong>*Você realizou ofertas neste item!</strong><a href="<c:url value="/anunciante/view/oferta/item/${item.id}"/>"> Clique aqui para ver</a></td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td class="right-align" colspan="4">
                                                <a class="waves-effect waves-light btn blue col s12 m5 l5" href="<c:url value="/anunciante/comunicacao/item/${item.id}"/>">Enviar mensagem ao anunciante</a>                                        
                                                <a class="waves-effect waves-light btn brown col s12 m5 l5" href="<c:url value="/anunciante/item/${item.id}/ofertar"/>" style="margin-left: 0.6rem;">Fazer oferta por este item</a>
                                            </td>                                            
                                        </tr>                                        
                                    </table>

                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </header>

    </body>
</html>
