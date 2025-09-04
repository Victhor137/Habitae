CREATE DATABASE IF NOT EXISTS HABITAE;
USE HABITAE;

-- 1. TABELA EMPRESA (CNPJ como VARCHAR para preservar zeros)
CREATE TABLE EMPRESA (
    CNPJ VARCHAR(14) PRIMARY KEY,
    NOME VARCHAR(30) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL,
    ENDERECO_FISICO VARCHAR(30) NOT NULL
);

-- 2. TABELA PROPRIETARIO 
CREATE TABLE PROPRIETARIO (
    CPF VARCHAR(11) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL
);

-- 3. TABELA ENDERECO 
CREATE TABLE ENDERECO (
    ID_ENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    CEP CHAR(8) NOT NULL,
    RUA VARCHAR(100) NOT NULL,
    NUMERO INT NOT NULL,
    COMPLEMENTO VARCHAR(100),
    CIDADE VARCHAR(50) NOT NULL,
    ESTADO CHAR(2) NOT NULL
);

-- 4. TABELA IMOVEL (sem FKs inicialmente)
CREATE TABLE IMOVEL (
    ID_IMOVEL INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ VARCHAR(14) NOT NULL,
    ID_ENDERECO INT NOT NULL,
    CPF_PROPRIETARIO VARCHAR(11) NOT NULL,
    INTENCAO ENUM('Venda', 'Aluguel') NOT NULL,
    TIPO ENUM('Apartamento', 'Casa', 'Comercial') NOT NULL,
    DESCRICAO VARCHAR(255)
);

-- 5. TABELA USUARIO 
CREATE TABLE USUARIO (
    CPF VARCHAR(11) PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL
);

-- 6. TABELA RESERVA (sem FKs inicialmente)
CREATE TABLE RESERVA (
    ID_RESERVA INT PRIMARY KEY AUTO_INCREMENT,
    CPF_USUARIO VARCHAR(11) NOT NULL,
    ID_IMOVEL INT NOT NULL,
    CHECKIN DATE NOT NULL,
    CHECKOUT DATE NOT NULL,
    CONSTRAINT check_dates CHECK (CHECKOUT > CHECKIN)
);

-- 7. TABELA PAGAMENTO (sem FKs inicialmente)
CREATE TABLE PAGAMENTO (
    ID_PAGAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    ID_RESERVA INT NOT NULL,
    VALOR DECIMAL(10,2) NOT NULL,
    DATA_PAGAMENTO DATE NOT NULL,
    TIPO ENUM('PIX', 'Cartão de Débito', 'Cartão de Crédito', 'Boleto', 'Dinheiro') NOT NULL
);

-- 8. TABELA NOTA_FISCAL (sem FKs inicialmente)
CREATE TABLE NOTA_FISCAL (
    ID_NOTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PAGAMENTO INT NOT NULL,
    DATA_EMISSAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. TABELA FUNCIONARIO (sem FKs inicialmente)
CREATE TABLE FUNCIONARIO (
    ID_FUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ VARCHAR(14) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    TELEFONE VARCHAR(14) NOT NULL
);

-- 10. TABELA ANUNCIO (sem FKs inicialmente)
CREATE TABLE ANUNCIO (
    ID_ANUNCIO INT PRIMARY KEY AUTO_INCREMENT,
    CNPJ VARCHAR(14) NOT NULL,
    ID_IMOVEL INT NOT NULL,
    REDE ENUM('Online','Impresso','Tv','Outdoor') NOT NULL,
    DESCRICAO VARCHAR(100),
    VALOR DECIMAL(10,2) NOT NULL
);

-- ADICIONANDO FOREIGN KEYS APÓS CRIAÇÃO DAS TABELAS:

-- IMOVEL
ALTER TABLE IMOVEL
ADD CONSTRAINT fk_imovel_empresa FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ),
ADD CONSTRAINT fk_imovel_endereco FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO),
ADD CONSTRAINT fk_imovel_proprietario FOREIGN KEY (CPF_PROPRIETARIO) REFERENCES PROPRIETARIO(CPF);

-- RESERVA
ALTER TABLE RESERVA
ADD CONSTRAINT fk_reserva_usuario FOREIGN KEY (CPF_USUARIO) REFERENCES USUARIO(CPF),
ADD CONSTRAINT fk_reserva_imovel FOREIGN KEY (ID_IMOVEL) REFERENCES IMOVEL(ID_IMOVEL);

-- PAGAMENTO
ALTER TABLE PAGAMENTO
ADD CONSTRAINT fk_pagamento_reserva FOREIGN KEY (ID_RESERVA) REFERENCES RESERVA(ID_RESERVA);

-- NOTA_FISCAL
ALTER TABLE NOTA_FISCAL
ADD CONSTRAINT fk_nota_fiscal_pagamento FOREIGN KEY (ID_PAGAMENTO) REFERENCES PAGAMENTO(ID_PAGAMENTO);

-- FUNCIONARIO
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT fk_funcionario_empresa FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ);

-- ANUNCIO
ALTER TABLE ANUNCIO
ADD CONSTRAINT fk_anuncio_empresa FOREIGN KEY (CNPJ) REFERENCES EMPRESA(CNPJ),
ADD CONSTRAINT fk_anuncio_imovel FOREIGN KEY (ID_IMOVEL) REFERENCES IMOVEL(ID_IMOVEL);

INSERT INTO EMPRESA (CNPJ, NOME, TELEFONE, EMAIL, ENDERECO_FISICO) VALUES
('12345678000199', 'HABITAE', 40028922, 'atendimento@habitae.com', 'Rua dos Alfeneiros Numero 04');

