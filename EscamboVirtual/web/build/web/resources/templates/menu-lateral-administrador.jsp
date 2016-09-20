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
        <h5>Escambo Virtual</h5>
    </li>
    <center>
        <a href="<c:url value="/anunciante/home"/>"><img class="img circle" src="<c:url value="/resources/img/background1.jpg"/>" height="80" width="80"></a>
        <br/>
        ${anunciante.apelido}
    </center>
    <br/>                
    <li class="no-padding">
        <ul class="collapsible">                       
            <ul class="collapsible">                       
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/administrador/alterar-senha" />"><i class="material-icons">vpn_key</i>Alterar Senha</a>
                </li>
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/administrador/perfil"/>"><i class="material-icons">perm_identity</i>Perfil</a>
                </li>
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/administrador/list"/>"><i class="material-icons">note_add</i>Administradores</a>
                </li>
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/administrador/list/itens"/>"><i class="material-icons">assignment</i>Avaliar Itens</a>
                </li>                        
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="#"/>"><i class="material-icons">assessment</i>Estatísticas</a>
                </li>                        
                <li>
                    <a class="collapsible-header black-text waves-effect waves-color-demo" href="<c:url value="/sair"/>"><i class="material-icons">settings_power</i>Sair</a>
                </li>
            </ul>
        </ul>
    </li>
</ul>


