<%-- 
    Document   : perfil
    Created on : 07/09/2016, 14:04:50
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

        <!--SCRIPTS-->
        <script>
            function buscar_cidades() {
                var estado = $('#estado').val();
                if (estado) {
                    var url = '/web/usuario/cidades/' + estado;
                    $.get(url, function (dataReturn) {
                        var cidades = jQuery.parseJSON(dataReturn);

                        var select = $('#cidade');
                        select.find('option').remove();
                        $('<option>').val('').text('Selecione a Cidade').appendTo(select);

                        var i = 0;
                        while (i < cidades.length) {
                            $('<option>').val(cidades[i].id).text(cidades[i].nome).appendTo(select);
                            i++;
                        }
                    });
                }
            }
        </script>        
    </script>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
    <script src="<c:url value="/resources/js/init.js"/>"></script>
</head>
<body style="background-color: #b0bec5;">
    <header>
        <jsp:include page="/resources/templates/menu-lateral-administrador.jsp"/>

        <div class="row" style="padding-left:15%;padding-right: 15%;">
            <nav class="grey darken-3 card-panel col s12 z-depth-2">
                <div class="nav-wrapper">
                    <div class="col s12">
                        <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                        <a href="#!" class="breadcrumb">Perfil</a>
                    </div>
                </div>
            </nav>
            <form class="card-panel col s12 z-depth-2" method="post">
                <div class="card-title">                        
                    <h5>Meus Dados</h5>
                    <div class="form divider"></div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m6 l6">                            
                        <c:if test="${not empty administrador.imagem}">                
                                <img class="card-panel col s12 m6 l6 lighten-3 z-depth-2 responsive-img" style="margin: 1%;"  id="imagem" name="imagem" src="<c:url value="/usuario/${administrador.id}/img.jpg"/>">
                            </c:if>
                            <c:if test="${empty administrador.imagem}">
                                <c:if test="${administrador.sexo == 'Masculino'}">                                                                           
                                    <img class="card-panel col s12 m6 l6 lighten-3 z-depth-2 responsive-img" style="margin: 1%;"  id="imagem" name="imagem" src="<c:url value="/resources/img/default-avatar_man.png"/>">
                                </c:if>
                                <c:if test="${administrador.sexo == 'Feminino'}">                                                                        
                                    <img class="card-panel col s12 m6 l6 lighten-3 z-depth-2 responsive-img" style="margin: 1%;"  id="imagem" name="imagem" src="<c:url value="/resources/img/default-avatar_women.png"/>">
                                </c:if>
                            </c:if>
                        <br/>
                        <a class="btn blue" href="<c:url value="/administrador/imagem-perfil/alterar"/>">Alterar imagem</a>
                    </div>
                </div>
                <div class="divider"></div>
                <br/>
                <div class="row">
                    <div class="input-field col s12 m6 l6">
                        <input id="inputNome" name="nome" type="text" class="validate" value="${administrador.nome}" />
                        <input type="hidden" name="perfil" value="1">
                        <label for="inputNome">Nome</label>
                    </div>
                    <div class="input-field col s12 m6 l6">
                        <input id="apelido" name="apelido" type="text" class="validate" value="${administrador.apelido}" />
                        <label for="apelido">Apelido</label>
                    </div>                                
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l6">
                        <input id="inputEmail" name="email" type="email" class="validate" value="${administrador.email}"/>
                        <label for="inputEmail">Email</label>
                    </div>
                    <div class="input-field col s12 m12 l6">
                        <input id="inputCpf" name="cpf" type="text" class="validate" value="${administrador.cpf}"/>
                        <label for="inputCpf">CPF</label>
                    </div>
                </div>
                <div class="row">         
                    <div class="input-field col s12 m4 l4">
                        <input id="telefone" name="telefone" type="text" class="validate" value="${administrador.telefone}"  maxlength="13" onkeypress="mascaraTel(this, '##-#####-####')"/>
                        <label for="telefone">Telefone</label>
                    </div>
                    <div class="input-field col s12 m4 l4">
                        <input id="nascimento" name="nascimento" type="text" class="validate" value="${administrador.nascimento}" onkeypress="mascaraData(this, '##/##/####')" maxlength="10"/>
                        <label for="nascimento">Data de Nascimento</label>
                    </div>
                    <div class="input-field col s12 m4 l4">                                    
                        <select id="sexo" class="browser-default" name="sexo" style="border-color: grey;">
                            <option value="${administrador.sexo}"  selected>${administrador.sexo}</option>
                            <option></option>
                            <option value="Masculino">Masculino</option>
                            <option value="Feminino">Feminino</option>
                        </select>                        
                    </div>
                </div>
                <br />
                <div class="card-title">                        
                    <h5>Localização</h5>
                    <div class="form divider"></div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m6 l6">
                        <select name="estado" id="estado" class="browser-default" style="border-color: grey;" onchange="buscar_cidades()">
                            <option value="" disabled="" selected="">Selecione o Estado</option>
                            <option value="${localizacao.estado.id}" selected="">${localizacao.estado.nome}</option>
                            <c:forEach items="${estados}" var="estado">
                                <option value="${estado.id}">${estado.nome}</option>
                            </c:forEach>
                        </select>                            
                    </div>
                    <div id="load_cidades" class="input-field col s12 m6 l6">
                        <select name="cidade" id="cidade" class="browser-default" style="border-color: grey;">                                
                            <option value="${localizacao.cidade.id}" selected="">${localizacao.cidade.nome}</option>
                        </select>                            
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m4 l4">
                        <input id="bairro" name="bairro" type="text" class="validate" value="${localizacao.bairro}"/>
                        <label for="bairro">Bairro</label>
                    </div>
                    <div class="input-field col s12 m4 l4">
                        <input id="rua" name="rua" type="text" class="validate" value="${localizacao.rua}"/>
                        <label for="rua">Rua</label>
                    </div>
                    <div class="input-field col s12 m4 l4">
                        <input id="numero" name="numero" type="text" class="validate" value="${localizacao.numero}"/>
                        <label for="numero">Numero</label>
                    </div>

                </div>
                <div class="row">            
                    <a class="waves-effect waves-light btn right brown col s12 m4 l2" href="<c:url value="/administrador/home"/>">Voltar</a>
                    <button class="waves-effect waves-light btn blue right col s12 m4 l2" style="margin-right: 0.6rem;">Salvar</button>
                </div>
            </form>
        </div>
    </header>
</body>
</html>
