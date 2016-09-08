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

        <script>
            function mascaraData(t, mask) {
                var i = t.value.length;
                var saida = mask.substring(1, 0);
                var texto = mask.substring(i)
                if (texto.substring(0, 1) != saida) {
                    t.value += texto.substring(0, 1);
                }
            }
        </script>
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
                            <a href="/web/anunciante/item" class="breadcrumb">Meus Itens</a>
                            <a href="#!" class="breadcrumb">Cadastrar</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row" style="padding-left:15%;padding-right: 15%;">
                <form method="post" class="card-panel col s12 z-depth-2">
                    <div class="card-title">                        
                        <h5>Cadastro de Item</h5>
                        <div class="form divider"></div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6 l6">
                            <input id="nome" name="nome" type="text" class="validate" />
                            <label for="nome">Nome</label>
                        </div>
                        <div class="input-field col s12 m6 l6">
                            <input id="dataAquisicao" name="dataAquisicao" type="text" class="validate" onkeypress="mascaraData(this, '##/##/####')" maxlength="10"/>
                            <label for="dataAquisicao">Data de aquisição</label>
                        </div>                          

                    </div>
                    <div class="row">
                        <div class="input-field col s12 m4 l4">
                            <input id="interesse1" name="interesse1" type="text" class="validate"/>
                            <label for="interesse1">Interesse 1</label>
                        </div>    
                        <div class="input-field col s12 m4 l4">
                            <input id="interesse2" name="interesse2" type="text" class="validate" />
                            <label for="interesse2">Interesse 2</label>
                        </div>
                        <div class="input-field col s12 m4 l4">
                            <input id="interesse3" name="interesse3" type="text" class="validate"/>
                            <label for="interesse3">Interesse 3</label>
                        </div>                         
                    </div>

                    <div class="row">
                        <div class="input-field col s12 m2 l2">
                            <div class="center-align green lighten-3 z-depth-2"><b>Principal</b></div>&nbsp;
                            <img class="card-panel col s12 green lighten-3 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                        </div>
                        <div class="input-field col s12 m2 l2">
                            <div class="center-align green lighten-3 z-depth-2"><b>Imagem 1</b></div>&nbsp;
                            <img class="card-panel col s12  lighten-3 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                        </div>
                        <div class="input-field col s12 m2 l2">
                            <div class="center-align green lighten-3 z-depth-2"><b>Imagem 2</b></div>&nbsp;
                            <img class="card-panel col s12 lighten-3 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                        </div>
                        <div class="input-field col s12 m2 l2">
                            <div class="center-align green lighten-3 z-depth-2"><b>Imagem 3</b></div>&nbsp;
                            <img class="card-panel col s12 lighten-3 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                        </div>
                        <div class="input-field col s12 m2 l2">
                            <div class="center-align green lighten-3 z-depth-2"><b>Imagem 4</b></div>&nbsp;
                            <img class="card-panel col s12 lighten-3 z-depth-2 responsive-img" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                        </div>
                    </div>
                    <div class="row">

                        <img class="responsive-img" id="image" name="image" src="">

                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span>Adicionar imagens</span>
                                <input type="file" id="file" multiple>
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload one or more files">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="textarea1" class="materialize-textarea" name="descricao" length="1400"></textarea>
                            <label for="textarea1">Descrição</label>
                        </div>
                    </div>
                    <div class="row">
                        <input type="submit" class="waves-effect waves-light btn blue right col s12 m4 l2" style="margin-left: 0.6rem;" value="Salvar" />&nbsp;
                        <a class="waves-effect waves-light btn right brown col s12 m4 l2" href="<c:url value="/anunciante/item"/>">Cancelar</a>
                    </div> 
                </form>
            </div>
        </header>
    </body>
</html>
