<%-- 
    Document   : index
    Created on : 18/05/2016, 19:03:58
    Author     : Joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<c:redirect url="/escambo"></c:redirect>--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Escambo Virtual</title>
        <!--Import Google Icon Font-->
        <link href="<c:url value="/resources/css/icon.css"/>" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/materialize.min.css"/>"  media="screen,projection"/>
        <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="<c:url value="/resources/css/styleIndex.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>        
        <link href="<c:url value="/resources/css/ghpages-materialize.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>        
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        <jsp:include page="usuario/login.jsp"></jsp:include>
            <!-- NAVBAR -->
            <div class="navbar-fixed">
                <nav class="" id="navbarTop">
                    <div class="nav-wrapper">
                        <a href="#!" class="brand-logo"></a>
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons white-text">menu</i></a>
                        <ul class="right hide-on-med-and-down">                                                
                            <li><i class="material-icons">perm_identity</i></li>
                            <li><a class='modal-trigger btn blue white-text' href='#modalLogin' style="margin-right: 30px;">Entrar</a></li>                               
                        </ul>                                                
                        <ul class="side-nav" id="mobile-demo">
                            <li><a href="<c:url value="/usuario/login"></c:url>">Entrar</a></li>                        
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- FIM NAVBAR-->

            <!-- PARALLAX -->
            <div class="parallax-container">
                <div class="parallax"><img src="resources/img/teste.png"></div>
                <div class="caption center-align">
                    <div class="row">

                        <div class="row">
                            <h2 class="white-text">Escambo Virtual</h2>
                            <h5 class="light white-text text-lighten-4">ENCONTRE ITENS PARA <strong>TROCA</strong>.</h5> 
                            <form class="col s12" action="item/search">
                                <div id="formPesquisa" class="input-field col s6 black-text"> <!--Consertar -->
                                    <input id="icon_prefix" type="text" name="nomeCriterium" class="validate" placeholder="Pesquise por itens"> 
                                    <!--<a href="<c:url value="/escamboVirtual"/>" class="btn">Search</button></a>-->
                                <button class="btn brown" type="submit">Pesquisar</button>
                            </div>
                        </form>
                    </div>                 
                    <div class="row caption center-align" id="txt-cadastrese">
                        <h6>Ainda não possui conta? <a href="<c:url value="/anunciantes/novo"/>"><strong>Cadastre-se!</strong></a></h6>
                    </div>

                </div>
            </div>            
        </div>
        <!-- FIM PARALLAX -->

        <div id="bodyAnuncios">

            <br/>
            <br/>      
            <div id="listAnuncios" class="container col s12 m6 z-depth-1 painelAnuncios">

                <div class="caption center-align">
                    <div class="row">
                        <h3>Conheça mais sobre o Escambo Virtual</h3>
                    </div>

                    <div class="card-panel">
                        <div class="row">
                            <div class="col s12 l4">
                                <!--<img class="promo" src="images/metaphor.png">-->
                                <i class="material-icons large">perm_identity</i>
                                <h4 class="center">Comece se cadastrando</h4>
                                <p class="light">O primeiro passo é se cadastrar, é partir daí que você poderá utilizar os serviços que o Escambo Virtual lhe oferece. <a href="<c:url value="/anunciantes/novo"/>">Comece já!</a></p>
                                <br>
                            </div>
                            <div class="col s12 l4">
                                <!--<img class="promo" src="images/metaphor.png">-->
                                <i class="material-icons large">business</i>
                                <h4 class="center">Anuncie seus itens</h4>
                                <p class="light">Com o cadastro já realizado e o acesso à área do sistema disponível, você pode começar a anunciar os itens que você deseja trocar, podendo indicar até mesmo alguns interesses que você tem para realizar uma troca!</p>
                                <br>
                            </div>
                            <div class="col s12 l4">
                                <!--<img class="promo" src="images/metaphor.png">-->
                                <i class="material-icons large">trending_up</i>                            
                                <h4 class="center">Receba ofertas pelos seus itens</h4>
                                <p class="light">Com o item anunciado é provável que ele chame a atenção de algum anunciante que poderá fazer ofertas pelo seu item. Logo você receberá essas ofertas, podendo aceitar uma delas e firmar uma troca!</p>
                                <br>
                            </div>
                        </div>
                    </div>

                    <div class="card-panel">
                        <div class="row">
                            <h3>Os desenvolvedores</h3>
                            <br/>
                            <div class="col s12 m3 center-on-small-only">
                                <div class="image-container">
                                    <img class="circle img" src="<c:url value="/resources/img/joao.jpg"/>" width="100" height="100">
                                </div>
                            </div>
                            <div class="col s12 m9">
                                <h4>João Pedro</h4>
                                <p>João Pedro é um estudante de Sistemas de Informação, atualmente no 3° ano pela FAI. Trabalha como desenvolvedor.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12 m3 center-on-small-only">
                                <div class="image-container">
                                    <img class="circle img" src="<c:url value="/resources/img/mauricio.jpg"/>" width="100" height="100">
                                </div>
                            </div>
                            <div class="col s12 m9">
                                <h4>José Mauricio</h4>
                                <p>Mauricio é estudante de Sistemas de Informação, atualmente no 3° ano pela FAI. Trabalha com desenvolvimento de software.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12 m3 center-on-small-only">
                                <div class="image-container">
                                    <img class="circle img" src="<c:url value="/resources/img/pedro.jpg"/>" width="100" height="100">
                                </div>
                            </div>
                            <div class="col s12 m9">
                                <h4>Pedro Arvellos</h4>
                                <p>Pedro é estudante de Sistemas de Informação, atualmente no 3° ano pela FAI. Trabalha como desenvolvedor de software.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- RODAPÉ -->
            <footer class="page-footer blue darken-2">
<!--                <div class="container">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="white-text">Desenvolvedores</h5>
                            <p class="grey-text text-lighten-4">O Escambo Virtual está sendo desenvolvido por uma equipe de três integrantes, sendo todos eles granduandos em Sistemas de Informação.</p>                                        
                        </div>                        
                    </div>
                </div>-->
                <div class="footer-copyright">
                    <div class="container">
                        © 2016 Escambo Virtual. Todos os direitos reservados.                    
                    </div>
                </div>
            </footer>
            <!-- FIM RODAPE -->


            <!--Import jQuery before materialize.js-->
            <script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.1.min.js"/>"></script>
            <script type="text/javascript" src="<c:url value="/resources/js/materialize.min.js"/>"></script>
            <script src="<c:url value="/resources/js/init.js"/>"></script>

            <script>
                $(document).ready(function () {
                    $('.slider').slider({full_width: true});
                });
            </script>

            <script>
                $(document).ready(function () {
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });

                $('.modal-trigger').leanModal({
                    dismissible: false, // Modal can be dismissed by clicking outside of the modal
                    opacity: .5, // Opacity of modal background
                    in_duration: 300, // Transition in duration
                    out_duration: 200, // Transition out duration
                    starting_top: '4%', // Starting top style attribute
                    ending_top: '10%', // Ending top style attribute            
                }
                );




                $('.dropdown-button').dropdown({
                    inDuration: 500,
                    outDuration: 300,
                    constrain_width: false, // Does not change width of dropdown to that of the activator
                    hover: true, // Activate on hover
                    gutter: 15, // Spacing from edge
                    belowOrigin: false, // Displays dropdown below the button
                    alignment: 'left' // Displays dropdown with edge aligned to the left of button           
                }
                );

            </script>
    </body>
</html>
