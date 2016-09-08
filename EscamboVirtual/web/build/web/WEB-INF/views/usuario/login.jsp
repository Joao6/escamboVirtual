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
        <title>Login</title>

        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/anunciante/cadastro-anunciante.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>

        <!--MODAL RECUPERAR SENHA-->
        <div id="modalRecuperarSenha" class="modal">
            <div class="modal-content">
                <h4>Recuperar senha</h4>
                <p>Digite o email referente a conta de usuário:</p>
                <form method="post" action="usuario/recuperar-senha">                    
                    <input type="email" class="validate" id="inputRecuperarSenha" name="emailRecuperacao" required=""/>
                    <div class="modal-footer">
                        <a href="#" class=" modal-close waves-effect waves-green btn brown" style="margin-left: 0.6rem;">Cancelar</a>                         
                        <button type="submit" class="modal-action waves-effect waves-green btn blue">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
        <!--FIM MODAL-->
        
        <!-- MODAL LOGIN-->
        <div class="modal" id="modalLogin">
            <div class="modal-content">
                <div class="card-panel">
                    <div class="card-content">
                        <div class="card-title center">
                            <h5>LOGIN</h5>
                            <div class="form divider"></div>
                        </div>
                        <form style="overflow-x: hidden;" method="post" id="formLogin" name="formLogin" action="usuario/login">
                            <div class="row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">email</i>
                                    <input id="email" type="email" class="validate" name="email" id="email">
                                    <label for="email">E-mail</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">vpn_key</i>
                                    <input id="senha" type="password" class="validate" name="senha" id="senha">
                                    <label for="senha">Senha</label>
                                </div>

                                <div class="input-field col s5">
                                    <script>
                                        var variaveis = location.search.split("?");
                                        var quebra = variaveis[1].split("=");
                                        if (quebra[1] == "1") {
                                            document.writeln("<b style='color:red'>Usuário ou senha inválidos.</b>");
                                        } else if (quebra[1] == "2") {
                                            document.writeln("<b style='color:red'>Sua sessão expirou.</b>");
                                        }
                                    </script>
                                </div>
                            </div>
                            <div class="row center">                                
                                <button class="btn blue col s12 m6 push-l3 waves-effect waves-light" style="margin-right: 0.6rem; margin-bottom: 0.6rem;">Entrar</button>                                
                                <input type="button" class="btn brown col s12 m6 push-l3 waves-effect waves-light modal-close" value="Voltar">
                            </div>
                            <div class="row center">
                                <a href="<c:url value="/anunciantes/novo"/>">Registrar</a>
                                <span>||</span>
                                <a href="<c:url value="#modalRecuperarSenha"></c:url>" class="modal-trigger">Esqueceu a senha?</a>
                            </div>
                        </form>
                    </div>
                </div>
           </div>
        </div>             

            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
        <script src="<c:url value="/resources/js/init.js"/>"></script>
    </body>

    <script>
                                $(document).ready(function () {
                                    $('.modal-trigger').leanModal();
                                });

                                $(document).ready(function () {
                                    $("#formCadastrar .validate").blur(function () {
                                        if ($(this).val() === "" || $(this).val === undefined)
                                        {
//                                                    $(this).css({"border": "1px solid #F00", "padding": "2px"});
                                            Materialize.toast('Este campo é obrigatório!!', 4000, 'rounded red') // 4000 is the duration of the toast
                                            $(this).css({"background-color": "rgba(255, 192, 206, 0.4)"});
                                        } else {
                                            $(this).css({"background-color": "#FFF"});
                                        }
                                    });

                                });

    </script>

</html>
