-- Contexto: neste projeto, analisaremos informa��es espec�ficas do banco de dados de uma empresa fict�cia chamada AdventureWorks. A partir disso, o objetivo � realizar algumas sintaxes para obter algumas informa��es do banco de dados, as quais podem subsidiar a tomada de decis�o da alta dire��o da organiza��o.
-- N�o necessariamente existe uma ordem ou correla��o direta entre as consultas, mas diferentes possibilidades de obten��o das informa��es necess�rias.

-- Escolher o banco de dados a ser utilizado:

USE [AdventureWorks2019];

-- Pesquisar informa��es gerais de uma tabela. No caso, usaremos como base a tabela de produtos:

SELECT * FROM Production.Product GO;

-- Pesquisar informa��es espec�ficas dos produtos na tabela correspondente. Dessa vez, especifiquei as colunas 'nome' e 'n�mero do produto':

SELECT Name, ProductNumber FROM Production.Product GO;

-- Pesquisar as faixas de pre�o dos produtos postos � venda:

SELECT ProductNumber AS "Numero do produto", Name as "Nome do Produto", ListPrice as "Pre�o",
"Faixa de pre�o" = 
CASE WHEN ListPrice = 0 THEN 'N�o dispon�vel para venda'
WHEN ListPrice < 50 THEN 'Abaixo de 50'
WHEN ListPrice >= 50 AND ListPrice = 250 THEN 'Maior de 50 e igual a 250'
ELSE 'Acima de 1000'
END
FROM Production.Product
GO;

-- Pesquisar as cidades nas quais os consumidores da loja residem, por ordem alfab�tica:

SELECT City, StateProvinceID FROM Person.Address ORDER BY City ASC;

-- Pesquisar os 20 maiores custos padr�o dos produtos:

SELECT TOP(20) StandardCost FROM Production.ProductCostHistory ORDER BY StandardCost DESC;

-- Verificar quais s�o as lojas que compraram os produtos, sem que elas se repitam:

SELECT DISTINCT Name AS 'Nome' FROM Sales.Store ORDER BY Name ASC;

-- Pesquisar cargos espec�ficos dos funcion�rios da empresa, utilizando-se do operador 'LIKE':

SELECT JobTitle FROM HumanResources.Employee WHERE JobTitle LIKE 'Marketing%';

-- Soma dos pre�os de venda dos produtos;

SELECT SUM (UnitPrice) FROM Sales.SalesOrderDetail;