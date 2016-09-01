<%-- 
    Document   : new
    Created on : 01/09/2016, 14:07:39
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="home.jsp"></jsp:include>

    <div class="container">
        <form method="post">
            <div class="row">
                <div class="card-panel col s12 m12" id="form1">
                    <div class="card-title">                        
                        <h5>INFORMAÇÕES PESSOAIS</h5>
                        <div class="form divider"></div>
                    </div>
                    <div class="card-content">
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <input id="inputNome" name="nome" type="text" class="validate" required=""/>
                                <label for="inputNome">Nome</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="inputCpf" name="cpf" type="text" class="validate" required=""/>
                                <label for="inputCpf">CPF</label>
                            </div>                                
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6 l6">
                                <input id="inputEmail" name="email" type="email" class="validate" required=""/>
                                <label for="inputEmail">Email</label>
                            </div>                                
                            <div class="input-field col s12 m6 l6">
                                <input id="inputApelido" name="apelido" type="text" class="validate" required=""/>
                                <label for="inputApelido">Email</label>
                            </div>                                
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <input id="inputSenha" name="senha" type="password" class="validate" required=""/>
                                <label for="inputSenha">Senha</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="inputConfirmaSenha" name="confirmaSenha" type="password" class="validate" required=""/>
                                <label for="inputConfirmaSenha">Confirmar Senha</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <input id="inputTelefone" name="telefone" type="text" class="validate"/>
                                <label for="inputTelefone">Telefone</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="inputNascimento" name="nascimento" type="text" class="validate"/>
                                <label for="inputNascimento">Data de Nascimento</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 m6">                                    
                                <select id="inputSexo" name="sexo">
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                </select>
                                <label>Sexo</label>
                            </div>
                        </div>                        
                        <button type="submit" id="btn-cadastrar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light blue-grey darken-4" style="margin-bottom: 10px">Cadastrar</button>
                        <a href="<c:url value="/"/>"><button type="button" id="btn-cancelar" class="col s12 m3 push-m6 btn btn-large waves-effect waves-light orange">Cancelar</button></a>                                                
                    </div>
                </div>
            </div>
        </form>
    </div>

<jsp:include page="rodape.jsp"></jsp:include>


