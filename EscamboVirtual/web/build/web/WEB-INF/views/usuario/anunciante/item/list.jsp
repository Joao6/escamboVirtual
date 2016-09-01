<%@ include file="../home.jsp" %>
<div class="row" style="padding-left:15%;padding-right: 15%;">
    <nav class="grey darken-3 card-panel col s12 z-depth-2">
        <div class="nav-wrapper">
            <div class="col s12">
                <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                <a href="#!" class="breadcrumb">Meus Itens</a>
            </div>
        </div>
    </nav>
    <div class="card-panel col s12 m12 l12">
        <div class="right-align">
            <a class="waves-effect waves-light btn " href="<c:url value="/anunciante/item/new"/>">Cadastrar item</a>
        </div>
        <table>
            <tbody>
                <c:forEach items="${itemList}" var="item">
                    <tr>
                        <td>
                            <div class="card-panel col s12 m12 l12 z-depth-2">

                                <table class="bordered">
                                    <tr>                                               
                                        <td colspan="2">
                                            <div class="card-title">                        
                                                <h5>${item.nome}</h5>
                                                <div class="form divider"></div>
                                            </div>
                                        </td>
                                        <td class="right-align">
                                            <a class="waves-effect waves-light btn" href="<c:url value="/anunciante/item/${item.id}/edit"/>">Editar</a>
                                        </td>
                                        <td class="right-align">
                                            <a class="waves-effect waves-light btn red" href="<c:url value="/anunciante/item/${item.id}/del"/>">Apagar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>ID Item: &nbsp;</b>${item.id}</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>
                                    </tr>
                                    <tr>
                                        <td><b>ID Usuario: &nbsp;</b>${item.anunciante.nome}</td>
                                        <td><b>Interesse 1: &nbsp;</b>${item.interesse1}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Data de Aquisição: &nbsp;</b>${item.dataAquisicao}</td>
                                        <td><b>Interesse 2: &nbsp;</b>${item.interesse2}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Status: &nbsp;</b>${item.status}</td>
                                        <td><b>Interesse 3: &nbsp;</b>${item.interesse3}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Descrição: </b></td>
                                        <td colspan="3">${item.descricao}</td> 
                                    </tr>
                                    <!--                                                <tr>
                                                                                        <td><b>ID Item: &nbsp;</b>${item.id}</td>
                                                                                    </tr>-->
                                </table>

                            </div>
                        </td>
                    </tr>
                </c:forEach>                
            </tbody>
        </table>
    </div>

</div>
<%@ include file="../rodape.jsp" %>
