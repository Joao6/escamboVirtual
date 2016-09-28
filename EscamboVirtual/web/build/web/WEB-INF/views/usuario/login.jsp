<%-- 
    Document   : novo-anunciante
    Created on : 20/05/2016, 14:24:13
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--MODAL RECUPERAR SENHA-->
<div id="modalRecuperarSenha" class="modal">
    <div class="modal-content">
        <h4>Recuperar senha</h4>
        <p>Digite o email referente a conta de usuário:</p>
        <form method="post" action="/web/usuario/recuperar-senha">                    
            <input type="email" class="validate" id="inputRecuperarSenha" name="emailRecuperacao" required=""/>
            <div class="modal-footer">
                <a href="#" class=" modal-close waves-effect btn brown" style="margin-left: 0.6rem;">Cancelar</a>                         
                <button type="submit" class="modal-action waves-effect btn blue">Enviar</button>
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
                <form style="overflow-x: hidden;" method="post" id="formLogin" name="formLogin" action="/web/usuario/login">
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
