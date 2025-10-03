USE HABITAE;
SELECT 
    (SELECT COUNT(*) FROM ENDERECO) AS TOTAL_ENDERECO,
    (SELECT COUNT(*) FROM PROPRIETARIO) AS TOTAL_PROPRIETARIO,
    (SELECT COUNT(*) FROM IMOVEL) AS TOTAL_IMOVEL,
    (SELECT COUNT(*) FROM FUNCIONARIO) AS TOTAL_FUNCIONARIO,
    (SELECT COUNT(*) FROM USUARIO) AS TOTAL_USUARIO,
    (SELECT COUNT(*) FROM RESERVA) AS TOTAL_RESERVA,
    (SELECT COUNT(*) FROM PAGAMENTO) AS TOTAL_PAGAMENTO,
    (SELECT COUNT(*) FROM NOTA_FISCAL) AS TOTAL_NOTA_FISCAL,
    (SELECT COUNT(*) FROM ANUNCIO) AS TOTAL_ANUNCIO;

-- 1. 5 consultas com SELECT e WHERE (10 pts)

-- Listar todos os imóveis para venda.
SELECT * FROM IMOVEL WHERE INTENCAO = 'Venda';

-- Selecionar reservas com check-in após 01/06/2024.
SELECT * FROM RESERVA WHERE `CHECKIN` > '2024-06-01'; 

-- Mostrar funcionários com telefone começando com '11'.
SELECT * FROM FUNCIONARIO WHERE TELEFONE LIKE '11%';

-- Listar anúncios veiculados na rede 'Online'.
SELECT * FROM ANUNCIO WHERE REDE = 'Online';

-- Selecionar pagamentos feitos via 'PIX' ou 'Cartão de Crédito'.
SELECT * FROM PAGAMENTO WHERE 'PIX' = TIPO OR 'Cartão de Crédito' = TIPO;

-- 2. 5 consultas com GROUP BY e ORDER BY com funções de agregação (10 pts)

-- Contar o número de imóveis por tipo, ordenado pela quantidade.
SELECT TIPO, COUNT(*) AS QUANTIDADE FROM IMOVEL
GROUP BY TIPO 
ORDER BY QUANTIDADE DESC;

-- Calcular o valor total de pagamentos por tipo, ordenado pelo valor.
SELECT TIPO, SUM(VALOR) AS VALOR_TOTAL FROM PAGAMENTO
GROUP BY TIPO
ORDER BY VALOR_TOTAL DESC;

-- Média de valores de anúncios por rede de divulgação.
SELECT REDE, AVG(VALOR) AS VALOR_TOTAL FROM ANUNCIO
GROUP BY REDE
ORDER BY VALOR_TOTAL DESC;

-- Quantidade de reservas por usuário (CPF), ordenado por quantidade.
SELECT CPF_USUARIO, COUNT(*) AS QUANTIDADE_RESERVAS FROM RESERVA 
GROUP BY CPF_USUARIO
ORDER BY QUANTIDADE_RESERVAS DESC;

-- Soma dos valores de pagamento por mês de data_pagamento.
SELECT MONTH(DATA_PAGAMENTO) AS MES,
		YEAR(DATA_PAGAMENTO) AS ANO,
        SUM(VALOR) AS VALOR_TOTAL FROM PAGAMENTO
		GROUP BY YEAR(DATA_PAGAMENTO), MONTH(DATA_PAGAMENTO)
		ORDER BY MONTH(DATA_PAGAMENTO), YEAR(DATA_PAGAMENTO) ASC;
        
-- ### 3. 5 consultas com operadores aritméticos (5 pts) ###

-- Calcular o valor do anúncio com acréscimo de 10%.
SELECT ID_ANUNCIO, DESCRICAO, VALOR AS VALOR_REAL, VALOR * 1.10 AS VALOR_ACRESCIDO FROM ANUNCIO;

-- Diferença em dias entre check-in e check-out das reservas.
SELECT ID_RESERVA, CHECKIN, CHECKOUT, DATEDIFF(CHECKOUT, CHECKIN) AS DIAS_DA_RESERVA FROM RESERVA;