INSERT INTO PROPRIETARIO (CPF, NOME, TELEFONE) VALUES
('12345678901', 'João Silva Santos', '11987654321'),
('23456789012', 'Maria Oliveira Costa', '21976543210'),
('34567890123', 'Pedro Almeida Souza', '31965432109'),
('45678901234', 'Ana Pereira Lima', '41954321098'),
('56789012345', 'Carlos Rodrigues Martins', '11943210987'),
('67890123456', 'Mariana Ferreira Gomes', '21932109876'),
('78901234567', 'Paulo Carvalho Ribeiro', '31921098765'),
('89012345678', 'Julia Santos Alves', '41910987654'),
('90123456789', 'Lucas Barbosa Pinto', '11909876543'),
('01234567890', 'Fernanda Dias Cardoso', '21998765432'),
('11223344556', 'Ricardo Nunes Moreira', '31987654321'),
('22334455667', 'Amanda Teixeira Rocha', '41976543210'),
('33445566778', 'Bruno Mendes Castro', '11965432109'),
('44556677889', 'Isabela Duarte Freitas', '21954321098'),
('55667788990', 'Eduardo Correia Neves', '31943210987'),
('66778899001', 'Larissa Machado Guimarães', '41932109876'),
('77889900112', 'Felipe Araújo Dantas', '11921098765'),
('88990011223', 'Patrícia Fonseca Peixoto', '21910987654'),
('99001112234', 'Rodrigo Tavares Brito', '31909876543'),
('10020030040', 'Camila Andrade Vasconcelos', '41998765432'),
('20030040050', 'Gustavo Henrique Moraes', '11987654321'),
('30040050060', 'Tânia Lopes Brandão', '21976543210'),
('40050060070', 'Diego Montes Xavier', '31965432109'),
('50060070080', 'Vanessa Castro Arruda', '41954321098'),
('60070080090', 'Roberto Nunes Pacheco', '11943210987'),
('70080090100', 'Helena Freitas Caldas', '21932109876'),
('80090100110', 'Daniel Machado Barros', '31921098765'),
('90010020030', 'Sandra Moura Campos', '41910987654'),
('10020030041', 'Antônio Pires Quintão', '11909876543'),
('20030040051', 'Cláudia Moreira Siqueira', '21998765432'),
('30040050061', 'Márcio Almeida Câmara', '31987654321'),
('40050060071', 'Renata Vieira Bessa', '41976543210'),
('50060070081', 'José Lima Fontes', '11965432109'),
('60070080091', 'Beatriz Campos Paiva', '21954321098'),
('70080090101', 'Vinícius Almeida Rezende', '31943210987'),
('80090100111', 'Lúcia Ribeiro Falcão', '41932109876'),
('90010020031', 'Marcos Duarte Goulart', '11921098765'),
('10020030042', 'Elaine Nascimento Maia', '21910987654'),
('20030040052', 'Rafael Siqueira Teles', '31909876543'),
('30040050062', 'Cristina Alves Medeiros', '41998765432'),
('40050060072', 'André Coelho Fagundes', '11987654321'),
('50060070082', 'Lorena Peixoto Azevedo', '21976543210'),
('60070080092', 'Sérgio Ramos Donato', '31965432109'),
('70080090102', 'Yasmin Almeida Simões', '41954321098'),
('80090100112', 'Tiago Melo Cordeiro', '11943210987'),
('90010020032', 'Natália Chaves Leão', '21932109876'),
('10020030043', 'Fábio Medeiros Ávila', '31921098765'),
('20030040053', 'Aline Barros Sacramento', '41910987654'),
('30040050063', 'Leonardo Dantas Maciel', '11909876543'),
('40050060073', 'Jéssica Tavares Noronha', '21998765432');

INSERT INTO ENDERECO (CEP, RUA, NUMERO, COMPLEMENTO, CIDADE, ESTADO) VALUES
('01001000', 'Praça da Sé', 100, 'Lado ímpar', 'São Paulo', 'SP'),
('20040002', 'Rua do Ouvidor', 50, 'Sobrado', 'Rio de Janeiro', 'RJ'),
('30130005', 'Avenida Afonso Pena', 1000, 'Edifício Commercial', 'Belo Horizonte', 'MG'),
('40010010', 'Rua Chile', 25, 'Sala 501', 'Salvador', 'BA'),
('70040903', 'Eixo Monumental', 12, 'Setor Administrativo', 'Brasília', 'DF'),
('80010000', 'Rua das Flores', 300, 'Loja A', 'Curitiba', 'PR'),
('90010004', 'Rua dos Andradas', 157, '5º andar', 'Porto Alegre', 'RS'),
('50010020', 'Rua do Bom Jesus', 77, 'Casa amarela', 'Recife', 'PE'),
('60010030', 'Avenida Beira Mar', 200, 'Apartamento 302', 'Fortaleza', 'CE'),
('29010020', 'Rua da Lama', 45, 'Fundos', 'Vitória', 'ES'),
('57010020', 'Rua do Comércio', 88, 'Galeria', 'Maceió', 'AL'),
('65010000', 'Rua Grande', 123, 'Sobrado azul', 'São Luís', 'MA'),
('69010001', 'Avenida Eduardo Ribeiro', 500, 'Edifício Amazonas', 'Manaus', 'AM'),
('77010022', 'Quadra 101 Sul', 15, 'Conjunto 3', 'Palmas', 'TO'),
('78010020', 'Avenida Getúlio Vargas', 700, 'Loja 25', 'Cuiabá', 'MT'),
('88010001', 'Rua Felipe Schmidt', 33, 'Sala 1001', 'Florianópolis', 'SC'),
('64010020', 'Avenida Frei Serafim', 1500, 'Casa 2', 'Teresina', 'PI'),
('58010020', 'Avenida Epitácio Pessoa', 2000, 'Apartamento 501', 'João Pessoa', 'PB'),
('49010020', 'Rua Laranjeiras', 99, 'Fundos', 'Aracaju', 'SE'),
('67010020', 'Avenida Governador José Malcher', 876, 'Comércio', 'Belém', 'PA'),
('72800000', 'Rua 5', 10, 'Quadra 8', 'Luziânia', 'GO'),
('13010020', 'Rua Barão de Jaguara', 555, 'Sobrado', 'Campinas', 'SP'),
('14010020', 'Avenida Costa e Silva', 321, 'Galpão', 'Ribeirão Preto', 'SP'),
('15010020', 'Rua General Glicério', 777, 'Loja B', 'São José do Rio Preto', 'SP'),
('35510000', 'Rua da Liberdade', 88, 'Casa verde', 'Divinópolis', 'MG'),
('38410020', 'Avenida Rondon Pacheco', 1500, 'Edifício Center', 'Uberlândia', 'MG'),
('38010020', 'Rua Arthur de Machado', 222, 'Sala 3', 'Uberaba', 'MG'),
('29110020', 'Avenida Nossa Senhora da Penha', 777, 'Loja 12', 'Vila Velha', 'ES'),
('29010030', 'Rua São Marcos', 111, 'Casa dos fundos', 'Vitória', 'ES'),
('80020020', 'Rua XV de Novembro', 999, 'Sobrado histórico', 'Curitiba', 'PR'),
('81010020', 'Avenida República Argentina', 444, 'Conjunto 101', 'Curitiba', 'PR'),
('90020030', 'Avenida João Pessoa', 321, 'Apartamento 201', 'Porto Alegre', 'RS'),
('91010020', 'Rua Carlos Gomes', 654, 'Sala 401', 'Porto Alegre', 'RS'),
('50020030', 'Rua da Aurora', 789, 'Edifício Aurora', 'Recife', 'PE'),
('51010020', 'Avenida Boa Viagem', 2222, 'Apartamento 1002', 'Recife', 'PE'),
('60020030', 'Avenida Dom Luís', 1234, 'Shopping Aldeota', 'Fortaleza', 'CE'),
('60110020', 'Rua dos Pacajús', 55, 'Casa', 'Fortaleza', 'CE'),
('57020030', 'Avenida da Paz', 333, 'Loja 7', 'Maceió', 'AL'),
('57030040', 'Rua Jangadeiros Alagoanos', 888, 'Ponto final', 'Maceió', 'AL'),
('65020030', 'Rua do Passeio', 666, 'Sobrado antigo', 'São Luís', 'MA'),
('65110020', 'Avenida Daniel de La Touche', 1111, 'Condomínio', 'São Luís', 'MA'),
('49020030', 'Avenida Ivo do Prado', 432, 'Comércio', 'Aracaju', 'SE'),
('49030040', 'Rua Itabaianinha', 987, 'Residencial', 'Aracaju', 'SE'),
('58020030', 'Rua das Trincheiras', 555, 'Centro', 'João Pessoa', 'PB'),
('58030040', 'Avenida Cabo Branco', 1234, 'Beira-mar', 'João Pessoa', 'PB'),
('67020030', 'Rua Ó de Almeida', 777, 'Comércio popular', 'Belém', 'PA'),
('67110020', 'Avenida Almirante Barroso', 888, 'Marco', 'Belém', 'PA'),
('78020030', 'Rua Galdino Pimentel', 333, 'Centro Sul', 'Cuiabá', 'MT'),
('78030040', 'Avenida Isaac Póvoas', 1111, 'Praça', 'Cuiabá', 'MT'),
('88020030', 'Rua Padre Roma', 222, 'Centro', 'Florianópolis', 'SC');

