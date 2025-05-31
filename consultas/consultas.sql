-- CONSULTAS

-- a. Dados completos de pessoas físicas.
SELECT * FROM pessoa_fisica

-- b. Dados completos de pessoas jurídicas. 
SELECT * FROM pessoa_juridica

-- c. Movimentações de entrada, com produto, fornecedor, quantidade, preço unitário e valor total.
SELECT *, (quantidade * valorUnitario) AS valorTotal 
FROM movimento
WHERE tipo = 'E'

-- d. Movimentações de saída, com produto, comprador, quantidade, preço unitário e valor total.
SELECT *, (quantidade * valorUnitario) AS valorTotal 
FROM movimento
WHERE tipo = 'S'

-- Valor total das entradas agrupadas por produto.
SELECT idProduto, SUM (quantidade * valorUnitario) AS valorTotal 
FROM movimento 
WHERE tipo = 'E'
GROUP BY idProduto

-- Valor total das saídas agrupadas por produto.
SELECT idProduto, SUM (quantidade * valorUnitario) AS valorTotal 
FROM movimento 
WHERE tipo = 'S'
GROUP BY idProduto

-- Operadores que não efetuaram movimentações de entrada (compra).
SELECT idUsuario 
FROM usuario u
WHERE NOT EXISTS (
	SELECT 1
	FROM movimento m
	WHERE m.idUsuario = u.idUsuario
		AND tipo = 'E'
)

-- Valor total de entrada, agrupado por operador.
SELECT idUsuario, 
SUM (quantidade * valorUnitario) AS valorTotal
FROM movimento 
WHERE tipo = 'E'
GROUP BY idUsuario

-- Valor total de saída, agrupado por operador.
SELECT idUsuario, 
SUM (quantidade * valorUnitario) AS valorTotal
FROM movimento 
WHERE tipo = 'S'
GROUP BY idUsuario

-- Valor médio de venda por produto, utilizando média ponderada.
SELECT p.nome AS nome_produto,
    CAST(SUM(m.valorUnitario * m.quantidade) AS DECIMAL(10,2)) /
    NULLIF(SUM(m.quantidade), 0) AS preco_medio_ponderado
FROM movimento m
JOIN produto p ON m.idProduto = p.idProduto
WHERE m.tipo = 'E'
GROUP BY p.nome;