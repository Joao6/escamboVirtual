<%-- 
    Document   : img-perfil
    Created on : 22/09/2016, 09:54:09
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Perfil</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>

        <script>
//            document.getElementById("file").onchange = function () {
//                var reader = new FileReader();
//                reader.onload = function (e) {
//                    document.getElementById("imagem").src = e.target.result;
//                };
//                reader.readAsDataURL(this.files[0]);
//            };
            function carregaImagem(input, id) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#' + id).attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
            ;
        </script>
    </head>
    <body style="background-color: #b0bec5;">   
        <header>
            <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

            <div class="row" style="padding-left:15%;padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="/web/administrador/home" class="breadcrumb">Home</a>
                                <a href="/web/administrador/perfil" class="breadcrumb">Perfil</a>
                                <a href="#!" class="breadcrumb">Alterar Imagem de Perfil</a>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="card-panel grey darken-3" style="margin-top: -2%;">
                    <div class="card-content">
                        <div class="card-panel">
                            <div class="card-panel" style="margin-left: 33%; margin-right: 33%;">
                                <c:if test="${not empty administrador.imagem}">                
                                <img class="z-depth-2" id="imagem" src="<c:url value="/usuario/${administrador.id}/img.jpg"/>" height="200" width="200">
                            </c:if>
                            <c:if test="${empty administrador.imagem}">
                                <c:if test="${administrador.sexo == 'Masculino'}">                                                                                                               
                                    <img class="z-depth-2" id="imagem" src="<c:url value="/resources/img/default-avatar_man.png"/>" height="200" width="200">
                                </c:if>
                                <c:if test="${administrador.sexo == 'Feminino'}">                                                                                                            
                                    <img class="z-depth-2" id="imagem" src="<c:url value="/resources/img/default-avatar_women.png"/>" height="200" width="200">
                                </c:if>
                            </c:if>
                            </div>
                            <div calss="row">
                                <form method="post" enctype="multipart/form-data">
                                    <div class="file-field input-field row">
                                        <div class="btn blue">
                                            <span>Adicionar imagem de perfil</span>
                                            <input type="file" name="file" id="file" value="<c:url value="/usuario/${anunciante.id}/img.jpg"/>" onchange="carregaImagem(this, 'imagem')">                                
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>                                        
                                    </div>  
                                    <!--<hr style="border: 1px dashed;">-->
                                    <br/>
                                    <div class="row">
                                        <a class="btn brown right" href="<c:url value="/administrador/perfil"/>">Cancelar</a>
                                        <button type="submit" class="btn blue right" style="margin-right: 0.6rem;">Salvar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </header>
    </body>
</html>