INSERT INTO IMOVEL (CNPJ, ID_ENDERECO, CPF_PROPRIETARIO, INTENCAO, TIPO, DESCRICAO) VALUES
('12345678000199', 1, '12345678901', 'Venda', 'Apartamento', 'Apartamento de 2 quartos com vista para o mar na Praça da Sé'),
('12345678000199', 2, '23456789012', 'Aluguel', 'Casa', 'Casa com quintal amplo e piscina no Rio de Janeiro'),
('12345678000199', 3, '34567890123', 'Venda', 'Comercial', 'Sala comercial bem localizada no centro de Belo Horizonte'),
('12345678000199', 4, '45678901234', 'Aluguel', 'Apartamento', 'Apartamento compacto para solteiros em Salvador'),
('12345678000199', 5, '56789012345', 'Venda', 'Casa', 'Casa de condomínio com 3 suítes em Brasília'),
('12345678000199', 6, '67890123456', 'Aluguel', 'Comercial', 'Ponto comercial em área de grande circulação em Curitiba'),
('12345678000199', 7, '78901234567', 'Venda', 'Apartamento', 'Apartamento de luxo com varanda gourmet em Porto Alegre'),
('12345678000199', 8, '89012345678', 'Aluguel', 'Casa', 'Casa geminada com garagem para 2 carros em Recife'),
('12345678000199', 9, '90123456789', 'Venda', 'Comercial', 'Galpão logístico com 500m² em Fortaleza'),
('12345678000199', 10, '01234567890', 'Aluguel', 'Apartamento', 'Kitnet mobiliado próximo ao metrô em Vitória'),
('12345678000199', 11, '11223344556', 'Venda', 'Casa', 'Sobrado com área de lazer completa em Maceió'),
('12345678000199', 12, '22334455667', 'Aluguel', 'Apartamento', 'Apartamento com acabamento de alto padrão em São Luís'),
('12345678000199', 13, '33445566778', 'Venda', 'Comercial', 'Loja em shopping center em Manaus'),
('12345678000199', 14, '44556677889', 'Aluguel', 'Casa', 'Chácara para temporada em Palmas'),
('12345678000199', 15, '55667788990', 'Venda', 'Apartamento', 'Apartamento com vista panorâmica em Cuiabá'),
('12345678000199', 16, '66778899001', 'Aluguel', 'Comercial', 'Escritório corporativo em Florianópolis'),
('12345678000199', 17, '77889900112', 'Venda', 'Casa', 'Casa de praia com acesso direto à areia em Teresina'),
('12345678000199', 18, '88990011223', 'Aluguel', 'Apartamento', 'Studio para estudantes em João Pessoa'),
('12345678000199', 19, '99001112234', 'Venda', 'Comercial', 'Terreno comercial zona norte em Aracaju'),
('12345678000199', 20, '10020030040', 'Aluguel', 'Casa', 'Casa com jardim e espelho d água em Belém'),
('12345678000199', 21, '20030040050', 'Venda', 'Apartamento', 'Apartamento com lazer completo em Manaus'),
('12345678000199', 22, '30040050060', 'Aluguel', 'Comercial', 'Salão de beleza pronto para uso em Luziânia'),
('12345678000199', 23, '40050060070', 'Venda', 'Casa', 'Casa histórica restaurada em Campinas'),
('12345678000199', 24, '50060070080', 'Aluguel', 'Apartamento', 'Apartamento com mobília designer em Ribeirão Preto'),
('12345678000199', 25, '60070080090', 'Venda', 'Comercial', 'Box em centro de convenções em São José do Rio Preto'),
('12345678000199', 26, '70080090100', 'Aluguel', 'Casa', 'Casa com piscina aquecida em Divinópolis'),
('12345678000199', 27, '80090100110', 'Venda', 'Apartamento', 'Apartamento duplex com terraço em Uberlândia'),
('12345678000199', 28, '90010020030', 'Aluguel', 'Comercial', 'Consultório médico em Uberaba'),
('12345678000199', 29, '10020030041', 'Venda', 'Casa', 'Casa com home theater built-in em Vila Velha'),
('12345678000199', 30, '20030040051', 'Aluguel', 'Apartamento', 'Apartamento com varanda ampla em Vitória'),
('12345678000199', 31, '30040050061', 'Venda', 'Comercial', 'Posto de gasolina em Curitiba'),
('12345678000199', 32, '40050060071', 'Aluguel', 'Casa', 'Casa de campo com lareira em Porto Alegre'),
('12345678000199', 33, '50060070081', 'Venda', 'Apartamento', 'Apartamento com vista para o parque em Recife'),
('12345678000199', 34, '60070080091', 'Aluguel', 'Comercial', 'Restaurante montado em Fortaleza'),
('12345678000199', 35, '70080090101', 'Venda', 'Casa', 'Mansão com 5 suítes e piscina em Maceió'),
('12345678000199', 36, '80090100111', 'Aluguel', 'Apartamento', 'Apartamento com climatização central em São Luís'),
('12345678000199', 37, '90010020031', 'Venda', 'Comercial', 'Hotel em funcionamento em Manaus'),
('12345678000199', 38, '10020030042', 'Aluguel', 'Casa', 'Casa container sustentável em Palmas'),
('12345678000199', 39, '20030040052', 'Venda', 'Apartamento', 'Apartamento com energia solar em Cuiabá'),
('12345678000199', 40, '30040050062', 'Aluguel', 'Comercial', 'Loja de conveniência em Florianópolis'),
('12345678000199', 41, '40050060072', 'Venda', 'Casa', 'Casa inteligente com automação em Teresina'),
('12345678000199', 42, '50060070082', 'Aluguel', 'Apartamento', 'Apartamento com portaria 24h em João Pessoa'),
('12345678000199', 43, '60070080092', 'Venda', 'Comercial', 'Supermercado com estoque em Aracaju'),
('12345678000199', 44, '70080090102', 'Aluguel', 'Casa', 'Casa com studio de gravação em Belém'),
('12345678000199', 45, '80090100112', 'Venda', 'Apartamento', 'Apartamento com piscina privativa em Manaus'),
('12345678000199', 46, '90010020032', 'Aluguel', 'Comercial', 'Oficina mecânica equipada em Luziânia'),
('12345678000199', 47, '10020030043', 'Venda', 'Casa', 'Casa com deck de madeira em Campinas'),
('12345678000199', 48, '20030040053', 'Aluguel', 'Apartamento', 'Apartamento com academia privativa em Ribeirão Preto'),
('12345678000199', 49, '30040050063', 'Venda', 'Comercial', 'Franquia em operação em São José do Rio Preto'),
('12345678000199', 50, '40050060073', 'Aluguel', 'Casa', 'Casa com forno de pizza artesanal em Divinópolis');

