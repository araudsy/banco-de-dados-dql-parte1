-- Questão 01
SELECT COUNT(*) AS total_sem_cliente
FROM fato_vendas
WHERE id_cliente IS NULL;

-- Questão 02
SELECT COUNT(DISTINCT id_cliente) AS total_clientes_unicos
FROM fato_vendas;

-- Questão 03
SELECT SUM(valor_total) AS faturamento_total_2025
FROM fato_vendas
WHERE EXTRACT(YEAR FROM data_venda) = 2025;

-- Questão 04
SELECT DISTINCT marca
FROM dim_produto
WHERE categoria = 'Higiene'
ORDER BY marca ASC;

-- Questão 05
SELECT AVG(valor_total) AS media_valor_total
FROM fato_vendas
WHERE canal = 'Aplicativo';

-- Questão 06
SELECT COUNT(*) AS total_produtos
FROM dim_produto
WHERE categoria = 'Bebidas' AND preco_tabela > 10.00;

-- Questão 07
SELECT nome_produto, marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto ASC
LIMIT 1;

-- Questão 08
SELECT categoria, COUNT(*) AS total_produtos
FROM dim_produto
GROUP BY categoria
ORDER BY total_produtos DESC, categoria ASC;

-- Questão 09
SELECT categoria, AVG(preco_tabela) AS preco_medio
FROM dim_produto
GROUP BY categoria
ORDER BY preco_medio DESC;

-- Questão 10
SELECT cidade, COUNT(*) AS total_clientes
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(*) >= 60
ORDER BY total_clientes DESC, cidade ASC;

-- Questão 11
SELECT COUNT(*) AS sem_email
FROM dim_cliente
WHERE email IS NULL OR email = '';

-- Questão 12
SELECT COUNT(*) AS total_clientes
FROM dim_cliente
WHERE sexo = 'F' 
  AND data_nascimento BETWEEN '1990-01-01' AND '1999-12-31';
  
-- Questão 13
SELECT COUNT(*) AS total_anas
FROM dim_cliente
WHERE nome LIKE 'Ana %' OR nome = 'Ana';

-- Questão 14
SELECT uf, COUNT(*) AS total_lojas
FROM dim_loja
GROUP BY uf
HAVING COUNT(*) > 3
ORDER BY total_lojas DESC;

-- Questão 15
SELECT nome_loja, cidade, data_inauguracao
FROM dim_loja
WHERE data_inauguracao < '2007-01-01'
ORDER BY data_inauguracao ASC;

-- Questão 16
SELECT canal, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE EXTRACT(YEAR FROM data_venda) = 2025
GROUP BY canal
ORDER BY faturamento DESC;

-- Questão 17
SELECT forma_pagamento, COUNT(*) AS qtd_linhas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC;

-- Questão 18
SELECT id_produto, SUM(quantidade) AS total_unidades
FROM fato_vendas
GROUP BY id_produto
ORDER BY total_unidades DESC, id_produto ASC
LIMIT 10;

-- Questão 19
SELECT id_loja, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE EXTRACT(YEAR FROM data_venda) = 2024
GROUP BY id_loja
ORDER BY faturamento DESC
LIMIT 5;

-- Questão 20
SELECT id_loja, COUNT(*) AS total_linhas
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(*) > 300
ORDER BY total_linhas DESC;

-- Questão 21
SELECT id_cliente, COUNT(*) AS total_linhas
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*) >= 70
ORDER BY total_linhas DESC, id_cliente ASC;

-- Questão 22
SELECT COUNT(*) AS qtd_vendas_com_desconto, 
       ROUND(CAST(AVG(desconto) AS NUMERIC), 2) AS valor_medio_desconto
FROM fato_vendas
WHERE desconto > 0;

-- Questão 23
SELECT MIN(valor_total) AS menor_valor, 
       MAX(valor_total) AS maior_valor
FROM fato_vendas
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31';

-- Questão 24
SELECT COUNT(*) AS total_linhas, 
       SUM(valor_total) AS faturamento_total
FROM fato_vendas
WHERE data_venda = '2025-12-24';

-- Questão 25
SELECT id_venda, 
       (quantidade * preco_unitario) AS valor_bruto, 
       desconto, 
       valor_total, 
       (desconto / (quantidade * preco_unitario)) * 100 AS percentual_desconto
FROM fato_vendas
WHERE canal = 'Site' 
  AND EXTRACT(YEAR FROM data_venda) = 2025 
  AND desconto > 0
ORDER BY percentual_desconto DESC, id_venda ASC
LIMIT 10;