<%@ include file="home.jsp" %>
<div class="row" style="padding-left:15%;padding-right: 15%;">
    <nav class="grey darken-3 card-panel col s12 z-depth-2">
        <div class="nav-wrapper">
            <div class="col col s12 m6 l6">
                <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                <a href="#!" class="breadcrumb">Alterar Senha</a>
            </div>
        </div>
    </nav>
    <form class="card-panel z-depth-2 col s12" method="post">
        <div class="card-title">                        
            <h5>Alterar Senha</h5>
            <div class="form divider"></div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <input id="senhaatual" name="senhaatual" type="password" class="validate" required/>
                <label for="senhaatual">Senha Atual</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <input id="novasenha" name="novasenha" type="password" class="validate" required/>
                <label for="novasenha">Nova Senha</label>
            </div>
            <div class="input-field col s12 m6 l6">
                <input id="confirmarSenha" name="confirmarSenha" type="password" class="validate" required/>
                <label for="confirmarSenha">Confirmar Nova Senha</label>
            </div>
        </div>
        <div class="row">
            <input type="submit" class="waves-effect waves-light btn right col s12 m4 l2" value="Salvar" />&nbsp;
            <a class="waves-effect waves-light btn right blue-grey lighten-3 col s12 m4 l2" href="<c:url value="/anunciante/home"/>">Cancelar</a>
        </div>
    </form>
</div>
            
<!-- 
<script>
    var senha = document.getElementById("senha")
    var confirmarSenha = document.getElementById("confirmarSenha");

    function validatePassword() {
        if (senha.value != confirmarSenha.value) {
            confirmarSenha.setCustomValidity("Repita a senha corretamente");
        } else {
            confirmarSenha.setCustomValidity('');
        }
    }
    senha.onchange = validatePassword;
    confirmarSenha.onkeyup = validatePassword;
</script>
-->

<script>
    var senhaatual = document.getElementById("senhaatual");
    var novasenha = document.getElementById("novasenha");
    var confirmarSenha = document.getElementById("confirmarSenha");

    function validatePassword() {
        if (novasenha.value != confirmarSenha.value) {
            confirmarSenha.setCustomValidity("Repita a senha corretamente");
        } else {
            confirmarSenha.setCustomValidity("");
        }

        if (senha != senhaatual.value) {
            senhaatual.setCustomValidity("Senha atual incorreta");
        } else {
            senhaatual.setCustomValidity("");
        }
    }
    novasenha.onchange = validatePassword;
    confirmarSenha.onkeyup = validatePassword;
    senhaatual.onkeyup = validatePassword;
</script>
            
            
<%@ include file="rodape.jsp" %>