<%-- 
    Document   : list
    Created on : 20/09/2016, 10:45:53
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Lista de Administradores</title>
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
    <body  style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/administrador/home" class="breadcrumb">Home</a>
                                <a href="#!" class="breadcrumb">Administradores</a>
                            </div>
                        </div>
                    </nav>
                    <a class="btn blue right" href="<c:url value="/administrador/new"/>" style="margin-bottom: 1%;">Cadastrar Administrador</a>
                </div>
                <div class="card-panel" style="margin-top: -2%;">
                    <div class="card-content">
                        <h5 class="center">ADMINISTRADORES CADASTRADOS</h5>
                        <div class="divider"></div>
                        <table class="bordered responsive-table striped">
                            <thead>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>CPF</th>
                            <th>Telefone</th>
                            <th></th>
                            </thead>
                            <tbody>
                                <c:forEach items="${admList}" var="adm">
                                    <tr>
                                        <td>${adm.nome}</td>
                                        <td>${adm.email}</td>
                                        <td>${adm.cpf}</td>
                                        <td>${adm.telefone}</td>                                        
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <ul class="pagination center">
                            <c:if test="${offset > 0}">
                                <li class="waves-effect"><a href="<c:url value="/administrador/list?limit=${limit}&offset=${offset - limit}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                </c:if>

                            <c:if test="${offset <= 0}">
                                <li class="waves-effect"><a href="<c:url value="/administrador/list?limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                </c:if>


                            <c:if test="${(offset + limit) < count}">
                                <li class="waves-effect"><a href="<c:url value="/administrador/list?limit=${limit}&offset=${offset + limit}"/>"><i class="material-icons">chevron_right</i></a></li>
                                </c:if>

                                <c:if test="${(offset + limit) >= count}">
                                <li class="waves-effect"><a href="<c:url value="/administrador/list?limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_right</i></a></li>
                                </c:if>
                        </ul>
                    </div>
                </div> 
            </div>
        </header>
    </body>
</html>
