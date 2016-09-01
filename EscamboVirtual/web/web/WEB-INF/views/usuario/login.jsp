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
                        <button type="submit" class=" modal-action waves-effect waves-green btn btn-flat">Enviar</button>
                        <a href="#" class=" modal-close waves-effect waves-green btn btn-flat">Cancelar</a>                         
                    </div>
                </form>
            </div>
        </div>
        <!--FIM MODAL-->

        <!-- MODAL LOGIN-->
        <div id="modalLogin" class="modal">
            <div class="modal-content">
                <form class="card-panel col s8 l8" method="post" id="formLogin" name="formLogin" action="usuario/login">                    
                    <div class="card-title center">                        
                        <h5>LOGIN</h5>
                        <div class="form divider"></div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">email</i>
                            <input id="icon_prefix" type="email" class="validate" name="email" id="email">
                            <label for="icon_prefix">E-mail</label>
                        </div>

                        <div class="input-field col s6">
                            <i class="material-icons prefix">vpn_key</i>
                            <input id="icon_telephone" type="password" class="validate" name="senha" id="senha">
                            <label for="icon_telephone">Senha</label>
                        </div>
                    </div>
                    <div class="row">
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
                        <div class="row">
                            <a href="<c:url value="#modalRecuperarSenha"></c:url>" class="modal-trigger right col">Esqueceu a senha?</a>
                        </div>
                        <input type="button" class="btn right red modal-close" value="Voltar">
                        <button type="submit" id="btn-cadastrar" class="waves-effect waves-light btn green right">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
              
        <!--        <div class="row" style="margin-left: 25%;">
                    <table>
                        <tr>
                            <td>
                                <form class="card-panel col s8" method="post" id="formLogin" name="formLogin">
                                    <input type="hidden" name="tipo" value="0">
                                    <div class="card-title">                        
                                        <h5>Login</h5>
                                        <div class="form divider"></div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">email</i>
                                            <input id="icon_prefix" type="text" class="validate" name="email" id="email">
                                            <label for="icon_prefix">E-mail</label>
                                        </div>
        
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">vpn_key</i>
                                            <input id="icon_telephone" type="password" class="validate" name="senha" id="senha">
                                            <label for="icon_telephone">Senha</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
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
                                        <div class="row">
                                            <a href="#modal1" class="modal-trigger">Esqueceu a senha?</a>
                                        </div>
                                        <button type="submit" id="btn-cadastrar" class="waves-effect waves-light btn right">Entre</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form class="card-panel col s8" method="post"   id="formCadastrar" name="formCadastrar">
                                    <div class="card-title">                        
                                        <h5>Cadastrar-se</h5>
                                        <div class="form divider"></div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="inputNome" name="nome" type="text" class="validate" required=""/>
                                            <label for="inputNome">Nome</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="inputSobrenome" name="sobrenome" type="text" class="validate" required=""/>
                                            <label for="inputSobrenome">Sobrenome</label>
                                        </div>                                
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input id="inputEmail" name="email" type="email" class="validate" required=""/>
                                            <label for="inputEmail">Email</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="inputSenha" name="senha" type="password" class="validate" required=""/>
                                            <label for="inputSenha">Senha</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="inputSenha" name="confirmarSenha" type="password" class="validate" required=""/>
                                            <label for="inputSenha">Confirmar Senha</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col  s3">
                                            <input id="inputCidade" name="cidade" type="text" class="validate"/>
                                            <label for="inputCidade">Cidade</label>
                                        </div>
                                        <div class="input-field col  s3">
                                            <select id="inputUf" name="uf">
                                                <option value="" disabled selected>UF</option>
                                                <option value="AC">AC</option>
                                                <option value="AL">AL</option>
                                                <option value="AP">AP</option>
                                                <option value="AM">AM</option>
                                                <option value="BA">BA</option>
                                                <option value="CE">CE</option>
                                                <option value="DF">DF</option>
                                                <option value="ES">ES</option>
                                                <option value="GO">GO</option>
                                                <option value="MA">MA</option>
                                                <option value="MT">MT</option>
                                                <option value="MS">MS</option>
                                                <option value="MG">MG</option>
                                                <option value="PA">PA</option>
                                                <option value="PB">PB</option>
                                                <option value="PR">PR</option>
                                                <option value="PE">PE</option>
                                                <option value="PI">PI</option>
                                                <option value="RJ">RJ</option>
                                                <option value="RN">RN</option>
                                                <option value="RS">RS</option>
                                                <option value="RO">RO</option>
                                                <option value="RR">RR</option>
                                                <option value="SC">SC</option>
                                                <option value="SP">SP</option>
                                                <option value="SE">SE</option>
                                                <option value="TO">TO</option>                                                                                
                                            </select>                                                                     
                                        </div>
                                        <div class="input-field col s3">
                                            <input id="inputTelefone" name="telefone" type="text" class="validate"/>
                                            <label for="inputTelefone">Telefone</label>
                                        </div>
                                        <div class="input-field col s3  ">
                                            <input id="inputNascimento" name="nascimento" type="text" class="validate"/>
                                            <label for="inputNascimento">Data de Nascimento</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">                                    
                                            <select id="inputSexo" name="sexo">
                                                <option value="" disabled selected>Selecione</option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Feminino">Feminino</option>
                                            </select>
                                            <label>Sexo</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <button type="submit" id="btn-cadastrar" class="waves-effect waves-light btn right">Cadastrar</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>-->

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
