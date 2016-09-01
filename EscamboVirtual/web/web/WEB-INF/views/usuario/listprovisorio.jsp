<%-- 
    Document   : list
    Created on : 09/06/2016, 17:30:44
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../../../index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Escambo Virtual</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <header>
            <div class="row" >
                <div class="container">
                    <table>
                        <tbody>
                            <c:forEach items="${itemList}" var="item">
                                <tr>
                                    <td>
                                        <c:if test="${item.status == 'Publicar'}">
                                            <div class="card-panel col s12 z-depth-2">
                                                <form method="post" action="/web/administrador/item/${item.id}/edit">
                                                    <table class="bordered">
                                                        <tr>                                               
                                                            <td  colspan="4">
                                                                <div class="card-title">                        
                                                                    <h5>${item.nome}</h5>
                                                                    <div class="form divider"></div>
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
                                                            <td><b>ID Usuario: &nbsp;</b>${item.idUsuario}</td>
                                                            <td><b>Interesse 1: &nbsp;</b>${item.interesse1}</td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Data de Aquisição: &nbsp;</b>${item.dataAquisicao}</td>
                                                            <td><b>Interesse 2: &nbsp;</b>${item.interesse2}</td>
                                                        </tr>
                                                        <tr>
    <!--                                                        <td><b>Status: &nbsp;</b>${item.status}</td>-->
                                                            <td></td>
                                                            <td><b>Interesse 3: &nbsp;</b>${item.interesse3}</td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Descrição: </b></td>
                                                            <td colspan="3">${item.descricao}</td> 
                                                        </tr>
                                                        <!--
                                                            <tr>
                                                                <td><b>ID Item: &nbsp;</b>${item.id}</td>     
                                                            </tr>
                                                        -->
                                                        <tr>
                                                            <td><b>Status</b></td>
                                                            <td>
                                                                <select name="status">
                                                                    <option value="${item.status}">${item.status}</option>
                                                                    <option value="Publicar">Publicar</option>
                                                                    <option value="Calcelar Publicação">Calcelar Publicação</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3" class="right-align">
                                                                <input type="submit" class="waves-effect waves-light btn right" value="Salvar" />
<!--                                                                <a class="waves-effect waves-light btn right-align" href="<c:url value="/administrador/item/${item.id}/edit"/>">Salvar</a>-->
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <input type="hidden" name="nome" value="${item.nome}" />
                                                    <input type="hidden" name="dataAquisicao" value="${item.dataAquisicao}" />
                                                    <input type="hidden" name="descricao" value="${item.descricao}" />
                                                    <input type="hidden" name="idUsuario" value="${item.idUsuario}" />
                                                    <input type="hidden" name="interesse1" value="${item.interesse1}" />
                                                    <input type="hidden" name="interesse2" value="${item.interesse2}" />
                                                    <input type="hidden" name="interesse3" value="${item.interesse3}" />
                                                </form>
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>                
                        </tbody>
                    </table>
                </div>

                <!--Import jQuery before materialize.js-->
                <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
                <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
                <script src="<c:url value="/resources/js/init.js"/>"></script>
            </div>
        </header>
    </body>
</html>
