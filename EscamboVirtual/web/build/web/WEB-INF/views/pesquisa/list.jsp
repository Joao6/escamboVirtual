<%-- 
    Document   : list
    Created on : 30/08/2016, 14:41:05
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

        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
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
                    <form>                            
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <input id="pesquisar" name="nomeCriterium" type="text" value="${nomeCriterium}"/>
                                <label for="pesquisar">Pesquise por nome de itens</label>
                            </div>   
                            <button type="submit" class="btn blue" style="margin-top: 25px;">Pesquisar</button>
                        </div>
                    </form>
                </div>
                <div class="card-panel">
                    <div class="card-content">
                        <c:if test="${empty itemList}">
                            <!--<div class="card-panel col s12 z-depth-2">-->
                            <!--<div class="card-content">-->
                            <div class="card-title" style="padding-top: 15px;">
                                <span style="font-size: 16pt;"><i class="material-icons small">thumb_down</i>
                                    <strong>Nenhum resultado encontrado para esta pesquisa!</strong></span>
                            </div>
                            <!--</div>-->
                            <!--</div>-->
                        </c:if>
                        <h6><strong>Resultados encontrados:</strong> ${count}</h6>
                        <ul>
                            <c:forEach var="item" items="${itemList}">
                                <a href="<c:url value="/item/${item.id}/view"></c:url>" class="black-text painelAnuncios">
                                        <li>
                                            <div class="col s12 m12 z-depth-1 painelAnuncios">
                                                <div class="card medium" style="height: 160px;">                                       
                                                    <div class="row">                                               
                                                        <div class="card-image col s12 m4 l4">
                                                            <img src="<c:url value="/resources/img/background2.jpg"></c:url>" class="responsive-img" style="padding-top: 3px;">
                                                        </div>
                                                        <div class="card-content">
                                                            <span><strong>${item.nome}</strong></span>                                                    
                                                        <br/>
                                                        <div class="divider"></div>
                                                        <br/>
                                                        <span class=""><strong>Descrição:</strong></span>
                                                        <p>${item.descricao}</p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                        <ul class="pagination center">
                            <c:if test="${offset > 0}">
                                <li class="waves-effect"><a href="<c:url value="/item/search?nomeCriterium=${nomeCriterium}&limit=${limit}&offset=${offset - limit}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                </c:if>

                            <c:if test="${offset <= 0}">
                                <li class="waves-effect"><a href="<c:url value="/item/search?nomeCriterium=${nomeCriterium}&limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_left</i></a></li>                            
                                </c:if>


                            <c:if test="${(offset + limit) < count}">
                                <li class="waves-effect"><a href="<c:url value="/item/search?nomeCriterium=${nomeCriterium}&limit=${limit}&offset=${offset + limit}"/>"><i class="material-icons">chevron_right</i></a></li>
                                </c:if>

                            <c:if test="${(offset + limit) >= count}">
                                <li class="waves-effect"><a href="<c:url value="/item/search?nomeCriterium=${nomeCriterium}&limit=${limit}&offset=${offset}"/>"><i class="material-icons">chevron_right</i></a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>

            </div>  
        </div>
    </body>
</html>
