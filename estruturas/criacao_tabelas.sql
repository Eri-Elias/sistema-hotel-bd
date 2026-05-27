-- CREATE TABLE hotel ( 
    id_hotel SERIAL PRIMARY KEY,       
    nome_unidade VARCHAR(100) NOT NULL, 
    cnpj VARCHAR(18) UNIQUE NOT NULL   
); 
  
-- Tabela multivalorada HOTEL_TELEFONE  
CREATE TABLE hotel_telefone ( 
    id_telefone SERIAL PRIMARY KEY, 
    id_hotel INT NOT NULL, 
    telefone_gerencia VARCHAR(15) NOT NULL, 
    -- Vincula o id_hotel a tabela hotel 
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel) ON DELETE CASCADE 
); 
  
-- Tabela CATEGORIA 
CREATE TABLE categoria ( 
    id_categoria SERIAL PRIMARY KEY, 
    nome_categoria VARCHAR(50) NOT NULL,  
    preco_diaria DECIMAL(10, 2) NOT NULL  
); 

-- Tabela QUARTO 
CREATE TABLE quarto ( 
    id_quarto SERIAL PRIMARY KEY,              -- PK 
    id_hotel INT NOT NULL,                     -- FK Hotel 
    id_categoria INT NOT NULL,                 -- FK Categoria 
    numero_quarto SMALLINT NOT NULL,           -- Número do quarto (101, 104, 106, etc) 
    andar SMALLINT NOT NULL,                   -- Andar (1, 2, etc) 
    status BOOLEAN DEFAULT TRUE,               -- TRUE = Ativo | FALSE = Inativo 
    FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel) ON DELETE CASCADE, 
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE RESTRICT 
); 
  
-- Tabela RESERVA 
CREATE TABLE reserva ( 
    id_reserva SERIAL PRIMARY KEY, 
    id_hospede INT NOT NULL, 
    data_checkin DATE NOT NULL, 
    data_checkout DATE NOT NULL, 
    valor_estimado DECIMAL(10, 2) NOT NULL, -- Valor total calculado no momento da reserva
    FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede) ON DELETE RESTRICT 
); 

-- Tabela HOSPEDE 
CREATE TABLE hospede ( 
    id_hospede SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    cpf VARCHAR(14) UNIQUE NOT NULL 
); 
  
-- Tabela N:M RESERVA_QUARTO 
CREATE TABLE reserva_quarto ( 
    id_reserva INT NOT NULL, 
    id_quarto INT NOT NULL, 
    PRIMARY KEY (id_reserva, id_quarto), -- Chave primária composta 
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva) ON DELETE CASCADE, 
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto) ON DELETE RESTRICT 
); 
   
-- Tabela PESSOA_FISICA 
CREATE TABLE pessoa_fisica ( 
    id_hospede INT PRIMARY KEY, 
    nome_completo VARCHAR(100) NOT NULL, 
    rg VARCHAR(20), 
    cpf VARCHAR(14) UNIQUE NOT NULL, 
    -- O ID aqui aponta obrigatoriamente para a tabela hospede 
    FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede) ON DELETE CASCADE 
); 
  
-- Tabela PESSOA_JURIDICA 
CREATE TABLE pessoa_juridica ( 
    id_hospede INT PRIMARY KEY, 
    nome_fantasia VARCHAR(100), 
    razao_social VARCHAR(100) NOT NULL, 
    cnpj VARCHAR(18) UNIQUE NOT NULL, 
    FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede) ON DELETE CASCADE 
); 

-- Tabela MULTIVALORADO HOSPEDE_TELEFONE 
CREATE TABLE hospede_telefone ( 
    id_telefone SERIAL PRIMARY KEY, 
    id_hospede INT NOT NULL, 
    telefone VARCHAR(15) NOT NULL, 
    FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede) ON DELETE CASCADE 
); 
  
-- Tabela MULTIVALORADO HOSPEDE_EMAIL 
CREATE TABLE hospede_email ( 
    id_email SERIAL PRIMARY KEY, 
    id_hospede INT NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede) ON DELETE CASCADE 
); 
  
-- Tabela Pai: PAGAMENTO 
CREATE TABLE pagamento ( 
    id_pagamento SERIAL PRIMARY KEY, 
    id_reserva INT NOT NULL,                  -- Chave Estrangeira da Reserva 
    data_pagamento TIMESTAMP DEFAULT NOW(),   -- Salva a data e a hora exata do pagamento 
    valor_total DECIMAL(10, 2) NOT NULL,       -- Valor final cobrado/pago 
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva) ON DELETE RESTRICT 
); 
  
-- Tabela PIX 
CREATE TABLE pix ( 
    id_pagamento INT PRIMARY KEY, 
    chave_pix VARCHAR(100) NOT NULL, 
    cod_transacao VARCHAR(100) NOT NULL, 
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento) ON DELETE CASCADE 
); 

-- Tabela CARTAO_CREDITO 
CREATE TABLE cartao_credito ( 
    id_pagamento INT PRIMARY KEY, 
    qtd_parcelas SMALLINT NOT NULL DEFAULT 1, 
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento) ON DELETE CASCADE 
); 

-- Tabela DINHEIRO 
CREATE TABLE dinheiro ( 
    id_pagamento INT PRIMARY KEY, 
    valor_recebido DECIMAL(10, 2) NOT NULL, -- Quanto em espécie o cliente entregou 
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento) ON DELETE CASCADE 
); 