INSERT INTO FUNCIONARIO (CNPJ, CPF, NOME, TELEFONE) VALUES
('12345678000199', '11122233344', 'Ana Carolina Mendes', '11987654321'),
('12345678000199', '22233344455', 'Bruno Oliveira Santos', '21976543210'),
('12345678000199', '33344455566', 'Carla Rodrigues Lima', '31965432109'),
('12345678000199', '44455566677', 'Diego Almeida Costa', '41954321098'),
('12345678000199', '55566677788', 'Eduarda Silva Pereira', '11943210987'),
('12345678000199', '66677788899', 'Fábio Souza Rocha', '21932109876'),
('12345678000199', '77788899900', 'Gabriela Martins Nunes', '31921098765'),
('12345678000199', '88899900011', 'Henrique Carvalho Dias', '41910987654'),
('12345678000199', '99900011122', 'Isabela Ferreira Alves', '11909876543'),
('12345678000199', '00011122233', 'João Pedro Barbosa', '21998765432'),
('12345678000199', '11122233301', 'Kamila Santos Oliveira', '31987654321'),
('12345678000199', '22233344402', 'Leonardo Costa Silva', '41976543210'),
('12345678000199', '33344455503', 'Mariana Lima Souza', '11965432109'),
('12345678000199', '44455566604', 'Nicolas Pereira Rodrigues', '21954321098'),
('12345678000199', '55566677705', 'Olivia Rocha Martins', '31943210987'),
('12345678000199', '66677788806', 'Paulo Nunes Carvalho', '41932109876'),
('12345678000199', '77788899907', 'Quezia Dias Ferreira', '11921098765'),
('12345678000199', '88899900008', 'Rafael Alves Barbosa', '21910987654'),
('12345678000199', '99900011109', 'Sophia Oliveira Santos', '31909876543'),
('12345678000199', '00011122210', 'Thiago Silva Costa', '41998765432'),
('12345678000199', '12398745611', 'Úrsula Souza Lima', '11987654321'),
('12345678000199', '23409856712', 'Vitor Pereira Rocha', '21976543210'),
('12345678000199', '34510967813', 'Wanessa Martins Nunes', '31965432109'),
('12345678000199', '45621078914', 'Xavier Carvalho Dias', '41954321098'),
('12345678000199', '56732189015', 'Yasmin Ferreira Alves', '11943210987'),
('12345678000199', '67843290116', 'Zacarias Barbosa Oliveira', '21932109876'),
('12345678000199', '78954301217', 'Amanda Santos Silva', '31921098765'),
('12345678000199', '89065412318', 'Bernardo Costa Souza', '41910987654'),
('12345678000199', '90176523419', 'Cecília Lima Pereira', '11909876543'),
('12345678000199', '01287634520', 'Daniel Souza Rocha', '21998765432'),
('12345678000199', '12398745621', 'Elaine Martins Nunes', '31987654321'),
('12345678000199', '23409856722', 'Felipe Carvalho Dias', '41976543210'),
('12345678000199', '34510967823', 'Giovana Ferreira Alves', '11965432109'),
('12345678000199', '45621078924', 'Heitor Barbosa Oliveira', '21954321098'),
('12345678000199', '56732189025', 'Iara Santos Silva', '31943210987'),
('12345678000199', '67843290126', 'Joaquim Costa Souza', '41932109876'),
('12345678000199', '78954301227', 'Kauê Lima Pereira', '11921098765'),
('12345678000199', '89065412328', 'Larissa Souza Rocha', '21910987654'),
('12345678000199', '90176523429', 'Murilo Martins Nunes', '31909876543'),
('12345678000199', '01287634530', 'Nina Carvalho Dias', '41998765432'),
('12345678000199', '11199988831', 'Otávio Ferreira Alves', '11987654321'),
('12345678000199', '22288877732', 'Paula Barbosa Oliveira', '21976543210'),
('12345678000199', '33377766633', 'Quirino Santos Silva', '31965432109'),
('12345678000199', '44466655534', 'Rita Costa Souza', '41954321098'),
('12345678000199', '55555544435', 'Sérgio Lima Pereira', '11943210987'),
('12345678000199', '66644433336', 'Tatiane Souza Rocha', '21932109876'),
('12345678000199', '77733322237', 'Ubirajara Martins Nunes', '31921098765'),
('12345678000199', '88822211138', 'Valentina Carvalho Dias', '41910987654'),
('12345678000199', '99911100039', 'William Ferreira Alves', '11909876543'),
('12345678000199', '00099988840', 'Zélia Barbosa Oliveira', '21998765432');

