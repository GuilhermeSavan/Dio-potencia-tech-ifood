-- Criação das Tabelas

-- Tabela de Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    -- Outros campos de cliente
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    ID INT PRIMARY KEY,
    Marca VARCHAR(255),
    Modelo VARCHAR(255),
    Ano INT,
    Placa VARCHAR(10),
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID),
    -- Outros campos de veículo
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    -- Outros campos de serviço
);

-- Tabela de Mecânicos
CREATE TABLE Mecanicos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Especializacao VARCHAR(255),
    -- Outros campos de mecânico
);

-- Tabela de Ordens de Serviço
CREATE TABLE Ordens_Servico (
    ID INT PRIMARY KEY,
    Data DATE,
    ID_Cliente INT,
    ID_Veiculo INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID),
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID),
    -- Outros campos de ordem de serviço
);

-- Tabela de Itens da Ordem de Serviço
CREATE TABLE Itens_Ordem_Servico (
    ID INT PRIMARY KEY,
    ID_Servico INT,
    ID_Mecanico INT,
    ID_Ordem_Servico INT,
    Quantidade INT,
    FOREIGN KEY (ID_Servico) REFERENCES Servicos(ID),
    FOREIGN KEY (ID_Mecanico) REFERENCES Mecanicos(ID),
    FOREIGN KEY (ID_Ordem_Servico) REFERENCES Ordens_Servico(ID),
    -- Outros campos de itens de ordem de serviço
);

-- Consultas SQL

-- 1. Recuperações Simples com SELECT Statement

-- Recuperar todos os clientes da oficina
SELECT * FROM Clientes;

-- Recuperar todos os veículos de um cliente específico
SELECT * FROM Veiculos WHERE ID_Cliente = 1;

-- 2. Filtros com WHERE Statement

-- Recuperar todas as Ordens de Serviço para um veículo com uma placa específica
SELECT * FROM Ordens_Servico WHERE ID_Veiculo = 'ABC123';

-- 3. Crie Expressões para Gerar Atributos Derivados

-- Calcular o valor total de uma Ordem de Serviço
SELECT ID_Ordem_Servico, SUM(Quantidade * Preco) AS Valor_Total
FROM Itens_Ordem_Servico
GROUP BY ID_Ordem_Servico;

-- 4. Defina Ordenações dos Dados com ORDER BY

-- Listar todas as Ordens de Serviço em ordem decrescente de data
SELECT * FROM Ordens_Servico
ORDER BY Data DESC;

-- 5. Condições de Filtros aos Grupos - HAVING Statement

-- Encontrar os clientes que fizeram um gasto total superior a $1000 em serviços
SELECT ID_Cliente, SUM(Quantidade * Preco) AS Gasto_Total
FROM Itens_Ordem_Servico
GROUP BY ID_Cliente
HAVING Gasto_Total > 1000;

-- 6. Crie Junções entre Tabelas para Fornecer uma Perspectiva mais Complexa dos Dados

-- Listar os mecânicos que realizaram serviços em um veículo específico
SELECT Mecanicos.Nome
FROM Mecanicos
INNER JOIN Itens_Ordem_Servico ON Mecanicos.ID = Itens_Ordem_Servico.ID_Mecanico
WHERE Itens_Ordem_Servico.ID_Veiculo = 1;
