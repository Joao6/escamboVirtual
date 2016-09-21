function validarSenha() {
    NovaSenha = document.getElementById('novasenha').value;
    CNovaSenha = document.getElementById('confirmarSenha').value;
    if (NovaSenha !== CNovaSenha) {
        Materialize.toast('As senhas não são iguais!', 4000, 'orange rounded toast');
        $("form #novasenha").css({"border-color": "red"});
        $("form #confirmarSenha").css({"border-color": "red"});
        $("form #btn-salvar").prop("disabled", true);
        $("form #btn-salvar").addClass("grey");
        return false;
    } else {
        Materialize.toast('Senhas iguais!', 4000, 'green rounded toast');
        $("form #novasenha").css({"border-color": "green"});
        $("form #confirmarSenha").css({"border-color": "green"});
        $("form #btn-salvar").prop("disabled", false);
        $("form #btn-salvar").removeClass("grey");
    }
    return true;
}


function buscarSenhaBD() {
    var senha = $('#senhaatual').val();
    if (senha !== null && senha !== undefined) {
        var url = '/web/anunciante/validar-senha';
        $.post(url, {vals: senha}, function (dataReturn) {
            if (dataReturn === true) {
                $("form #senhaatual").css({"border-color": "green"});
                $("form #btn-salvar").prop("disabled", false);
                $("form #btn-salvar").removeClass("grey");
            } else {
                Materialize.toast('Esta senha não corresponde à sua senha atual!', 4000, 'green rounded toast');
                $("form #senhaatual").css({"border-color": "red"});
                $("form #btn-salvar").prop("disabled", true);
                $("form #btn-salvar").addClass("grey");
            }
        });
    }   
}