INSERT INTO USUARIO (CPF, NOME, EMAIL, TELEFONE) VALUES
('12345678901', 'Ana Carolina Silva', 'ana.silva@email.com', '11987654321'),
('23456789012', 'Bruno Oliveira Santos', 'bruno.santos@email.com', '21976543210'),
('34567890123', 'Carla Rodrigues Lima', 'carla.lima@email.com', '31965432109'),
('45678901234', 'Diego Almeida Costa', 'diego.costa@email.com', '41954321098'),
('56789012345', 'Eduarda Pereira Souza', 'eduarda.souza@email.com', '11943210987'),
('67890123456', 'Fábio Rocha Martins', 'fabio.martins@email.com', '21932109876'),
('78901234567', 'Gabriela Nunes Carvalho', 'gabriela.carvalho@email.com', '31921098765'),
('89012345678', 'Henrique Dias Ferreira', 'henrique.ferreira@email.com', '41910987654'),
('90123456789', 'Isabela Alves Barbosa', 'isabela.barbosa@email.com', '11909876543'),
('01234567890', 'João Pedro Oliveira', 'joao.oliveira@email.com', '21998765432'),
('11223344556', 'Kamila Santos Costa', 'kamila.costa@email.com', '31987654321'),
('22334455667', 'Leonardo Lima Souza', 'leonardo.souza@email.com', '41976543210'),
('33445566778', 'Mariana Souza Rodrigues', 'mariana.rodrigues@email.com', '11965432109'),
('44556677889', 'Nicolas Martins Pereira', 'nicolas.pereira@email.com', '21954321098'),
('55667788990', 'Olivia Carvalho Nunes', 'olivia.nunes@email.com', '31943210987'),
('66778899001', 'Paulo Ferreira Dias', 'paulo.dias@email.com', '41932109876'),
('77889900112', 'Quezia Alves Barbosa', 'quezia.barbosa@email.com', '11921098765'),
('88990011223', 'Rafael Oliveira Santos', 'rafael.santos@email.com', '21910987654'),
('99001112234', 'Sophia Costa Lima', 'sophia.lima@email.com', '31909876543'),
('10020030040', 'Thiago Souza Rodrigues', 'thiago.rodrigues@email.com', '41998765432'),
('20030040050', 'Úrsula Pereira Martins', 'ursula.martins@email.com', '11987654321'),
('30040050060', 'Vitor Carvalho Nunes', 'vitor.nunes@email.com', '21976543210'),
('40050060070', 'Wanessa Dias Ferreira', 'wanessa.ferreira@email.com', '31965432109'),
('50060070080', 'Xavier Alves Barbosa', 'xavier.barbosa@email.com', '41954321098'),
('60070080090', 'Yasmin Oliveira Santos', 'yasmin.santos@email.com', '11943210987'),
('70080090100', 'Zacarias Costa Lima', 'zacarias.lima@email.com', '21932109876'),
('80090100110', 'Amanda Souza Rodrigues', 'amanda.rodrigues@email.com', '31921098765'),
('90010020030', 'Bernardo Pereira Martins', 'bernardo.martins@email.com', '41910987654'),
('10020030041', 'Cecília Carvalho Nunes', 'cecilia.nunes@email.com', '11909876543'),
('20030040051', 'Daniel Dias Ferreira', 'daniel.ferreira@email.com', '21998765432'),
('30040050061', 'Elaine Alves Barbosa', 'elaine.barbosa@email.com', '31987654321'),
('40050060071', 'Felipe Oliveira Santos', 'felipe.santos@email.com', '41976543210'),
('50060070081', 'Giovana Costa Lima', 'giovana.lima@email.com', '11965432109'),
('60070080091', 'Heitor Souza Rodrigues', 'heitor.rodrigues@email.com', '21954321098'),
('70080090101', 'Iara Pereira Martins', 'iara.martins@email.com', '31943210987'),
('80090100111', 'Joaquim Carvalho Nunes', 'joaquim.nunes@email.com', '41932109876'),
('90010020031', 'Kauê Dias Ferreira', 'kaue.ferreira@email.com', '11921098765'),
('10020030042', 'Larissa Alves Barbosa', 'larissa.barbosa@email.com', '21910987654'),
('20030040052', 'Murilo Oliveira Santos', 'murilo.santos@email.com', '31909876543'),
('30040050062', 'Nina Costa Lima', 'nina.lima@email.com', '41998765432'),
('40050060072', 'Otávio Souza Rodrigues', 'otavio.rodrigues@email.com', '11987654321'),
('50060070082', 'Paula Pereira Martins', 'paula.martins@email.com', '21976543210'),
('60070080092', 'Quirino Carvalho Nunes', 'quirino.nunes@email.com', '31965432109'),
('70080090102', 'Rita Dias Ferreira', 'rita.ferreira@email.com', '41954321098'),
('80090100112', 'Sérgio Alves Barbosa', 'sergio.barbosa@email.com', '11943210987'),
('90010020032', 'Tatiane Oliveira Santos', 'tatiane.santos@email.com', '21932109876'),
('10020030043', 'Ubirajara Costa Lima', 'ubirajara.lima@email.com', '31921098765'),
('20030040053', 'Valentina Souza Rodrigues', 'valentina.rodrigues@email.com', '41910987654'),
('30040050063', 'William Pereira Martins', 'william.martins@email.com', '11909876543'),
('40050060073', 'Zélia Carvalho Nunes', 'zelia.nunes@email.com', '21998765432');

