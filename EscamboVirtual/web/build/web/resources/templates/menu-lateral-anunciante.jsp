<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="top-nav light-blue darken-3">
    <div class="container">
        <div class="nav-wrapper center-align"><a class="page-title">Escambo Virtual</a></div>
    </div>
</nav>
<div class="container">
    <a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only ">
        <i class="material-icons">menu</i>
    </a>
</div> 
<ul id="nav-mobile" class="side-nav fixed collapsible grey lighten-4" style="transform: translateX(0%);">
    <li class="logo" >
        <!--<a href="escambovirtual"><img src="resources/img/LogoDiferenciada.png" height="60" width="60"></a>-->
        <!--<h5>Escambo Virtual</h5>-->
    </li>
    <center>
        <a href="<c:url value="/anunciante/home"/>"><img class="img circle" src="<c:url value="/usuario/${anunciante.id}/img.jpg"/>" height="90" width="90"></a>
        <br/>
        ${anunciante.apelido}
    </center>
    <br/>                
    <li class="no-padding">
        <ul class="collapsible">                       
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/anunciante/alterarsenha" />"><i class="material-icons">vpn_key</i>Alterar Senha</a>
            </li>
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/anunciante/perfil"/>"><i class="material-icons">perm_identity</i>Perfil</a>
            </li>            
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/anunciante/item"/>"><i class="material-icons">perm_media</i>Meus Itens</a>
            </li>
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/anunciante/pesquisar/item"/>"><i class="material-icons">search</i>Pesquisar</a>
            </li>
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="#"/>"><i class="material-icons">chat</i>Conversas</a>
            </li>  
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/anunciante/oferta/list"/>"><i class="material-icons">call_received</i>Ofertas Recebidas</a>
            </li>                                   
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="#"/>"><i class="material-icons">import_export</i>Trocas Realizadas</a>
            </li>
            <li>
                <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/sair"/>"><i class="material-icons">settings_power</i>Sair</a>
            </li>
        </ul>
    </li>
</ul>


