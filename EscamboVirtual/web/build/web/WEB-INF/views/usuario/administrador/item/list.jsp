<%@ include file="../home.jsp" %>
<div class="row" >
    <div class="container">
        <nav class="grey darken-3 card-panel col s12 z-depth-2">
            <div class="nav-wrapper">
                <div class="col s12">
                    <a href="/web/administrador/home" class="breadcrumb">Home</a>
                    <a href="#!" class="breadcrumb">Avaliar Itens </a>
                </div>
            </div>
        </nav>
        
        <c:if test="${empty itemList}">
            <div class="card-panel col s12 z-depth-2 grey darken-3">
                <div class="card-content">
                    <div class="card-panel">
                        <div class="card-content">
                            <div class="card-title">
                                <span style="font-size: 16pt;"><i class="material-icons small">thumb_up</i>
                                    <strong>Não existem itens em status de avaliação no momento!</strong></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <table>
            <tbody>
                <c:forEach items="${itemList}" var="item">
                    <tr>
                        <td>
                            <c:if test="${item.status == 'Em Avaliação'}">
                                <div class="card-panel col s12 z-depth-2">
                                    <form method="post" action="/web/administrador/item/${item.id}/edit">
                                        <table class="bordered">
                                            <tr>                                               
                                                <td  colspan="4">
                                                    <div class="card-title">                        
                                                        <h5>${item.nome}</h5>
                                                        <div class="form divider"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"><b>ID Item: &nbsp;</b>${item.id}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4"><img class="card-panel z-depth-2" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200"></td>
                                            </tr>
                                            <tr>
                                                <td><b>ID Usuario: &nbsp;</b>${item.anunciante.id}</td>
                                                <td><b>Interesse 1: &nbsp;</b>${item.interesse1}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Data de Aquisição: &nbsp;</b>${item.dataAquisicao}</td>
                                                <td><b>Interesse 2: &nbsp;</b>${item.interesse2}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Status: &nbsp;</b>${item.status}</td>
                                                <td></td>
                                                <td><b>Interesse 3: &nbsp;</b>${item.interesse3}</td>
                                            </tr>
                                            <tr>
                                                <td><b>Descrição: </b></td>
                                                <td colspan="3">${item.descricao}</td> 
                                            </tr>
                                            <!--
                                                <tr>
                                                    <td><b>ID Item: &nbsp;</b>${item.id}</td>     
                                                </tr>
                                            -->
                                            <tr>
                                                <td><b>Status</b></td>
                                                <td>
                                                    <select name="status">
                                                        <option value="${item.status}">${item.status}</option>
                                                        <option value="Publicar">Publicar</option>
                                                        <option value="Calcelar Publicação">Calcelar Publicação</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="right-align">
                                                    <!--<input type="submit" class="waves-effect waves-light btn right" value="Salvar" />-->
                                                    <button class="waves-effect waves-light btn right">Salvar</button>
    <!--                                                                <a class="waves-effect waves-light btn right-align" href="<c:url value="/administrador/item/${item.id}/edit"/>">Salvar</a>-->
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>                
            </tbody>
        </table>
    </div>
    <%@ include file="../rodape.jsp" %>