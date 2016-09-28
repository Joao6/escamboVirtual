<%-- 
    Document   : view
    Created on : 23/09/2016, 09:39:22
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Ofertas Recebidas</title>
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
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });
        </script> 
    </head>
    <body style="background-color: #b0bec5;">
        <header>             
            <!--MODAL ACEITAR OFERTA-->
            <div id="aceitarOferta" class="modal">
                <div class="modal-content">
                    <form method="post" action="/web/anunciante/oferta/${oferta.id}/aceitar">
                        <h4>Aceitar Oferta e Realizar a Troca</h4>
                        <p><strong>Atenção, após você aceitar esta oferta, os itens relacionados à mesma serão colocados no status "Aguardando a troca", 
                                portanto não poderão mais ser visualizados por outros anunciantes que realizarem pesquisas no sistema.</strong></p>
                        <p>Recomendamos que esta ação seja confirmada apenas quando a troca já tenha sido finalizada de fato.</p>
                        <p>Com a sua confirmação, o anunciante que realizou esta oferta, será notificado que você a aceitou e poderá confirmar a troca dos itens.</p>
                        <button class="btn blue waves-effect modal-close">Aceitar</button>
                        <a class="btn brown waves-effect modal-close">Cancelar</a>
                    </form>
                </div>
            </div>
            <!--FIM MODAL-->
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left: 15%; padding-right: 15%;">
                <div class="row">
                    <nav class="grey darken-3 card-panel col s12 z-depth-2">
                        <div class="nav-wrapper">
                            <div class="col s12">
                                <a href="<c:url value="/anunciante/home"/>" class="breadcrumb">Home</a>                                
                                <a href="<c:url value="/anunciante/oferta/list"/>" class="breadcrumb">Ofertas Recebidas</a>
                                <a href="#!" class="breadcrumb">Ver oferta</a>
                            </div>                        
                        </div>
                    </nav>
                </div>  

                <div class="card-panel" style="margin-top: -2%;">
                    <div class="card-content">
                        <div class="card-panel">
                            <div class="card-title center">OFERTA ENVIANDA PELO ANUNCIANTE <strong>${anuncianteOferta.nome}</strong> PARA SEU ITEM <strong>${oferta.item.nome}</strong></div>
                        </div>
                        <div class="row">
                            <span><strong>O ${anuncianteOferta.nome} oferece os seguintes itens em troca do seu item:</strong></span>
                        </div>
                        <div class="row">
                            <c:forEach items="${oferta.ofertaItem.itemList}" var="itemOferta">
                                <div class="card small col s12 m6 l6">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <a href="<c:url value="/anunciante/oferta/${oferta.id}/item/view/${itemOferta.id}"/>"><img class="activator" src="<c:url value="/resources/img/background3.jpg"/>"></a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">${itemOferta.nome}</span>
                                        <br/>
                                        <span class="center-align">Clique sobre a imagem para ver mais detalhes</span>
                                    </div>                                    
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <a class="btn brown right" href="<c:url value="/anunciante/oferta/list"/>">Voltar</a>                            
                            <a class="btn blue waves-effect right modal-trigger" href="#aceitarOferta" style="margin-right: 0.6rem;">Aceitar Oferta</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>        
    </body>
</html>
