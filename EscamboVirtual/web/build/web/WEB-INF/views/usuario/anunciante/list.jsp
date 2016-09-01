<%-- 
    Document   : list
    Created on : 09/06/2016, 17:30:44
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="home.jsp" %>
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
    <div class="container">
        <body>
            <div class="container">
                <table>
                    <thead>
                        <tr>
                            <th data-field="id">ID</th>
                            <th data-field="nome">Nome</th>
                            <th data-field="sobrenome">Apelido</th>
                            <th data-field="email">Email</th>
                            <th data-field="senha">Senha</th>
                            <th data-field="nascimento">Nascimento</th>
                            <th data-field="tel">Telefone</th>
                            <th data-field="sexo">Sexo</th>
                            <th data-field="sexo">Perfil</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${anuncianteList}" var="anunciante">
                            <tr>
                                <td>${anunciante.id}</td>
                                <td>${anunciante.nome}</td>
                                <td>${anunciante.apelido}</td>
                                <td>${anunciante.email}</td>
                                <td>${anunciante.senha}</td>
                                <td>${anunciante.nascimento}</td>
                                <td>${anunciante.telefone}</td>
                                <td>${anunciante.sexo}</td>
                                <td>${anunciante.perfil}</td>
                            </tr>
                        </c:forEach>                
                    </tbody>
                </table>
            </div>

            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
            <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
            <script src="<c:url value="/resources/js/init.js"/>"></script>
        </body>
    </div>
</html>
