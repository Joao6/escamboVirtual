<%-- 
    Document   : novo-anunciante
    Created on : 20/05/2016, 14:24:13
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Novo Cadastro de Anunciante</title>

        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/anunciante/cadastro-anunciante.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <script type="text/javascript">

            jQuery(document).ready(function ($) {

                $("#inputTelefone").mask("(99) ?9? 9999-9999");     // Máscara para TELEFONE

                $("#cep").mask("99999-999");    // Máscara para CEP

                $("#inputNascimento").mask("99/99/9999");    // Máscara para DATA

                $("#cnpj").mask("99.999.999/9999-99");    // Máscara para CNPJ

                $("#cpf").mask("999.999.999-99");    // Máscara para CPF

                $('#rg').mask('99.999.999-9');    // Máscara para RG

                $('#agencia').mask('9999-9');    // Máscara para AGÊNCIA BANCÁRIA

                $('#conta').mask('99.999-9');    // Máscara para CONTA BANCÁRIA

            });

        </script>
    </head>

    <body>
        <!-- TOP BAR -->
        <nav class="grey darken-3" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="<c:url value="/"/>" class="brand-logo white-text">Escambo Virtual</a>
                <ul class="right hide-on-med-and-down">
                    <li><a class="white-text" href="<c:url value="#"/>">Entrar</a></li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#">Entrar</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <!-- FIM TOP BAR -->

        <!-- FORMULARIO -->           
        <div class="fundo-cadastro">
            <div class="container">
                <form method="post">
                    <div class="row">
                        <div class="card-panel col s12 m8 l12" id="form1">
                            <div class="card-title">                        
                                <h5>RECUPERAR SENHA</h5>
                                <div class="form divider"></div>
                            </div>
                            <div class="card-content">                                
                                <div class="row">
                                    <div class="input-field col s12 m6 l6">
                                        <input id="inputEmail" name="email" type="email" class="validate"/>
                                        <label for="inputEmail">Email</label>
                                    </div> 
                                    <div class="col s12 m6 l6">
                                        <span>Digite o email de cadastro da sua conta!</span>
                                    </div>
                                </div>                                
                            </div>
                            <button type="submit" id="btn-cadastrar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light blue-grey darken-4" style="margin-bottom: 10px">Recuperar</button>
                            <a href="<c:url value="/"/>"><button type="button" id="btn-cancelar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light orange">Cancelar</button></a>                        
                        </div> 
                    </div>            
                </form>
            </div>
        </div>        


        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>        
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.maskedinput.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </body>
</html>
