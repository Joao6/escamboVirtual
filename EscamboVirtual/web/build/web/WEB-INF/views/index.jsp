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
                <div class="parallax"><img src="resources/img/Slide-12.png"></div>
                <div class="caption center-align">
                    <div class="row">

                        <div class="row">
                            <h2 class="white-text">Escambo Virtual</h2>
                            <h5 class="light white-text text-lighten-4">ENCONTRE ITENS PARA <strong>TROCA</strong>.</h5> 
                            <form class="col s12" action="item/search">
                                <div id="formPesquisa" class="input-field col s6 black-text"> <!--Consertar -->
                                    <input id="icon_prefix" type="text" name="nomeCriterium" class="validate" placeholder="Pesquise por itens"> 
                                    <!--<a href="<c:url value="/escamboVirtual"/>" class="btn">Search</button></a>-->
                                    <button class="btn brown" type="submit">Search</button>
                                </div>
                            </form>
                        </div>                 
                    <div class="row caption center-align" id="txt-cadastrese">
                        <h6>Ainda não possui conta? <a href="anunciantes/novo"><strong>Cadastre-se!</strong></a></h6>
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
                        <h4>Veja alguns exemplos de nossos anúncios:</h4>
                    </div>

                </div>
                <br/>
                <br/>

                <!-- INICIO CARDS DOS ANUNCIOS PRIMEIRA LINHA-->
                <ul>
                    <div class="row">
                        <c:forEach items="${itemList}" var="item">
                            <li>                            
                                <div class="col s12 m4">
                                    <div class="card medium">
                                        <div class="card-image">
                                            <img src="resources/img/background2.jpg">                                        
                                        </div>
                                        <div class="card-content">
                                            <div class="card-title">
                                                <span>${item.nome}</span>
                                            </div>
                                            <table>
                                                <thead>
                                                <th>Interesses</th>                                                
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>${item.interesse1}</td>     
                                                        <td>${item.interesse1}</td>
                                                        <td${item.interesse1}</td>
                                                    </tr>                    

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>                            
                            </li>
                        </c:forEach>

                        <li>
                            <div class="col s12 m4">
                                <div class="card medium">
                                    <div class="card-image">
                                        <img src="resources/img/background2.jpg">
                                        <span class="card-title">Card Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p>I am a very simple card. I am good at containing small bits of information.
                                            I am convenient because I require little markup to use effectively.</p>
                                    </div>                                    
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="col s12 m4">
                                <div class="card medium">
                                    <div class="card-image">
                                        <img src="resources/img/background2.jpg">
                                        <span class="card-title">Card Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p>I am a very simple card. I am good at containing small bits of information.
                                            I am convenient because I require little markup to use effectively.</p>
                                    </div>                                    
                                </div>
                            </div> 
                        </li>
                    </div>
                    <!-- FIM CARDS DOS ANUNCIOS PRIMEIRA LINHA-->

                    <!-- INICIO CARDS DOS ANUNCIOS SEGUNDA LINHA-->
                    <div class="row">
                        <li>
                            <div class="col s12 m4">
                                <div class="card medium">
                                    <div class="card-image">
                                        <img src="resources/img/background2.jpg">
                                        <span class="card-title">Card Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p>I am a very simple card. I am good at containing small bits of information.
                                            I am convenient because I require little markup to use effectively.</p>
                                    </div>                                    
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="col s12 m4">
                                <div class="card medium">
                                    <div class="card-image">
                                        <img src="resources/img/background2.jpg">
                                        <span class="card-title">Card Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p>I am a very simple card. I am good at containing small bits of information.
                                            I am convenient because I require little markup to use effectively.</p>
                                    </div>                                    
                                </div>
                            </div> 
                        </li>

                        <li>
                            <div class="col s12 m4">
                                <div class="card medium">
                                    <div class="card-image">
                                        <img src="resources/img/background2.jpg">
                                        <span class="card-title">Card Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p>I am a very simple card. I am good at containing small bits of information.
                                            I am convenient because I require little markup to use effectively.</p>
                                    </div>                                    
                                </div>
                            </div>
                        </li>
                    </div>
                </ul>
            </div>
        </div>
    </div>
    <!-- FIM CARDS DOS ANUNCIOS SEGUNDA LINHA-->

    <!-- RODAPÉ -->
    <footer class="page-footer blue darken-2">
        <div class="container">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="white-text">O Escambo Virtual</h5>
                    <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                </div>
                <div class="col l4 offset-l2 s12">
                    <h5 class="white-text">Links</h5>
                    <ul>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
                    </ul>
                </div>
            </div>
        </div>
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
