<%@page import="java.util.ArrayList"%>
<%@page import="javaBeans.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Carrinho</title>
    <title> Vesty-Kids - Página de Carrinho</title>
    <link rel="icon" href="img/logovesty.png" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <header>    
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.html"><img src="img/logovesty.png" width="125px"></a>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="produtos.html">Produtos</a></li>
                        <li><a href="contato.html">Contato</a></li>
                        <li><a href="conta.html">Conta</a></li>
                    </ul>
                </nav>
                <a href="carrinho.html"><img src="img/cart.png" width="30px" height="30px"></a>
            </div>
        </div>
    </header>

    <!-- Itens do Carrinho -->
    <div class="container-2 carrinho-pagina">
        <h1>Seu Carrinho</h1>
        <%
            ArrayList<Produtos> carrinho = (ArrayList<Produtos>) session.getAttribute("carrinho");
            if (carrinho != null && !carrinho.isEmpty()) {
                double total = 0.0; // Inicializa a variável para armazenar o total
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Produtos produto : carrinho) {
                        total += produto.getValor(); // Soma o valor do produto ao total
                %>
                <tr>
                    <td><%= produto.getNome() %></td>
                    <td>1</td> <!-- Substitua por lógica dinâmica se necessário -->
                    <td>R$ <%= String.format("%.2f", produto.getValor()) %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2"><strong>Total</strong></td>
                    <td><strong>R$ <%= String.format("%.2f", total) %></strong></td>
                </tr>
            </tfoot>
        </table>
        <%
            } else {
        %>
        <p>Seu carrinho está vazio.</p>
        <%
            }
        %>

        <button class="Comprar" id="abrir-dialogo">Comprar</button>
    
         <dialog>

        <form id="form-compra">
        <div class="caixa-compra">
        <h1>Digite suas informações para realizar a compra</h1>
        <label>CPF</label>
        <input type="text" required maxlength="12">
        <br>
        <label for="cep" >CEP</label>
        <input type="text" id="cep" name="cep" required maxlength="8">
        <br>
        <labeL for="rua">Rua</labeL>
        <input type="text" id="txtRua" name="txtRua" readonly>
        <br>
        <labeL for="bairro">Bairro</labeL>
        <input type="text" id="txtBairro" name="txtBairro" readonly>
        <br>
        <labeL for="Cidade">Cidade</labeL>
        <input type="text" id="txtCidade" name="txtCidade" readonly>
        <br>
        <labeL for="Estado">Estado</labeL>
        <input type="text" id="txtEstado" name="txtEstado" readonly>
        
        <button class="btn" type="submit" >Enviar</button>
        </div>

        </form>
    </dialog>

    </div>


</div>
     <!-- Footer -->
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

<script src="js/modal.js"></script>
<script src="js/endereco.js"></script>

</body>
</html>