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