-- Valor médio diário das reservas (valor_total / dias).
SELECT R.ID_RESERVA, R.CHECKIN, R.CHECKOUT, P.VALOR AS VALOR_TOTAL, DATEDIFF(CHECKOUT, CHECKIN) AS DIAS,
ROUND(P.VALOR / DATEDIFF(R.CHECKOUT, R.CHECKIN), 2) AS VALOR_MEDIO_DIARIO
FROM RESERVA R
JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
ORDER BY R.ID_RESERVA;

-- Desconto de 5% nos valores de pagamento acima de R$ 3000.
SELECT 
	ID_PAGAMENTO,
    VALOR AS VALOR_REAL, 
    VALOR * 0.05 AS VALOR_DESCONTO,
    VALOR - (VALOR * 0.05) AS VALOR_TOTAL
	FROM PAGAMENTO
    WHERE VALOR > 3000;

-- Calcular 2% de comissão sobre o valor dos anúncios.
SELECT ID_ANUNCIO, VALOR AS VALOR_REAL, ROUND((VALOR*0.02), 2) AS COMISSAO FROM ANUNCIO;

-- ### 4. 5 consultas com operadores de comparação (5 pts) ###

-- Selecionar imóveis com valor de anúncio superior a R$ 2000.
SELECT * FROM ANUNCIO WHERE VALOR > 2000;

-- Reservas com mais de 6 dias de duração.
SELECT ID_RESERVA, CHECKIN, CHECKOUT, 
	DATEDIFF(CHECKOUT, CHECKIN) AS DIAS 
    FROM RESERVA 
    WHERE DATEDIFF(CHECKOUT, CHECKIN) > 6;

-- Pagamentos com valor diferente de R$ 1500.
SELECT * FROM PAGAMENTO WHERE VALOR != 1500;

-- Anúncios com valor menor que a média geral.
SELECT * FROM ANUNCIO WHERE VALOR < (SELECT AVG(VALOR) FROM ANUNCIO);

-- Funcionários com ID_FUNCIONARIO entre 10 e 20.
SELECT * FROM FUNCIONARIO WHERE ID_FUNCIONARIO BETWEEN 10 AND 20
ORDER BY ID_FUNCIONARIO;

-- ### 5. 5 consultas com operadores lógicos (AND, OR) (5 pts) ###

-- Imóveis para aluguel do tipo 'Apartamento' ou 'Casa'.
SELECT * FROM IMOVEL WHERE TIPO = 'Apartamento' or TIPO = 'Casa';

-- Reservas em 2024 com valor superior a R$ 2000 ou duração maior que 5 dias.
SELECT R.*, P.VALOR
FROM RESERVA R
JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
WHERE YEAR(R.CHECKIN) = 2024
AND (P.VALOR > 2000 OR DATEDIFF(R.CHECKOUT, R.CHECKIN) > 5);

-- Usuários com telefone da região 11 (SP) ou 21 (RJ).
SELECT * FROM USUARIO WHERE TELEFONE LIKE '11%' OR TELEFONE LIKE '21%';

-- Anúncios online com valor entre R$ 500 e R$ 1500.
SELECT * FROM ANUNCIO WHERE VALOR BETWEEN 500 AND 1500;

-- Pagamentos via 'Boleto' ou 'Dinheiro' com valor inferior a R$ 1000.
SELECT * FROM PAGAMENTO WHERE VALOR > '1000' AND TIPO = 'Boleto' OR TIPO = 'Dinheiro';

-- ### 6. 2 consultas com operadores lógicos e negação (NOT) (3 pts) ###

-- Imóveis que não são do tipo 'Comercial'.
SELECT * FROM IMOVEL WHERE NOT TIPO = 'Comercial';

-- Reservas que não foram pagas com 'Cartão de Crédito'.
SELECT R.ID_RESERVA, P.TIPO
FROM RESERVA R
JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
WHERE NOT P.TIPO = 'Cartão de Crédito';

