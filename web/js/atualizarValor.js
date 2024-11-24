 // Atualiza o subtotal e o total geral
        function atualizarSubtotal(input) {
            const preco = parseFloat(input.getAttribute("data-preco"));
            const quantidade = parseInt(input.value);
            const subtotal = preco * quantidade;

            // Atualiza o subtotal da linha
            const subtotalCell = input.parentNode.nextElementSibling;
            subtotalCell.textContent = `R$ ${subtotal.toFixed(2)}`;

            // Atualiza o total geral
            atualizarTotalGeral();
        }

        function atualizarTotalGeral() {
            const subtotais = document.querySelectorAll(".subtotal");
            let totalGeral = 0;

            subtotais.forEach(subtotalCell => {
                const valor = parseFloat(subtotalCell.textContent.replace("R$", "").trim());
                totalGeral += valor;
            });

            document.getElementById("total-geral").textContent = `R$ ${totalGeral.toFixed(2)}`;
        }