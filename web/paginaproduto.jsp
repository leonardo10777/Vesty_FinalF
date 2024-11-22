<%@page import="javaBeans.Produtos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vesty Kids - Página de Produto</title>
    <link rel="icon" href="img/logovesty.png" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
</head>


<body>
     <%
        ArrayList<Produtos> produtos = new ArrayList<>();
    // Adicione objetos Produtos à lista
    request.setAttribute("produtos", produtos);
    request.getRequestDispatcher("produtos.jsp").forward(request, response);
      
    %>
    <header>
      
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.html"><img src="img/logovesty.png" width="125px"></a>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="produtos.jsp">Produtos</a></li>
                        <li><a href="contato.html">Contato</a></li>
                        <li><a href="conta.html">Conta</a></li>
                    </ul>
                </nav>
                <a href="carrinho.html"><img src="img/cart.png" width="30px" height="30px"></a>
            </div>
        </div>
    </header>

    <!------- Detalhes do produto ------>
    <div class="container-2 produto">
        <div class="row">
              <%
                if (!produtos.isEmpty()) {
                    for (Produtos produto : produtos) {
            %>
            <div class="col-2">
              
            
               
                <div class="small-img-row">
                    <div class="small-img-col">
                        <img src="img/foto_p1.png" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="img/foto_p1.1.png" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="img/foto_p1.png" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="img/foto_p1.1.png" width="100%" class="small-img">
                    </div>
                </div>
                <!------Titulo------>
                <div class="container-2">
                    <div class="row row-2">
                        <h2>Produtos Relacionados</h2>
                        <p><a href="produtos.html">Veja Mais</a></p>
                    </div>
                </div>

                <!------Produto------>
            </div>
            <div class="col-2">
                <p>Home / Conjunto Barbie</p>
                <h1><%= produto.getNome() %></h1>
                <h4></h4>
                <select>
                    <option>Selecione o Tamanho</option>
                    <option>De 0 a 3 anos</option>
                    <option>De 4 a 6 anos</option>
                    <option>De 7 a 10 anos</option>
                    <option>De 11 a 14 anos</option>
                </select>
                <input type="number" value="1">
                <input type="hidden" name = oper >
                <input value="Adicione ao carrinho" class="btn" name="envia" onclick = "window.location.assign('carrinho.jsp');">

                <h4>Detalhes do Produto</h4>
                <br>
                <p class="produto-p">Conjunto infantil da Barbie, composto por blusa e calça de moletom felpudo rosa. A blusa tem o
                    logotipo da Barbie brilhante no centro, e a calça, também com o logotipo, oferece conforto e estilo.
                    Ideal para dias frios, combinando diversão e maciez..</p>
            </div>
        </div>
    </div>



    <!------- Todos os produtos ------>
    <div class="container-2">
        <div class="row">
            <div class="col-4">
                <a href="paginaproduto.html"><img src="img/foto_p1.png"></a>
                <h4>Conjunto Barbie</h4>
                <p>R$80,00</p>
            </div>
            <div class="col-4">
                <img src="img/foto2.png">
                <h4>Fantasia Mulher Maravilha</h4>
                <p>R$60,00</p>
            </div>
            <div class="col-4">
                <img src="img/foto1.png">
                <h4>Fantasia Homem-Aranha</h4>
                <p>R$50,00</p>
            </div>
            <div class="col-4">
                <img src="img/foto_6.png">
                <h4>Conjunto Barbie c/Bolsa</h4>
                <p>R$100,00</p>
            </div>
        </div>
    </div>
    <!-----Footer---->
    <footer>
        <div class="container">
            <div class="row">
                <div class="footer-logo">
                    <img src="img/logovesty.png">
                    <p>Direitos Reservados para Vesty kids.</p>
                </div>
                <div class="footer-links">
                    <h3>Horário de Atendimento</h3>
                    <ul>
                        <li>Rua Pedro Escobar, 238</li>
                        <li>Seg a Sab 09:00h - 20:00h</li>
                        <li>Dom 09:00h - 15:00h</li>
                    </ul>
                </div>
                <div class="footer-redes">
                    <h3>Redes Sociais</h3>
                    <ul>
                        <li><a href="https://www.facebook.com/profile.php?id=61567710053624">Facebook</a></li>
                        <li><a href="https://www.instagram.com/lojavestykids/">Instagram</a></li>
                    </ul>
                </div>
            </div>
            <hr>
            <p class="Copyright">Copyright 2024 Vesty-Kids</p>
        </div>
    </footer>


    <!-------- js  produto galeria------->
    <script src="js/efeito.js"> </script>

</body>

</html>