-- 7. 10 consultas com operadores auxiliares (IS NULL, BETWEEN, LIKE, IN)
-- Endereços com complemento nulo
SELECT * FROM ENDERECO WHERE COMPLEMENTO IS NULL;

-- Reservas com check-in entre Janeiro e Março de 2024
SELECT * FROM RESERVA
WHERE CHECKIN BETWEEN '2024-01-01' AND '2024-03-31';

-- Proprietários com 'Silva' no nome
SELECT * FROM PROPRIETARIO WHERE NOME LIKE '%Silva%';

-- Imóveis localizados em SP ou RJ
SELECT I.*, E.CIDADE, E.ESTADO 
FROM IMOVEL I
JOIN ENDERECO E ON I.ID_ENDERECO = E.ID_ENDERECO
WHERE E.ESTADO IN ('SP', 'RJ');

-- Usuários com email do domínio '@email.com'
SELECT * FROM USUARIO WHERE EMAIL LIKE '%@email.com';

-- Pagamentos com valores entre R$ 1000 e R$ 2000
SELECT * FROM PAGAMENTO WHERE VALOR BETWEEN 1000 AND 2000;

-- Funcionários com nomes começando com 'A'
SELECT * FROM FUNCIONARIO WHERE NOME LIKE 'A%';

-- Anúncios com descrição contendo 'luxo'
SELECT * FROM ANUNCIO WHERE DESCRICAO LIKE '%luxo%';

-- Reservas feitas por usuários específicos
SELECT * FROM RESERVA 
WHERE CPF_USUARIO IN ('12345678901', '23456789012', '34567890123');

-- Notas fiscais emitidas em um período específico
SELECT * FROM NOTA_FISCAL 
WHERE DATA_EMISSAO BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59';

-- 8. 5 consultas com funções de agregação
-- Soma total investida em anúncios
SELECT SUM(VALOR) AS TOTAL_INVESTIDO FROM ANUNCIO;

-- Valor médio das reservas
SELECT AVG(P.VALOR) AS MEDIA_VALOR_RESERVAS
FROM RESERVA R
JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA;

-- Maior valor de pagamento registrado
SELECT MAX(VALOR) AS MAIOR_PAGAMENTO FROM PAGAMENTO;

-- Número total de imóveis por cidade
SELECT E.CIDADE, COUNT(I.ID_IMOVEL) AS TOTAL_IMOVEIS
FROM IMOVEL I
JOIN ENDERECO E ON I.ID_ENDERECO = E.ID_ENDERECO
GROUP BY E.CIDADE
ORDER BY TOTAL_IMOVEIS DESC;

-- Média de valor dos anúncios por tipo de imóvel
SELECT I.TIPO, AVG(A.VALOR) AS MEDIA_VALOR
FROM ANUNCIO A
JOIN IMOVEL I ON A.ID_IMOVEL = I.ID_IMOVEL
GROUP BY I.TIPO;

-- 9. 5 consultas com funções de datas
-- Reservas do mês atual
SELECT * FROM RESERVA 
WHERE MONTH(CHECKIN) = MONTH(CURRENT_DATE()) 
AND YEAR(CHECKIN) = YEAR(CURRENT_DATE());

-- Idade dos funcionários (usando data de emissão como exemplo)
SELECT ID_NOTA, DATA_EMISSAO, 
       TIMESTAMPDIFF(DAY, DATA_EMISSAO, NOW()) AS DIAS_DESDE_EMISSAO
FROM NOTA_FISCAL;

-- Pagamentos realizados no último trimestre
SELECT * FROM PAGAMENTO 
WHERE DATA_PAGAMENTO >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH);

-- Anúncios veiculados no ano anterior (usando data de emissão como exemplo)
SELECT * FROM NOTA_FISCAL 
WHERE YEAR(DATA_EMISSAO) = YEAR(CURRENT_DATE()) - 1;

-- Dias até o check-in das reservas futuras
SELECT ID_RESERVA, CHECKIN, 
       DATEDIFF(CHECKIN, CURRENT_DATE()) AS DIAS_ATE_CHECKIN
