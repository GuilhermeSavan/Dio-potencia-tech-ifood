-- Consulta 1: Quantos pedidos foram feitos por cada cliente?
SELECT Clientes.Nome AS Cliente, COUNT(Pedidos.ID) AS Total_Pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID = Pedidos.ID_Cliente
GROUP BY Clientes.Nome;

-- Consulta 2: Algum vendedor também é fornecedor?
SELECT DISTINCT Vendedores.Nome AS Vendedor_Fornecedor
FROM Vendedores
INNER JOIN Fornecedores ON Vendedores.ID = Fornecedores.ID_Vendedor;

-- Consulta 3: Relação de produtos, fornecedores e estoques
SELECT Produtos.Nome AS Produto, Fornecedores.Nome AS Fornecedor, Estoques.Quantidade AS Quantidade_Estoque
FROM Produtos
INNER JOIN Fornecedores ON Produtos.ID_Fornecedor = Fornecedores.ID
INNER JOIN Estoques ON Produtos.ID = Estoques.ID_Produto;

-- Consulta 4: Relação de nomes dos fornecedores e nomes dos produtos
SELECT Produtos.Nome AS Produto, Fornecedores.Nome AS Fornecedor
FROM Produtos
INNER JOIN Fornecedores ON Produtos.ID_Fornecedor = Fornecedores.ID;