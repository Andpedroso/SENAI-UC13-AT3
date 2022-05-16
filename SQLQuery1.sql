--Projeto RPG Online. SENAI. André Moura Pedroso. Full Stack.
--1.Criar o banco.
CREATE DATABASE RpgOnlineFst2
GO

USE RpgOnlineFst2
GO

--2.Estrutura do banco. DDL.
CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(20) UNIQUE NOT NULL,
	Descricao VARCHAR(100)
)
GO

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(20) UNIQUE NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Personagem VARCHAR(20) UNIQUE NOT NULL,
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(20) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)

--3.MANIPULAÇÃO DOS DADOS. INSERIR DADOS. DML.
INSERT INTO Classes VALUES ('Bárbaro', 'Guerreiro mortal.')
GO
INSERT INTO Usuarios VALUES ('André Pedroso', 'email@email.com', '123456', 'Bárbaro', 1)
GO
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
GO
INSERT INTO ClasseHabilidade(ClasseId, HabilidadeId) VALUES (1, 1), (1, 2)

--4.DQL. SELEÇÃO DE DADOS PARA VERIFICAÇÃO.
--Usuários
SELECT * FROM Usuarios
--Classes
SELECT * FROM Classes
--Habilidades
SELECT * FROM Habilidades
--ClasseHabilidade
SELECT * FROM ClasseHabilidade
--INNER JOIN COM AS ENTIDADES: USUARIOS, CLASSES E HABILIDADES
SELECT * FROM Usuarios
INNER JOIN Classes ON Classes.ClasseId = Usuarios.UsuarioId
INNER JOIN Habilidades ON Habilidades.HabilidadeId = Classes.ClasseId