<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="light-blue darken-3">
    <div class="container">
        <div class="nav-wrapper center-align"><a class="page-title" style="font-size: 18pt;">Escambo Virtual</a></div>
    </div>
</nav>
<div class="container">
    <a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only ">
        <i class="material-icons">menu</i>
    </a>
</div> 
<ul id="nav-mobile" class="side-nav fixed collapsible grey lighten-4" style="transform: translateX(0%);"> 
    <div class="row" style="margin-top: 15%;">
        <center>
            <c:if test="${not empty administrador.imagem}">                
                <a href="<c:url value="/administrador/home"/>"><img class="img circle" src="<c:url value="/usuario/${administrador.id}/img.jpg"/>" height="100" width="100"></a>                        
            </c:if>
            <c:if test="${empty administrador.imagem}">
                <c:if test="${administrador.sexo == 'Masculino'}">                
                    <a href="<c:url value="/administrador/home"/>"><img class="img circle" src="<c:url value="/resources/img/default-avatar_man.png"/>" height="100" width="100"></a>                        
                </c:if>
                <c:if test="${administrador.sexo == 'Feminino'}">                
                    <a href="<c:url value="/administrador/home"/>"><img class="img circle" src="<c:url value="/resources/img/default-avatar_women.png"/>" height="100" width="100"></a>                        
                </c:if>
            </c:if>
            <br/>
            <br/> 
            <strong>Olá, ${administrador.apelido}!</strong>
        </center>
    </div>
    <br/>   
    <div class="divider"></div>
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


