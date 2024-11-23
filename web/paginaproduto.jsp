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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
   <%
    // Obtendo o produto passado pelo servlet
    Produtos produto = (Produtos) request.getAttribute("produto");
    
    // Log para debug
    System.out.println("Produto na JSP: " + (produto != null ? produto.getNome() : "null"));
    
    if (produto == null) {
        response.sendRedirect("produtos.jsp");
        return;
    }
    
    // Verificação adicional dos campos principais
    if (produto.getNome() == null || produto.getValor() == 0) {
        response.sendRedirect("produtos.jsp");
        return;
    }
%>
   
    <header>
        <!-- Cabeçalho -->
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

    <!-- Detalhes do Produto -->
    <div class="container-2 produto">
        <div class="row">
            <div class="col-2">
                <% if (produto.getImagemBase64() != null && !produto.getImagemBase64().isEmpty()) { %>
                    <img src="data:image/jpeg;base64,<%= produto.getImagemBase64() %>" 
                         alt="<%= produto.getNome() %>" 
                         style="width: 100%;">
                <% } else { %>
                    <img src="img/no-image.jpg" 
                         alt="Imagem não disponível" 
                         style="width: 100%;">
                <% } %>
            </div>
            <div class="col-2">
                <p>Home / <%= produto.getNome() %></p>
                <h1><%= produto.getNome() %></h1>
                <h4>R$ <%= String.format("%.2f", produto.getValor()) %></h4>
                <select>
                    <option>Selecione o Tamanho</option>
                    <option>De 0 a 3 anos</option>
                    <option>De 4 a 6 anos</option>
                    <option>De 7 a 10 anos</option>
                    <option>De 11 a 14 anos</option>
                </select>
                <input type="number" value="1" min="1">
                <form action="AdicionarCarrinho" method="post">
                    <input type="hidden" name="id" value="<%= produto.getPkProd() %>">
                    <button type="submit" class="btn">Adicionar ao Carrinho</button>
                </form>
                <h4>Detalhes do Produto</h4>
                <p class="produto-p"><%= produto.getDescricao() %></p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>Direitos Reservados para Vesty Kids.</p>
        </div>
    </footer>
</body>
</html>