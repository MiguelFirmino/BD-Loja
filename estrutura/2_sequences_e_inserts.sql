-- USUÁRIOS
INSERT INTO usuario (login, senha)
VALUES ('op1', 'op1'),
('op2', 'op2')

-- PRODUTOS
INSERT INTO produto (nome, quantidade, precoVenda)
VALUES ('caneta', 100, 5),
('lapis', 125, 3),
('borracha', 80, 4),
('caderno', 50, 8)

-- SEQUENCE PARA ID DE PESSOAS

CREATE SEQUENCE sPessoa AS SMALLINT
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	NO CYCLE
	CACHE 5

-- PESSOAS
DECLARE @id INT = NEXT VALUE FOR sPessoa

INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@id, 'Miguel', 'Rua A, 111', 'Cidade A', 'A1', '11911111111', 'miguel@email.com');

INSERT INTO pessoa_fisica (idPessoaFisica, cpf)
VALUES (@id, '11111111111');

SET @id = NEXT VALUE FOR sPessoa

INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@id, 'João', 'Rua B, 222', 'Cidade B', 'B1', '22922222222', 'joao@email.com');

INSERT INTO pessoa_fisica (idPessoaFisica, cpf)
VALUES (@id, '22222222222');

SET @id = NEXT VALUE FOR sPessoa

INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@id, 'Carlos', 'Rua C, 333', 'Cidade C', 'C1', '33933333333', 'carlos@email.com');

INSERT INTO pessoa_juridica (idPessoaJuridica, cnpj)
VALUES (@id, '33333333333333');

SET @id = NEXT VALUE FOR sPessoa

INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@id, 'Manoel', 'Rua D, 444', 'Cidade D', 'D1', '44944444444', 'manoel@email.com');

INSERT INTO pessoa_juridica (idPessoaJuridica, cnpj)
VALUES (@id, '44444444444444');

-- MOVIMENTOS

INSERT INTO movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 1, 1, 2, 'S', 5)

INSERT INTO movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 1, 3, 1, 'S', 3)

INSERT INTO movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 1, 4, 1, 'S', 8)

INSERT INTO movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 3, 3, 50, 'E', 4)

INSERT INTO movimento (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (2, 4, 4, 10, 'E', 7)