FROM RESERVA
WHERE CHECKIN > CURRENT_DATE();

-- 10. 5 sub-consultas com agrupamento e união de dados
-- Imóveis com valor de anúncio acima da média
SELECT * FROM ANUNCIO 
WHERE VALOR > (SELECT AVG(VALOR) FROM ANUNCIO);

-- Usuários com mais reservas que a média
SELECT U.*, COUNT(R.ID_RESERVA) AS TOTAL_RESERVAS
FROM USUARIO U
JOIN RESERVA R ON U.CPF = R.CPF_USUARIO
GROUP BY U.CPF
HAVING COUNT(R.ID_RESERVA) > (SELECT AVG(reserva_count) 
                              FROM (SELECT COUNT(*) AS reserva_count 
                                    FROM RESERVA 
                                    GROUP BY CPF_USUARIO) AS counts);

-- Proprietários com quantidade de imóveis maior que 2
SELECT P.*, COUNT(I.ID_IMOVEL) AS TOTAL_IMOVEIS
FROM PROPRIETARIO P
JOIN IMOVEL I ON P.CPF = I.CPF_PROPRIETARIO
GROUP BY P.CPF
HAVING COUNT(I.ID_IMOVEL) > 2;

-- Redes de anúncio com investimento total superior a R$ 5000
SELECT REDE, SUM(VALOR) AS TOTAL_INVESTIDO
FROM ANUNCIO
GROUP BY REDE
HAVING SUM(VALOR) > 5000;

-- Reservas com valor total maior que a média por tipo de imóvel
SELECT R.*, P.VALOR, I.TIPO
FROM RESERVA R
JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
JOIN IMOVEL I ON R.ID_IMOVEL = I.ID_IMOVEL
WHERE P.VALOR > (SELECT AVG(P2.VALOR) 
                 FROM PAGAMENTO P2
                 JOIN RESERVA R2 ON P2.ID_RESERVA = R2.ID_RESERVA
                 JOIN IMOVEL I2 ON R2.ID_IMOVEL = I2.ID_IMOVEL
                 WHERE I2.TIPO = I.TIPO);

-- 11. 5 consultas com JOIN e visualização de tabelas
-- Listar imóveis com seus endereços completos
SELECT I.*, E.*
FROM IMOVEL I
JOIN ENDERECO E ON I.ID_ENDERECO = E.ID_ENDERECO;

-- Mostrar reservas com dados do usuário e imóvel
SELECT R.*, U.NOME AS NOME_USUARIO, I.*
FROM RESERVA R
JOIN USUARIO U ON R.CPF_USUARIO = U.CPF
JOIN IMOVEL I ON R.ID_IMOVEL = I.ID_IMOVEL;

-- Pagamentos com informações da reserva e usuário
SELECT P.*, R.CHECKIN, R.CHECKOUT, U.NOME AS NOME_USUARIO
FROM PAGAMENTO P
JOIN RESERVA R ON P.ID_RESERVA = R.ID_RESERVA
JOIN USUARIO U ON R.CPF_USUARIO = U.CPF;

-- Anúncios com dados do imóvel e proprietário
SELECT A.*, I.*, P.NOME AS NOME_PROPRIETARIO
FROM ANUNCIO A
JOIN IMOVEL I ON A.ID_IMOVEL = I.ID_IMOVEL
JOIN PROPRIETARIO P ON I.CPF_PROPRIETARIO = P.CPF;

-- Notas fiscais com detalhes do pagamento e reserva
SELECT NF.*, P.*, R.*
FROM NOTA_FISCAL NF
JOIN PAGAMENTO P ON NF.ID_PAGAMENTO = P.ID_PAGAMENTO
JOIN RESERVA R ON P.ID_RESERVA = R.ID_RESERVA;

-- 12. 10 consultas com tipos de JOIN
-- INNER JOIN: Imóveis com endereços válidos
SELECT I.*, E.*
FROM IMOVEL I
INNER JOIN ENDERECO E ON I.ID_ENDERECO = E.ID_ENDERECO;

