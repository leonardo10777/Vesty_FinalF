<%@page import="javaBeans.Produtos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vesty Kids - Todos os Produtos</title>
    <link rel="icon" href="img/logovesty.png" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%
        // Verifica se há produtos e redireciona se necessário
        ArrayList<Produtos> produtos = (ArrayList<Produtos>) request.getAttribute("produtos");
        if (produtos == null) {
            response.sendRedirect(request.getContextPath() + "/listarProdutos");
            return;
        }
    %>

    <header>    
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp"><img src="img/logovesty.png" width="125px" alt="Logo Vesty Kids"></a>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="produtos.jsp">Produtos</a></li>
                        <li><a href="contato.html">Contato</a></li>
                        <li><a href="conta.html">Conta</a></li>
                    </ul>
                </nav>
                <a href="carrinho.jsp"><img src="img/cart.png" width="30px" height="30px" alt="Carrinho"></a>
            </div>
        </div>
    </header>

    <!------- Categorias ------>
    <div class="categorias">
        <div class="container-2">
            <h2 class="titulo">Categorias</h2>
            <div class="row">
                <div class="col-3">
                    <img src="img/camisa_1.jpg" alt="Conjunto masculino">
                    <h4>Conjunto masculino</h4>
                </div>
                <div class="col-3">
                    <img src="img/camisa_2.jpg" alt="Conjunto feminino">
                    <h4>Conjunto feminino</h4>
                </div>
                <div class="col-3">
                    <img src="img/pijama1.jpg" alt="Pijamas">
                    <h4>Pijamas</h4>
                </div>
            </div>
        </div>
    </div>

    <!------- Todos os produtos ------>
    <div class="container-2">
        <div class="row row-2">
            <h2>Todos os Produtos</h2>
            <select>
                <option>Classificação Padrão</option>
                <option>Relevância</option>
                <option>Popularidade</option>
                <option>Novidade</option>
                <option>Preço</option>
            </select>
        </div>
        
        <div class="row">
            <%
                if (!produtos.isEmpty()) {
                    for (Produtos produto : produtos) {
            %>
           
                <div class="col-4">
    <a href="paginaproduto.jsp?id=<%= produto.getPkProd() %>">
        <% if (produto.getImagemBase64() != null && !produto.getImagemBase64().isEmpty()) { %>
            <img src="data:image/jpeg;base64,<%= produto.getImagemBase64() %>" 
                 alt="<%= produto.getNome() %>" 
                 style="max-width: 200px; height: auto;">
        <% } else { %>
            <img src="img/no-image.jpg" 
                 alt="Imagem não disponível" 
                 style="max-width: 200px; height: auto;">
        <% } %>
    </a>
    <h4><%= produto.getNome() %></h4>
    <p>R$ <%= String.format("%.2f", produto.getValor()) %></p>
    <form action="AdicionarCarrinho" method="post">
        <input type="hidden" name="id" value="<%= produto.getPkProd() %>">
        <input type="hidden" name="nome" value="<%= produto.getNome() %>">
        <input type="hidden" name="valor" value="<%= produto.getValor() %>">
        <button type="submit" class="btn">Adicionar ao Carrinho</button>
    </form>
</div>

            <%
                    }
                } else {
            %>
            <div class="col-12">
                <p>Nenhum produto disponível no momento.</p>
            </div>
            <%
                }
            %>
        </div>

        <div class="pagina-btn">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span>&#8594;</span>
            <button onclick="window.location.href='javaJSP/produtosForm.jsp'" class="btn">Cadastrar</button>
        </div>
    </div>

    <!-----Footer---->
    <footer>
        <div class="container">
            <div class="row">
                <div class="footer-logo">
                    <img src="img/logovesty.png" alt="Logo Vesty Kids">
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
</body>
</html>