INSERT INTO RESERVA (CPF_USUARIO, ID_IMOVEL, CHECKIN, CHECKOUT) VALUES
('12345678901', 1, '2024-03-15', '2024-03-20'),
('23456789012', 2, '2024-04-10', '2024-04-15'),
('34567890123', 3, '2024-05-05', '2024-05-10'),
('45678901234', 4, '2024-06-12', '2024-06-18'),
('56789012345', 5, '2024-07-20', '2024-07-25'),
('67890123456', 6, '2024-08-08', '2024-08-15'),
('78901234567', 7, '2024-09-03', '2024-09-10'),
('89012345678', 8, '2024-10-14', '2024-10-21'),
('90123456789', 9, '2024-11-22', '2024-11-28'),
('01234567890', 10, '2024-12-05', '2024-12-12'),
('11223344556', 11, '2025-01-11', '2025-01-17'),
('22334455667', 12, '2025-02-20', '2025-02-27'),
('33445566778', 13, '2025-03-03', '2025-03-09'),
('44556677889', 14, '2025-04-14', '2025-04-20'),
('55667788990', 15, '2025-05-08', '2025-05-15'),
('66778899001', 16, '2025-06-10', '2025-06-16'),
('77889900112', 17, '2025-07-01', '2025-07-07'),
('88990011223', 18, '2025-08-12', '2025-08-19'),
('99001112234', 19, '2025-09-04', '2025-09-11'),
('10020030040', 20, '2025-10-15', '2025-10-22'),
('20030040050', 21, '2025-11-09', '2025-11-16'),
('30040050060', 22, '2025-12-18', '2025-12-25'),
('40050060070', 23, '2024-01-22', '2024-01-29'),
('50060070080', 24, '2024-02-10', '2024-02-17'),
('60070080090', 25, '2024-03-25', '2024-04-01'),
('70080090100', 26, '2024-04-28', '2024-05-06'),
('80090100110', 27, '2024-05-15', '2024-05-22'),
('90010020030', 28, '2024-06-20', '2024-06-27'),
('10020030041', 29, '2024-07-10', '2024-07-17'),
('20030040051', 30, '2024-08-05', '2024-08-12'),
('30040050061', 31, '2024-09-18', '2024-09-25'),
('40050060071', 32, '2024-10-22', '2024-10-29'),
('50060070081', 33, '2024-11-30', '2024-12-07'),
('60070080091', 34, '2024-12-12', '2024-12-19'),
('70080090101', 35, '2025-01-15', '2025-01-22'),
('80090100111', 36, '2025-02-20', '2025-02-27'),
('90010020031', 37, '2025-03-10', '2025-03-17'),
('10020030042', 38, '2025-04-14', '2025-04-21'),
('20030040052', 39, '2025-05-18', '2025-05-25'),
('30040050062', 40, '2025-06-22', '2025-06-29'),
('40050060072', 41, '2025-07-30', '2025-08-06'),
('50060070082', 42, '2025-08-15', '2025-08-22'),
('60070080092', 43, '2025-09-20', '2025-09-27'),
('70080090102', 44, '2025-10-25', '2025-11-01'),
('80090100112', 45, '2025-11-10', '2025-11-17'),
('90010020032', 46, '2025-12-05', '2025-12-12'),
('10020030043', 47, '2024-07-11', '2024-07-18'),
('20030040053', 48, '2024-08-15', '2024-08-22'),
('30040050063', 49, '2024-09-10', '2024-09-17'),
('40050060073', 50, '2024-10-15', '2024-10-22');

INSERT INTO PAGAMENTO (ID_RESERVA, VALOR, DATA_PAGAMENTO, TIPO) VALUES
(1, 1850.00, '2024-03-08', 'PIX'),
(2, 2450.50, '2024-04-03', 'Cartão de Crédito'),
(3, 3200.00, '2024-04-28', 'Boleto'),
(4, 1350.75, '2024-06-05', 'Cartão de Débito'),
(5, 2950.00, '2024-07-13', 'PIX'),
(6, 2050.25, '2024-08-01', 'Cartão de Crédito'),
(7, 3850.00, '2024-08-26', 'Dinheiro'),
(8, 1100.50, '2024-10-07', 'PIX'),
(9, 3350.00, '2024-11-15', 'Cartão de Débito'),
(10, 1500.00, '2024-11-28', 'Boleto'),
(11, 2800.75, '2025-01-04', 'Cartão de Crédito'),
(12, 4050.00, '2025-02-13', 'PIX'),
(13, 2100.25, '2025-02-24', 'Cartão de Débito'),
(14, 1900.00, '2025-04-07', 'Boleto'),
(15, 2400.50, '2025-05-01', 'Cartão de Crédito'),
(16, 3100.00, '2025-06-03', 'PIX'),
(17, 4250.75, '2025-06-24', 'Dinheiro'),
(18, 1250.00, '2025-08-05', 'Cartão de Débito'),
(19, 2000.25, '2025-08-28', 'PIX'),
(20, 3450.00, '2025-10-08', 'Cartão de Crédito'),
(21, 1600.50, '2025-11-02', 'Boleto'),
(22, 2700.00, '2025-12-11', 'PIX'),
(23, 3500.75, '2025-01-23', 'Cartão de Débito'),
(24, 2900.00, '2025-02-03', 'Cartão de Crédito'),
(25, 1800.25, '2024-03-18', 'PIX'),
(26, 4100.00, '2024-04-21', 'Boleto'),
(27, 2200.50, '2024-05-08', 'Cartão de Crédito'),
(28, 3300.00, '2024-06-13', 'PIX'),
(29, 1400.75, '2024-07-03', 'Cartão de Débito'),
(30, 2500.00, '2024-07-29', 'Boleto'),
(31, 3000.25, '2024-09-11', 'Cartão de Crédito'),
(32, 1700.00, '2024-10-15', 'PIX'),
(33, 3800.50, '2024-11-23', 'Dinheiro'),
(34, 2100.00, '2024-12-05', 'Cartão de Débito'),
(35, 2600.75, '2025-01-08', 'PIX'),
(36, 3400.00, '2025-02-13', 'Cartão de Crédito'),
(37, 1500.25, '2025-03-03', 'Boleto'),
(38, 2300.00, '2025-04-07', 'PIX'),
(39, 3200.50, '2025-05-11', 'Cartão de Débito'),
(40, 1900.00, '2025-06-15', 'Cartão de Crédito'),
(41, 2700.75, '2025-07-23', 'PIX'),
(42, 2000.00, '2025-08-08', 'Boleto'),
(43, 3100.25, '2025-09-13', 'Cartão de Crédito'),
(44, 2400.00, '2025-10-18', 'PIX'),
(45, 3600.50, '2025-11-28', 'Dinheiro'),
(46, 1700.00, '2025-12-25', 'Cartão de Débito'),
(47, 2800.75, '2024-07-04', 'PIX'),
(48, 3900.00, '2024-08-08', 'Cartão de Crédito'),
(49, 2100.25, '2024-09-03', 'Boleto'),
(50, 3000.00, '2024-10-08', 'PIX');

