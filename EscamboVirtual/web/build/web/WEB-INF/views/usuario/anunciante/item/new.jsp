<%-- 
    Document   : new
    Created on : 07/09/2016, 14:15:20
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Cadastrar Novo Item</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--SCRIPTS-->
        <script>
            document.getElementById("file").onchange = function () {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById("image").src = e.target.result;
                };
                reader.readAsDataURL(this.files[0]);
            };
        </script>
        <style>
            .active{
                color:#0277bd !important;
            }
        </style>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>

        <script src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        <script src="<c:url value="/resources/js/mask-cadastro.js"/>"></script>
    </head>
    <body style="background-color: #b0bec5;">
        <header>
            <jsp:include page="/resources/templates/menu-lateral-anunciante.jsp"/>

            <div class="row" style="padding-left:15%;padding-right: 15%;">
                <nav class="grey darken-3 card-panel col s12 z-depth-2">
                    <div class="nav-wrapper">
                        <div class="col s12">
                            <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                            <a href="/web/anunciante/item" class="breadcrumb">Meus Itens</a>
                            <a href="#!" class="breadcrumb">Cadastrar Item</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row" style="padding-left:15%;padding-right: 15%; margin-top: -2%;">
                <div class="card-panel col s12 z-depth-2 grey darken-3">
                    <form method="post">                    
                        <div class="card-content" style="padding-top: 1%;">                        
                            <div class="card-panel">
                                <div class="card-content">
                                    <div class="card-title">                        
                                        <h5>Informações do seu item</h5>
                                        <div class="form divider grey"></div>
                                        <br/>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12 m6 l6">
                                            <input id="nome" name="nome" type="text" class="validate" placeholder="Ex.: bola" required=""/>
                                            <label for="nome">Nome</label>
                                        </div>
                                        <div class="input-field col s12 m6 l6">
                                            <input id="dataAquisicao" name="dataAquisicao" type="text" class="validate" placeholder="Ex.: 31/02/2014" required=""/>
                                            <label for="dataAquisicao">Data de aquisição</label>
                                        </div>                          
                                    </div>
                                    <div class="row">
                                        <!--<span><strong>Insira uma breve descrição sobre ele:</strong></span>-->
                                        <div class="input-field col s12">
                                            <textarea id="textarea1" class="materialize-textarea" name="descricao" length="1400" placeholder="Faça uma breve descrição do seu item" required=""></textarea>
                                            <label for="textarea1">Descrição</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel"
                                 <div class="card-content">
                                    <div class="row">
                                        <div class="card-title">                        
                                            <h5>Lista de interesses</h5>
                                            <div class="form divider grey"></div>
                                            <br/>
                                        </div>
                                        <div class="input-field col s12 m4 l4">
                                            <input id="interesse1" name="interesse1" type="text" class="validate" placeholder="Ex.: Celular"/>
                                            <label for="interesse1">Interesse 1</label>
                                        </div>    
                                        <div class="input-field col s12 m4 l4">
                                            <input id="interesse2" name="interesse2" type="text" class="validate" placeholder="Ex.: Livro" />
                                            <label for="interesse2">Interesse 2</label>
                                        </div>
                                        <div class="input-field col s12 m4 l4">
                                            <input id="interesse3" name="interesse3" type="text" class="validate" placeholder="Ex.: Notebook"/>
                                            <label for="interesse3">Interesse 3</label>
                                        </div>                         
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel">
                                <div class="card-content">
                                    <div class="row">
                                        <div class="card-title">                        
                                            <h5>Adicione imagens do seu item</h5>
                                            <div class="form divider grey"></div>
                                            <br/>
                                        </div>
                                        <table>
                                            <tr>
                                                <th class="center-align green lighten-3 z-depth-2">Principal</th>
                                                <th class="center-align green lighten-5">imagem 1</th>
                                                <th class="center-align green lighten-5">imagem 2</th>
                                                <th class="center-align green lighten-5">imagem 3</th>
                                                <th class="center-align green lighten-5">imagem 4</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img class="card-panel col s12 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                                                </td>
                                                <td>
                                                    <img class="card-panel col s12 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                                                </td>
                                                <td>
                                                    <img class="card-panel col s12 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                                                </td>
                                                <td>
                                                    <img class="card-panel col s12 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                                                </td>
                                                <td>
                                                    <img class="card-panel col s12 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="row">

                                        <img class="responsive-img" id="image" name="image" src="">

                                        <div class="file-field input-field">
                                            <div class="btn blue">
                                                <span>Adicionar imagens</span>
                                                <input type="file" id="file" multiple>
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text" placeholder="Adicione as imagens do seu item">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-panel">
                                <div class="card-content">
                                    <div class="row">
                                        <div class="card-title">                        
                                            <h5>Associe palavras-chave ao seu item</h5>
                                            <div class="form divider grey"></div>
                                            <br/>
                                        </div>
                                        <select name="palavra-chave" id="palavra-chave" class="browser-default" style="border-color: grey;">
                                            <option value="" disabled="" selected="">Palavras-chave</option>
                                            <c:forEach items="${palavraChaveList}" var="palavraChave">
                                                <option value="${palavraChave.id}">${palavraChave.nome}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a class="waves-effect waves-light btn right brown col s12 m4 l2" href="<c:url value="/anunciante/item"/>">Cancelar</a>                                
                                <button class="waves-effect waves-light btn blue right col s12 m4 l2" style="margin-right: 0.6rem;">Salvar</button>
                            </div> 
                    </form>
                </div>
            </div>
        </div>
    </header>
</body>
</html>
