-- CONSULTAS

-- a. Dados completos de pessoas f�sicas.
SELECT * FROM pessoa_fisica

-- b. Dados completos de pessoas jur�dicas. 
SELECT * FROM pessoa_juridica

-- c. Movimenta��es de entrada, com produto, fornecedor, quantidade, pre�o unit�rio e valor total.
SELECT *, (quantidade * valorUnitario) AS valorTotal 
FROM movimento
WHERE tipo = 'E'

-- d. Movimenta��es de sa�da, com produto, comprador, quantidade, pre�o unit�rio e valor total.
SELECT *, (quantidade * valorUnitario) AS valorTotal 
FROM movimento
WHERE tipo = 'S'

-- Valor total das entradas agrupadas por produto.
SELECT idProduto, SUM (quantidade * valorUnitario) AS valorTotal 
FROM movimento 
WHERE tipo = 'E'
GROUP BY idProduto

-- Valor total das sa�das agrupadas por produto.
SELECT idProduto, SUM (quantidade * valorUnitario) AS valorTotal 
FROM movimento 
WHERE tipo = 'S'
GROUP BY idProduto

-- Operadores que n�o efetuaram movimenta��es de entrada (compra).
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

-- Valor total de sa�da, agrupado por operador.
SELECT idUsuario, 
SUM (quantidade * valorUnitario) AS valorTotal
FROM movimento 
WHERE tipo = 'S'
GROUP BY idUsuario

-- Valor m�dio de venda por produto, utilizando m�dia ponderada.
SELECT p.nome AS nome_produto,
    CAST(SUM(m.valorUnitario * m.quantidade) AS DECIMAL(10,2)) /
    NULLIF(SUM(m.quantidade), 0) AS preco_medio_ponderado
FROM movimento m
JOIN produto p ON m.idProduto = p.idProduto
WHERE m.tipo = 'E'
GROUP BY p.nome;