INSERT INTO NOTA_FISCAL (ID_PAGAMENTO, DATA_EMISSAO) VALUES
(1, '2024-03-08 10:30:00'),
(2, '2024-04-03 14:15:22'),
(3, '2024-04-28 09:45:33'),
(4, '2024-06-05 16:20:44'),
(5, '2024-07-13 11:10:55'),
(6, '2024-08-01 13:25:11'),
(7, '2024-08-26 15:40:29'),
(8, '2024-10-07 08:55:37'),
(9, '2024-11-15 12:30:48'),
(10, '2024-11-28 17:05:19'),
(11, '2025-01-04 10:50:27'),
(12, '2025-02-13 14:15:36'),
(13, '2025-02-24 09:20:45'),
(14, '2025-04-07 16:45:54'),
(15, '2025-05-01 11:30:03'),
(16, '2025-06-03 13:55:12'),
(17, '2025-06-24 15:10:21'),
(18, '2025-08-05 08:25:30'),
(19, '2025-08-28 12:40:39'),
(20, '2025-10-08 17:15:48'),
(21, '2025-11-02 10:00:57'),
(22, '2025-12-11 14:35:06'),
(23, '2025-01-23 09:50:15'),
(24, '2025-02-03 16:05:24'),
(25, '2024-03-18 11:20:33'),
(26, '2024-04-21 13:45:42'),
(27, '2024-05-08 15:00:51'),
(28, '2024-06-13 08:15:00'),
(29, '2024-07-03 12:30:09'),
(30, '2024-07-29 17:55:18'),
(31, '2024-09-11 10:40:27'),
(32, '2024-10-15 14:05:36'),
(33, '2024-11-23 09:10:45'),
(34, '2024-12-05 16:35:54'),
(35, '2025-01-08 11:50:03'),
(36, '2025-02-13 13:15:12'),
(37, '2025-03-03 15:30:21'),
(38, '2025-04-07 08:45:30'),
(39, '2025-05-11 12:00:39'),
(40, '2025-06-15 17:25:48'),
(41, '2025-07-23 10:10:57'),
(42, '2025-08-08 14:35:06'),
(43, '2025-09-13 09:50:15'),
(44, '2025-10-18 16:15:24'),
(45, '2025-11-28 11:30:33'),
(46, '2025-12-25 13:45:42'),
(47, '2024-07-04 15:00:51'),
(48, '2024-08-08 08:15:00'),
(49, '2024-09-03 12:30:09'),
(50, '2024-10-08 17:55:18');

INSERT INTO ANUNCIO (CNPJ, ID_IMOVEL, REDE, DESCRICAO, VALOR) VALUES
('12345678000199', 1, 'Online', 'Apartamento com vista para o mar no centro de São Paulo', 500.00),
('12345678000199', 2, 'Impresso', 'Casa com piscina no Rio de Janeiro - ótima localização', 750.00),
('12345678000199', 3, 'Online', 'Sala comercial em Belo Horizonte - perfeita para escritório', 300.00),
('12345678000199', 4, 'Tv', 'Kitnet mobiliado em Salvador - próximo ao metrô', 450.00),
('12345678000199', 5, 'Outdoor', 'Casa de condomínio em Brasília - 3 suítes', 1200.00),
('12345678000199', 6, 'Online', 'Ponto comercial em Curitiba - alta circulação', 600.00),
('12345678000199', 7, 'Impresso', 'Apartamento de luxo em Porto Alegre - varanda gourmet', 1500.00),
('12345678000199', 8, 'Online', 'Casa geminada em Recife - garagem para 2 carros', 850.00),
('12345678000199', 9, 'Tv', 'Galpão logístico em Fortaleza - 500m²', 2000.00),
('12345678000199', 10, 'Outdoor', 'Kitnet em Vitória - ideal para estudantes', 350.00),
('12345678000199', 11, 'Online', 'Sobrado em Maceió - área de lazer completa', 950.00),
('12345678000199', 12, 'Impresso', 'Apartamento em São Luís - acabamento de alto padrão', 1100.00),
('12345678000199', 13, 'Online', 'Loja em shopping center de Manaus', 1800.00),
('12345678000199', 14, 'Tv', 'Chácara em Palmas - perfeita para temporada', 1300.00),
('12345678000199', 15, 'Outdoor', 'Apartamento em Cuiabá - vista panorâmica', 700.00),
('12345678000199', 16, 'Online', 'Escritório corporativo em Florianópolis', 900.00),
('12345678000199', 17, 'Impresso', 'Casa de praia em Teresina - acesso direto à areia', 1600.00),
('12345678000199', 18, 'Online', 'Studio em João Pessoa - para estudantes', 400.00),
('12345678000199', 19, 'Tv', 'Terreno comercial em Aracaju - zona norte', 2200.00),
('12345678000199', 20, 'Outdoor', 'Casa em Belém - jardim e espelho d água', 950.00),
('12345678000199', 21, 'Online', 'Apartamento em Manaus - lazer completo', 800.00),
('12345678000199', 22, 'Impresso', 'Salão de beleza em Luziânia - pronto para uso', 550.00),
('12345678000199', 23, 'Online', 'Casa histórica em Campinas - restaurada', 1700.00),
('12345678000199', 24, 'Tv', 'Apartamento em Ribeirão Preto - mobília designer', 1250.00),
('12345678000199', 25, 'Outdoor', 'Box em centro de convenções - São José do Rio Preto', 1900.00),
('12345678000199', 26, 'Online', 'Casa em Divinópolis - piscina aquecida', 1400.00),
('12345678000199', 27, 'Impresso', 'Apartamento duplex em Uberlândia - com terraço', 1600.00),
('12345678000199', 28, 'Online', 'Consultório médico em Uberaba', 750.00),
('12345678000199', 29, 'Tv', 'Casa em Vila Velha - home theater built-in', 1800.00),
('12345678000199', 30, 'Outdoor', 'Apartamento em Vitória - varanda ampla', 950.00),
('12345678000199', 31, 'Online', 'Posto de gasolina em Curitiba', 2500.00),
('12345678000199', 32, 'Impresso', 'Casa de campo em Porto Alegre - com lareira', 1300.00),
('12345678000199', 33, 'Online', 'Apartamento em Recife - vista para o parque', 850.00),
('12345678000199', 34, 'Tv', 'Restaurante montado em Fortaleza', 2100.00),
('12345678000199', 35, 'Outdoor', 'Mansão em Maceió - 5 suítes e piscina', 3000.00),
('12345678000199', 36, 'Online', 'Apartamento em São Luís - climatização central', 1100.00),
('12345678000199', 37, 'Impresso', 'Hotel em Manaus - em funcionamento', 3500.00),
('12345678000199', 38, 'Online', 'Casa container em Palmas - sustentável', 900.00),
('12345678000199', 39, 'Tv', 'Apartamento em Cuiabá - energia solar', 1200.00),
('12345678000199', 40, 'Outdoor', 'Loja de conveniência em Florianópolis', 650.00),
('12345678000199', 41, 'Online', 'Casa inteligente em Teresina - automação', 1700.00),
('12345678000199', 42, 'Impresso', 'Apartamento em João Pessoa - portaria 24h', 1000.00),
('12345678000199', 43, 'Online', 'Supermercado em Aracaju - com estoque', 2800.00),
('12345678000199', 44, 'Tv', 'Casa em Belém - studio de gravação', 1900.00),
('12345678000199', 45, 'Outdoor', 'Apartamento em Manaus - piscina privativa', 1500.00),
('12345678000199', 46, 'Online', 'Oficina mecânica em Luziânia - equipada', 1600.00),
('12345678000199', 47, 'Impresso', 'Casa em Campinas - deck de madeira', 1300.00),
('12345678000199', 48, 'Online', 'Apartamento em Ribeirão Preto - academia privativa', 1400.00),
('12345678000199', 49, 'Tv', 'Franquia em São José do Rio Preto - em operação', 3200.00),
('12345678000199', 50, 'Outdoor', 'Casa em Divinópolis - forno de pizza artesanal', 1100.00);

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