-- LEFT JOIN: Todos os proprietários, mesmo sem imóveis
SELECT P.*, I.ID_IMOVEL
FROM PROPRIETARIO P
LEFT JOIN IMOVEL I ON P.CPF = I.CPF_PROPRIETARIO;

-- RIGHT JOIN: Todos os usuários, mesmo sem reservas
SELECT U.*, R.ID_RESERVA
FROM RESERVA R
RIGHT JOIN USUARIO U ON R.CPF_USUARIO = U.CPF;

-- INNER JOIN: Reservas com pagamentos realizados
SELECT R.*, P.*
FROM RESERVA R
INNER JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA;

-- LEFT JOIN: Imóveis mesmo sem anúncios
SELECT I.*, A.ID_ANUNCIO
FROM IMOVEL I
LEFT JOIN ANUNCIO A ON I.ID_IMOVEL = A.ID_IMOVEL;

-- RIGHT JOIN: Todos os anúncios, mesmo sem imóvel
SELECT A.*, I.ID_IMOVEL
FROM IMOVEL I
RIGHT JOIN ANUNCIO A ON I.ID_IMOVEL = A.ID_IMOVEL;

-- INNER JOIN: Funcionários com dados da empresa
SELECT F.*, E.NOME AS NOME_EMPRESA
FROM FUNCIONARIO F
INNER JOIN EMPRESA E ON F.CNPJ = E.CNPJ;

-- LEFT JOIN: Reservas mesmo sem nota fiscal
SELECT R.*, NF.ID_NOTA
FROM RESERVA R
LEFT JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
LEFT JOIN NOTA_FISCAL NF ON P.ID_PAGAMENTO = NF.ID_PAGAMENTO;

-- RIGHT JOIN: Pagamentos sem reserva (inválidos)
SELECT P.*, R.ID_RESERVA
FROM RESERVA R
RIGHT JOIN PAGAMENTO P ON R.ID_RESERVA = P.ID_RESERVA
WHERE R.ID_RESERVA IS NULL;

-- FULL JOIN (simulado): Todos os usuários e proprietários
SELECT U.CPF, U.NOME, 'Usuário' AS TIPO
FROM USUARIO U
LEFT JOIN PROPRIETARIO P ON U.CPF = P.CPF
WHERE P.CPF IS NULL
UNION ALL
SELECT P.CPF, P.NOME, 'Proprietário' AS TIPO
FROM PROPRIETARIO P
LEFT JOIN USUARIO U ON P.CPF = U.CPF
WHERE U.CPF IS NULL
UNION ALL
SELECT U.CPF, U.NOME, 'Ambos' AS TIPO
FROM USUARIO U
INNER JOIN PROPRIETARIO P ON U.CPF = P.CPF;

-- 13. Criação de 1 TRIGGER e 1 STORED PROCEDURE
-- Trigger: Validar data de check-out > check-in antes de inserir reserva
DELIMITER //
CREATE TRIGGER valida_checkout_checkin
BEFORE INSERT ON RESERVA
FOR EACH ROW
BEGIN
    IF NEW.CHECKOUT <= NEW.CHECKIN THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Check-out deve ser após check-in';
    END IF;
END;
//
DELIMITER ;

-- Stored Procedure: Inserir novo usuário com verificações de duplicidade
DELIMITER //
CREATE PROCEDURE InserirUsuario(
    IN p_CPF VARCHAR(11),
    IN p_NOME VARCHAR(50),
    IN p_EMAIL VARCHAR(50),
    IN p_TELEFONE VARCHAR(15)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    IF EXISTS (SELECT 1 FROM USUARIO WHERE CPF = p_CPF) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CPF já cadastrado';
    END IF;
    
    IF EXISTS (SELECT 1 FROM USUARIO WHERE EMAIL = p_EMAIL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email já cadastrado';
    END IF;
    
    INSERT INTO USUARIO (CPF, NOME, EMAIL, TELEFONE)
    VALUES (p_CPF, p_NOME, p_EMAIL, p_TELEFONE);
    
    COMMIT;
END;
//
DELIMITER ;