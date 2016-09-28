<%-- 
    Document   : view
    Created on : 09/09/2016, 17:28:46
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Escambo Virtual</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/styleIndex.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <!--SCRIPTS-->
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>

        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.carousel').carousel();
            });
        </script>

    </head>
    <body>
        <jsp:include page="../usuario/login.jsp"></jsp:include>
            <!-- NAVBAR -->
            <div class="navbar-fixed">
                <nav class="" id="navbarTop">
                    <div class="nav-wrapper container">
                        <a id="logo-container" href="<c:url value="/"/>" class="brand-logo white-text">Escambo Virtual</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons white-text">menu</i></a>
                    <ul class="right hide-on-med-and-down">                                                
                        <li><i class="material-icons">perm_identity</i></li>
                        <li><a class='modal-trigger btn blue white-text' href='#modalLogin' style="margin-right: 30px;">Entrar</a></li>                               
                    </ul>                                                
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="#modalLogin">Entrar</a></li>                        
                    </ul>
                </div>
            </nav>
        </div>
        <!-- FIM NAVBAR-->

        <div class="container">
            <div class="card-panel">
                <div class="card-content">
                    <table>
                        <tbody>
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
                                                <!--<td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>-->
                                                <td colspan="4">
                                                    <div class="carousel" style="margin-top: -10%; margin-bottom: -20%;">
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background1.jpg"/>"></a>                                        
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background2.jpg"/>"></a>                                        
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background3.jpg"/>"></a>                                        
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background1.jpg"/>"></a>                                        
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background2.jpg"/>"></a>                                        
                                                        <a class="carousel-item" href="#one!"><img src="<c:url value="/resources/img/background3.jpg"/>"></a>                                        
                                                    </div>
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
                                                <td><b>Descrição: </b><p>${item.descricao}</p></td>
                                                <!--<td>${item.descricao}</td>--> 
                                            </tr>                                            
                                            <tr>
                                                <td>
                                                    <h6><strong>*Faça login no sistema para utilizar todas as funcionalidades.</strong></h6>
                                                </td>                                            
                                            </tr>                                        
                                        </table>

                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