"1. 5 consultas com SELECT e WHERE (10 pts)"

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

"2. 5 consultas com GROUP BY e ORDER BY com funções de agregação (10 pts)"

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
        
"3. 5 consultas com operadores aritméticos (5 pts)"

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

-- Calcular 2% de comissão sobre o valor dos anúncios.

"4. 5 consultas com operadores de comparação (5 pts)"

-- Selecionar imóveis com valor de anúncio superior a R$ 2000.

-- Reservas com mais de 7 dias de duração.

-- Pagamentos com valor diferente de R$ 1500.

-- Anúncios com valor menor que a média geral.

-- Funcionários com ID_FUNCIONARIO entre 10 e 20.

"5. 5 consultas com operadores lógicos (AND, OR) (5 pts)"

-- Imóveis para aluguel do tipo 'Apartamento' ou 'Casa'.

-- Reservas em 2024 com valor superior a R$ 2000 ou duração maior que 5 dias.

-- Usuários com telefone da região 11 (SP) ou 21 (RJ).

-- Anúncios online com valor entre R$ 500 e R$ 1500.

-- Pagamentos via 'Boleto' ou 'Dinheiro' com valor inferior a R$ 1000.

"6. 2 consultas com operadores lógicos e negação (NOT) (3 pts)"

-- Imóveis que não são do tipo 'Comercial'.

-- Reservas que não foram pagas com 'Cartão de Crédito'.

"7. 10 consultas com operadores auxiliares (IS NULL, BETWEEN, LIKE, IN) (10 pts)"

-- Endereços com complemento nulo.

-- Reservas com check-in entre Janeiro e Março de 2024.

-- Proprietários com 'Silva' no nome.

-- Imóveis localizados em SP ou RJ.

-- Usuários com email do domínio '@email.com'.

-- Pagamentos com valores entre R$ 1000 e R$ 2000.

-- Funcionários com nomes começando com 'A'.

-- Anúncios com descrição contendo 'luxo'.

-- Reservas feitas por usuários específicos (CPF IN (...)).

-- Notas fiscais emitidas em um período específico.

"8. 5 consultas com funções de agregação (SUM(), AVG(), etc.) (5 pts)"

-- Soma total investida em anúncios.

-- Valor médio das reservas.

-- Maior valor de pagamento registrado.

-- Número total de imóveis por cidade.

-- Média de valor dos anúncios por tipo de imóvel.

"9. 5 consultas com funções de datas (NOW(), DATE(), YEAR(), etc.) (5 pts)
Reservas do mês atual."

-- Idade dos funcionários (se data_nascimento existisse) - usar data_emissao como exemplo.

-- Pagamentos realizados no último trimestre.

-- Anúncios veiculados no ano anterior.

-- Dias até o check-in das reservas futuras.

"10. 5 sub-consultas com agrupamento e união de dados (10 pts)"

-- Imóveis com valor de anúncio acima da média.

-- Usuários com mais reservas que a média.

-- Proprietários com quantidade de imóveis maior que 2.

-- Redes de anúncio com investimento total superior a R$ 5000.

-- Reservas com valor total maior que a média por tipo de imóvel.

"11. 5 consultas com JOIN e visualização de tabelas (5 pts)"

-- Listar imóveis com seus endereços completos.

-- Mostrar reservas com dados do usuário e imóvel.

-- Pagamentos com informações da reserva e usuário.

-- Anúncios com dados do imóvel e proprietário.

-- Notas fiscais com detalhes do pagamento e reserva.

"12. 10 consultas com tipos de JOIN: INNER, LEFT, RIGHT (10 pts)"

-- INNER JOIN: Imóveis com endereços válidos.

-- LEFT JOIN: Todos os proprietários, mesmo sem imóveis.

-- RIGHT JOIN: Todos os usuários, mesmo sem reservas.

-- INNER JOIN: Reservas com pagamentos realizados.

-- LEFT JOIN: Imóveis mesmo sem anúncios.

-- RIGHT JOIN: Todos os anúncios, mesmo sem imóvel (se aplicável).

-- INNER JOIN: Funcionários com dados da empresa.

-- LEFT JOIN: Reservas mesmo sem nota fiscal.

-- RIGHT JOIN: Pagamentos sem reserva (inválidos).

-- FULL JOIN (simulado): Todos os usuários e proprietários.

"13. Criação de 1 TRIGGER e 1 STORED PROCEDURE (7 pts)"

-- Trigger: Validar data de check-out > check-in antes de inserir reserva.

-- Stored Procedure: Inserir novo usuário com verificações de duplicidade.

"14. Geração do backup do banco de dados (.sql) (5 pts)"
-- Comando para exportar backup completo do banco HABITAE.
