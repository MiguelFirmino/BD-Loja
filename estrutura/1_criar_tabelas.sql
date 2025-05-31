CREATE TABLE usuario (
idUsuario INT IDENTITY PRIMARY KEY,
login varchar(255) NOT NULL,
senha varchar(255) NOT NULL
)

CREATE TABLE pessoa (
idPessoa INT PRIMARY KEY,
nome varchar(255) NOT NULL,
logradouro varchar(255) NOT NULL,
cidade varchar(255) NOT NULL,
estado char(2) NOT NULL,
telefone varchar(11) NOT NULL,
email varchar(255) unique NOT NULL
)

CREATE TABLE pessoa_fisica (
idPessoaFisica INT PRIMARY KEY,
cpf varchar(11) NOT NULL,
FOREIGN KEY (idPessoaFisica) REFERENCES pessoa(idPessoa) ON DELETE CASCADE
)

CREATE TABLE pessoa_juridica (
idPessoaJuridica INT PRIMARY KEY,
cnpj varchar(14) NOT NULL,
FOREIGN KEY (idPessoaJuridica) REFERENCES pessoa(idPessoa) ON DELETE CASCADE
)

CREATE TABLE produto (
idProduto INT IDENTITY PRIMARY KEY, 
nome varchar(255) NOT NULL,
quantidade int NOT NULL CHECK(quantidade > 0),
precoVenda numeric NOT NULL CHECK(precoVenda > 0)
)

CREATE TABLE movimento (
idMovimento INT IDENTITY PRIMARY KEY,
idUsuario INT NOT NULL,
idPessoa INT NOT NULL,
idProduto INT NOT NULL,
quantidade INT NOT NULL CHECK(quantidade > 0),
tipo CHAR(1) NOT NULL CHECK(tipo IN ('E', 'S')),
valorUnitario NUMERIC NOT NULL CHECK(valorUnitario > 0)

FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) ON DELETE CASCADE,
FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa) ON DELETE CASCADE,
FOREIGN KEY (idProduto) REFERENCES produto(idProduto) ON DELETE CASCADE
)