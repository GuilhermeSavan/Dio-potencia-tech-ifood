-- Criação da tabela Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Senha VARCHAR(255),
    -- Outros campos comuns a todos os clientes
);

-- Criação da tabela Clientes_PF para Pessoa Física
CREATE TABLE Clientes_PF (
    ID INT PRIMARY KEY,
    CPF VARCHAR(11),
    -- Outros campos específicos de Pessoa Física
    FOREIGN KEY (ID) REFERENCES Clientes(ID)
);

-- Criação da tabela Clientes_PJ para Pessoa Jurídica
CREATE TABLE Clientes_PJ (
    ID INT PRIMARY KEY,
    CNPJ VARCHAR(14),
    -- Outros campos específicos de Pessoa Jurídica
    FOREIGN KEY (ID) REFERENCES Clientes(ID)
);

-- Criação da tabela Pagamentos
CREATE TABLE Pagamentos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Tipo_Pagamento VARCHAR(255),
    Numero_Cartao VARCHAR(16),
    -- Outros campos relacionados a pagamento
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

-- Criação da tabela Entregas
CREATE TABLE Entregas (
    ID INT PRIMARY KEY,
    ID_Pedido INT,
    Status_Entrega VARCHAR(255),
    Codigo_Rastreio VARCHAR(255),
    -- Outros campos relacionados a entrega
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID)
);