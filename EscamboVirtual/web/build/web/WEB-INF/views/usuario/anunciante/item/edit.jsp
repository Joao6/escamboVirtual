<%@ include file="../home.jsp" %>
<div class="row" style="padding-left:15%;padding-right: 15%;">
    <nav class="grey darken-3 card-panel col s12 z-depth-2">
        <div class="nav-wrapper">
            <div class="col s12">
                <a href="/web/anunciante/home" class="breadcrumb">Home</a>
                <a href="/web/anunciante/item" class="breadcrumb">Meus Itens</a>
                <a href="#!" class="breadcrumb">Editar</a>
            </div>
        </div>
    </nav>
</div>
<div class="row" style="padding-left:15%;padding-right: 15%;">
    <form method="post" class="card-panel col s12 z-depth-2">
        <div class="card-title">                        
            <h5>Edição de Item</h5>
            <div class="form divider"></div>
        </div>
        <div class="row">
            <div class="input-field col s8">
                <input id="nome" name="nome" type="text" class="validate" value="${item.nome}"/>
                <label for="nome">Nome</label>
            </div>
            <div class="input-field col s4">
                <input id="dataAquisicao" name="dataAquisicao" type="text" class="validate" value="${item.dataAquisicao}" onkeypress="mascaraData(this, '##/##/####')" maxlength="10"/>
                <label for="dataAquisicao">Data de aquisição</label>
            </div>                          

        </div>
        <div class="row">
            <div class="input-field col s4">
                <input id="interesse1" name="interesse1" type="text" value="${item.interesse1}" class="validate"/>
                <label for="interesse1">Interesse 1</label>
            </div>    
            <div class="input-field col s4">
                <input id="interesse2" name="interesse2" type="text" value="${item.interesse2}" class="validate" />
                <label for="interesse2">Interesse 2</label>
            </div>
            <div class="input-field col s4">
                <input id="interesse3" name="interesse3" type="text" value="${item.interesse3}" class="validate"/>
                <label for="interesse3">Interesse 3</label>
            </div>                         
        </div>
        <table>
            <tr>
                <th class="center-align green lighten-3 z-depth-2">Principal</th>
                <th class="center-align green lighten-5">imagem 1</th>
                <th class="center-align green lighten-5">imagem 2</th>
                <th class="center-align green lighten-5">imagem 3</th>
                <th class="center-align green lighten-5">imagem 4</th>
            </tr>
            <tr>
                <td>
                    <img class="card-panel col s12 z-depth-2" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                </td>
                <td>
                    <img class="card-panel col s12" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                </td>
                <td>
                    <img class="card-panel col s12" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                </td>
                <td>
                    <img class="card-panel col s12" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                </td>
                <td>
                    <img class="card-panel col s12" style="margin: 1%;" src="<c:url value="/resources/img/sample-1.jpg"/>" height="200" width="200">    
                </td>
            </tr>
        </table>
        <div class="row">
            <!--                        <div class="file-field input-field">
                                        <div class="btn">
                                            <span>Adicionar imagens</span>
                                            <input type="file" multiple>
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text" placeholder="Upload one or more files">
                                        </div>
                                    </div>-->
        </div>
        <div class="row">
            <div class="input-field col s12">
                <textarea id="textarea1" class="materialize-textarea" name="descricao" length="1400">${item.descricao}</textarea>
                <label for="textarea1">Descrição</label>
            </div>
        </div>
        <div class="row">
            <input type="submit" class="waves-effect waves-light btn right" value="Salvar" />
            <a class="waves-effect waves-light btn right blue-grey lighten-3" href="<c:url value="/anunciante/item"/>">Cancelar</a>
        </div> 
    </form>
</div>

<script>
    function mascaraData(t, mask) {
        var i = t.value.length;
        var saida = mask.substring(1, 0);
        var texto = mask.substring(i)
        if (texto.substring(0, 1) != saida) {
            t.value += texto.substring(0, 1);
        }
    }
</script>

<%@ include file="../rodape.jsp" %>
