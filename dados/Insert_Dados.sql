-- ================================================================================================================
-- Insercao da tabela HOTEL
-- ================================================================================================================
INSERT INTO hotel (nome_unidade, cnpj) 
VALUES 
('Hotel Alvorada Prime', '10.234.567/0001-11'),
('Pousada Mar Azul', '21.345.678/0001-22'),
('Goiânia Palace Hotel', '32.456.789/0001-33'),
('Hotel Plaza Central', '43.567.890/0001-44'),
('Green Valley Resort', '54.678.901/0001-55'),
('Hotel Imperial Paulista', '65.789.012/0001-66'),
('Vila do Mar Hospedagem', '76.890.123/0001-77'),
('Golden Tulip Executive', '87.901.234/0001-88'),
('Hotel Serra Verde', '98.012.345/0001-99'),
('Eco Resort Cerrado', '11.123.456/0001-00'),
('Hotel Urbano Conforto', '22.234.567/0001-11'),
('Pousada das Flores', '33.345.678/0001-22'),
('Atlantic View Hotel', '44.456.789/0001-33'),
('Hotel Bristol Elegance', '55.567.890/0001-44'),
('Solar do Ipê Hotel', '66.678.901/0001-55'),
('Hotel Metropolitan Loft', '77.789.012/0001-66'),
('Pousada Recanto do Sol', '88.890.123/0001-77'),
('Blue Tree Premium', '99.901.234/0001-88'),
('Hotel Oasis Sertanejo', '12.212.345/0001-99'),
('Starlight Business Hotel', '23.323.456/0001-00');


-- ================================================================================================================
-- Insercao da tabela QUARTO
-- ================================================================================================================
INSERT INTO quarto (id_hotel, id_categoria, numero_quarto, andar, status)
VALUES 
-- Quartos do Hotel 1 (Alvorada Prime)
(1, 1, 101, 1, TRUE),
(1, 1, 102, 1, TRUE),
(1, 2, 201, 2, TRUE),

-- Quartos do Hotel 2
(2, 1, 11, 1, TRUE),
(2, 2, 12, 1, FALSE), -- Em manutenção

-- Quartos do Hotel 3
(3, 1, 301, 3, TRUE),
(3, 2, 302, 3, TRUE),

-- Quartos do Hotel 4
(5, 1, 105, 1, TRUE),
(5, 2, 205, 2, TRUE),

-- Quartos do Hotel 5
(6, 2, 110, 1, TRUE),
(6, 2, 120, 1, TRUE),

-- Quartos do Hotel 6 
(7, 1, 401, 4, TRUE),
(7, 2, 402, 4, TRUE),

-- Quartos do Hotel 8
(8, 1, 101, 1, TRUE),
(8, 2, 501, 5, TRUE),
(8, 2, 502, 5, FALSE), -- Em manutenção

-- Quartos do Hotel 9
(9, 1, 201, 2, TRUE),

-- Quartos do Hotel 10
(10, 2, 10, 1, TRUE),

-- Quartos de hotéis variados do 11 ao 20
(11, 1, 101, 1, TRUE),
(13, 2, 202, 2, TRUE),
(15, 1, 303, 3, TRUE),
(17, 2, 404, 4, TRUE),
(18, 1, 101, 1, TRUE),
(19, 2, 202, 2, TRUE),
(20, 2, 1201, 12, TRUE);


-- ================================================================================================================
-- Insercao da tabela CATEGORIA
-- ================================================================================================================
INSERT INTO categoria (id_categoria, nome_categoria, preco_diaria)
VALUES 
(1, 'Standard Solteiro', 120.00),
(2, 'Casal Luxo', 250.00),
(3, 'Suíte Master Family', 450.00),
(4, 'Quarto Econômico Compartilhado', 65.00),
(5, 'Presidencial Premium', 1200.00),
(6, 'Bangalô Vista Mar', 600.00),
(7, 'Chalé Alpino com Lareira', 380.00),
(8, 'Studio Executivo Single', 180.00),
(9, 'Suíte Nupcial C/ Hidro', 550.00),
(10, 'Quarto Duplo Standard', 160.00),
(11, 'Suíte Master Business', 320.00),
(12, 'Dormitório Hostal Feminino', 55.00),
(13, 'Dormitório Hostal Masculino', 55.00),
(14, 'Apartamento Triplo Família', 290.00),
(15, 'Cápsula Tecnológica Individual', 85.00),
(16, 'Suíte Temática Infantil', 400.00),
(17, 'Bangalô Presidencial Piscina', 1500.00),
(18, 'Quarto Adaptado (PCD)', 150.00),
(19, 'Suíte Loft Industrial', 270.00),
(20, 'Cabana Eco-Treehouse', 420.00),
(21, 'Quarto Casal Standard Premium', 210.00),
(22, 'Suíte Real Imperial', 2200.00),
(23, 'Micro-Room Minimalista', 70.00),
(24, 'Suíte Safari Club', 670.00),
(25, 'Penthouse Panorâmica', 1800.00)
ON CONFLICT (id_categoria) DO NOTHING; -- ignorar dados já inseridos


-- ================================================================================================================
-- Insercao da tabela RESERVA
-- ================================================================================================================

INSERT INTO reserva (id_hospede, data_checkin, data_checkout, valor_estimado) 
VALUES 
(1, '2026-06-01', '2026-06-05', 480.00), -- Reserva ID 1 (Hóspede 1 - 4 diárias de 120)
(1, '2026-07-10', '2026-07-12', 500.00), -- Reserva ID 2 (Hóspede 1 - 2 diárias de 250)
(2, '2026-06-15', '2026-06-20', 1250.00), -- Reserva ID 3 (Hóspede 2 - 5 diárias de 250)
(2, '2026-08-01', '2026-08-08', 840.00), -- Reserva ID 4 (Hóspede 2 - 7 diárias de 120)
(1, '2026-09-12', '2026-09-15', 740.00); -- Reserva ID 5 (Hóspede 1 - Combo de quartos)
(3, '2026-06-02', '2026-06-04', 240.00), -- Hóspede 3 (2 diárias de 120)
(4, '2026-06-10', '2026-06-14', 1000.00), -- Hóspede 4 (4 diárias de 250)
(5, '2026-06-18', '2026-06-25', 840.00), -- Hóspede 5 (7 diárias de 120)
(6, '2026-07-01', '2026-07-05', 960.00), -- Hóspede 6 (4 diárias de 240)
(15, '2026-07-05', '2026-07-10', 1250.00), -- Hóspede 15 (Pessoa Jurídica - Evento 
corporativo)
(7, '2026-07-12', '2026-07-14', 500.00), -- Hóspede 7 (2 diárias de 250)
(8, '2026-07-15', '2026-07-22', 840.00), -- Hóspede 8 (7 diárias de 120)
(16, '2026-07-20', '2026-07-23', 750.00), -- Hóspede 16 (Pessoa Jurídica - 3 diárias de 
250)
(9, '2026-08-05', '2026-08-08', 360.00), -- Hóspede 9 (3 diárias de 120)
(10, '2026-08-12', '2026-08-17', 1250.00), -- Hóspede 10 (5 diárias de 250)
(17, '2026-08-15', '2026-08-22', 1680.00), -- Hóspede 17 (Pessoa Jurídica - Longo 
período)
(11, '2026-08-20', '2026-08-22', 240.00), -- Hóspede 11 (2 diárias de 120)
(12, '2026-09-01', '2026-09-05', 1000.00), -- Hóspede 12 (4 diárias de 250)
(18, '2026-09-05', '2026-09-10', 600.00), -- Hóspede 18 (Pessoa Jurídica - Funcionários)
(13, '2026-09-15', '2026-09-17', 480.00), -- Hóspede 13 (2 diárias de 240)
(14, '2026-10-02', '2026-10-09', 840.00), -- Hóspede 14 (7 diárias de 120)
(19, '2026-10-10', '2026-10-15', 1500.00), -- Hóspede 19 (Pessoa Jurídica - Consultores)
(20, '2026-11-01', '2026-11-04', 360.00), -- Hóspede 20 (3 diárias de 120)
(21, '2026-11-12', '2026-11-15', 750.00), -- Hóspede 21 (3 diárias de 250)
(22, '2026-12-20', '2026-12-27', 2100.00); -- Hóspede 22 (Alta temporada de fim de ano)


-- ======================
-- Tabela RESERVA_QUARTO
-- ======================
INSERT INTO reserva_quarto (id_reserva, id_quarto)
VALUES 
(6, 1), 
(7, 3),
(8, 4), 
(9, 5),
(10, 1),
(10, 2);
(11, 3),
(12, 5),
(13, 2),
(14, 1),
(15, 6),
(16, 4),
(17, 7),
(18, 2),
(19, 3),
(20, 4),
(20, 5),
(21, 1),
(22, 6),
(23, 7),
(24, 2),
(25, 3);


-- ================================================================================================================
-- Insercao da tabela PESSOAS
-- ================================================================================================================

-- ================================================================================================================
-- Usuário 2 - Pessoa Física
-- ================================================================================================================
-- Dados Iniciais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, 
end_cep, end_bairro, end_cidade)
VALUES (1, '1995-08-15', 'Av. T-9', '432', '74120-010', 'Setor Bueno', 'Goiânia');

-- Dados Especificos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (1, 'Carlos Silva', '555444-DGPC', '111.222.333-44');

-- Telefone Usuário
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (1, '(62) 98888-5555');

-- Email(s) Usuário
INSERT INTO hospede_email (id_hospede, email) VALUES (1, 'carlos@email.com');
INSERT INTO hospede_email (id_hospede, email) VALUES (1, 'c.silva2104@email.com');

-- ================================================================================================================
-- Usuário 2 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (2, '2012-04-10', 'Av. República do Líbano', '1500', '74110-100', 'Setor Oeste', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (2, 'Tech Solutions', 'Tech Solutions LTDA', '12.345.678/0001-00');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (2, '(62) 3555-9000');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (2, 'contato@techsolutions.com');


-- ================================================================================================================
-- Usuário 3 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (3, '1988-03-22', 'Rua 143', '85', '74175-100', 'Setor Marista', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (3, 'Ana Beatriz Ribeiro', '489211-SPT', '222.333.444-55');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (3, '(62) 98111-2233');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (3, 'anabeatriz@email.com');


-- ================================================================================================================
-- Usuário 4 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (4, '1990-11-05', 'Av. Deputado Jamel Cecílio', '2300', '74810-100', 'Jardim Goiás', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (4, 'Marcos Antônio Souza', '665544-DGPC', '333.444.555-66');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (4, '(62) 99222-4455');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (4, 'marcos.souza@email.com');


-- ================================================================================================================
-- Usuário 5 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (5, '1975-05-14', 'Rua 3', '412', '74015-010', 'Setor Central', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (5, 'Maria das Graças Oliveira', '123456-SSP', '444.555.666-77');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (5, '(62) 98444-7788');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (5, 'maria.graca@email.com');


-- ================================================================================================================
-- Usuário 6 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (6, '2000-01-30', 'Av. Universitária', '120', '74605-010', 'Setor Universitário', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (6, 'Lucas Gabriel Costa', '998877-SSP', '555.666.777-88');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (6, '(62) 99111-0011');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (6, 'lucas.costa@email.com');


-- ================================================================================================================
-- Usuário 7 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (7, '1982-07-19', 'Av. Independência', '3400', '74045-010', 'Setor Aeroporto', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (7, 'Juliana Mendes Vieira', '543210-DGPC', '666.777.888-99');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (7, '(62) 98222-3344');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (7, 'ju.mendes@email.com');


-- ================================================================================================================
-- Usuário 8 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (8, '1993-09-11', 'Rua T-53', '99', '74215-130', 'Setor Bueno', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (8, 'Rodrigo Alves Pereira', '887766-SSP', '777.888.999-00');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (8, '(62) 98777-6655');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (8, 'rodrigo.alves@email.com');


-- ================================================================================================================
-- Usuário 9 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (9, '1968-12-25', 'Av. Circular', '740', '74823-020', 'Setor Pedro Ludovico', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (9, 'Camila Rodrigues Lima', '334455-SSP', '888.999.000-11');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (9, '(62) 99333-8899');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (9, 'camila.lima@email.com');


-- ================================================================================================================
-- Usuário 10 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (10, '1997-04-03', 'Av. São João', 'S/N', '74932-150', 'Cruzeiro do Sul', 'Aparecida de Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (10, 'Bruno Henrique Ferreira', '776655-DGPC', '999.000.111-22');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (10, '(62) 98555-1122');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (10, 'bruno.ferreira@email.com');


-- ================================================================================================================
-- Usuário 11 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (11, '1985-06-08', 'Rua 90', '450', '74180-050', 'Setor Sul', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (11, 'Fernanda Gomes Silva', '223344-SSP', '123.456.789-00');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (11, '(62) 99444-5566');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (11, 'fernanda.gomes@email.com');


-- ================================================================================================================
-- Usuário 12 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (12, '1992-02-28', 'Av. C-104', '12', '74240-040', 'Jardim América', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (12, 'Rafael Martins Rocha', '667788-DGPC', '234.567.890-11');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (12, '(62) 98123-4567');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (12, 'rafael.rocha@email.com');


-- ================================================================================================================
-- Usuário 13 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (13, '1979-10-17', 'Rua 4', '51', '74015-020', 'Setor Central', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (13, 'Patrícia Barbosa Lima', '112233-SSP', '345.678.901-22');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (13, '(62) 98666-3322');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (13, 'patricia.barbosa@email.com');


-- ================================================================================================================
-- Usuário 14 - Pessoa Física
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (14, '2002-08-24', 'Av. Perimetral Norte', '8000', '74445-190', 'Setor Perim', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_fisica (id_hospede, nome_completo, rg, cpf)
VALUES (14, 'Gabriel Almeida Santos', '445566-SSP', '456.789.012-33');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (14, '(62) 99555-7788');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (14, 'gabriel.almeida@email.com');


-- ================================================================================================================
-- Usuário 15 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (15, '2005-05-20', 'Av. T-63', '1200', '74230-100', 'Setor Bueno', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (15, 'Alimentos Premium', 'Premium Distribuidora de Alimentos S.A.', '98.765.432/0001-99');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (15, '(62) 3211-4400');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (15, 'comercial@premiumalimentos.com');


-- ================================================================================================================
-- Usuário 16 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (16, '2015-08-12', 'Av. D', '45', '74150-040', 'Setor Marista', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (16, 'Consultoria Alfa', 'Alfa Consultoria e Gestão Empresarial LTDA', '11.222.333/0001-44');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (16, '(62) 3944-1122');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (16, 'contato@alfaconsultoria.com');


-- ================================================================================================================
-- Usuário 17 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (17, '1998-02-10', 'Av. Anhanguera', '5400', '74040-010', 'Setor Oeste', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (17, 'Farma Vida', 'Drogaria e Farmácia Vida Saudável LTDA', '22.333.444/0001-55');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (17, '(62) 3522-8888');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (17, 'financeiro@farmavida.com');


-- ================================================================================================================
-- Usuário 18 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (18, '2010-10-30', 'Rua 85', '190', '74160-010', 'Setor Sul', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (18, 'Goiás Transportes', 'TransGoiás Logística e Transportes EIRELI', '33.444.555/0001-66');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (18, '(62) 3633-9900');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (18, 'sac@transgoias.com');


-- ================================================================================================================
-- Usuário 19 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (19, '2020-01-15', 'Av. 136', '960', '74175-030', 'Setor Marista', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (19, 'Inova Marketing', 'Inova Agência de Marketing Digital LTDA', '44.555.666/0001-77');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (19, '(62) 3999-5566');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (19, 'atendimento@inovamkt.com');


-- ================================================================================================================
-- Usuário 20 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (20, '2013-06-04', 'Av. Rio Verde', 'M04', '74915-515', 'Vila Rosa', 'Aparecida de Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (20, 'Metalúrgica Central', 'Central de Estruturas Metálicas LTDA', '55.666.777/0001-88');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (20, '(62) 3288-1155');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (20, 'vendas@metalurgicacentral.com');


-- ================================================================================================================
-- Usuário 21 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (21, '2008-09-18', 'Av. Paranaíba', '1050', '74015-120', 'Setor Central', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (21, 'Pádua Advocacia', 'Pádua & Associados Advocacia S/S', '66.777.888/0001-99');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (21, '(62) 3223-7744');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (21, 'recepcao@paduaadv.com');


-- ================================================================================================================
-- Usuário 22 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (22, '2011-11-22', 'Rua T-36', '310', '74223-050', 'Setor Bueno', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (22, 'Construtora Sol', 'Sol Engenharia e Construções LTDA', '77.888.999/0001-00');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (22, '(62) 3922-3344');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (22, 'engenharia@construtorasol.com');


-- ================================================================================================================
-- Usuário 23 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (23, '2017-03-08', 'Av. Portugal', '789', '74140-020', 'Setor Oeste', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (23, 'Bella Estética', 'Centro de Estética Bella Donna EIRELI', '88.999.000/0001-11');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (23, '(62) 3541-2233');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (23, 'contato@bellaestetica.com');


-- ================================================================================================================
-- Usuário 24 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (24, '2003-07-26', 'Rua 9', '432', '74110-110', 'Setor Oeste', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (24, 'Contabilidade Cerrado', 'Cerrado Contadores Associados LTDA', '99.000.111/0001-22');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (24, '(62) 3215-6677');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (24, 'diretoria@cerradocontabil.com');


-- ================================================================================================================
-- Usuário 25 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (25, '2019-05-12', 'Av. B', '88', '74110-030', 'Setor Oeste', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (25, 'Goiania Tech', 'Goiania Tecnologia da Informacao LTDA', '12.234.567/0001-89');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (25, '(62) 3412-9090');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (25, 'suporte@goianiatech.com');


-- ================================================================================================================
-- Usuário 26 - Pessoa Jurídica
-- ================================================================================================================
-- Dados Gerais
INSERT INTO hospede (id_hospede, data_nascimento, end_logradouro, end_numero, end_cep, end_bairro, end_cidade)
VALUES (26, '2014-02-28', 'Av. T-10', '250', '74223-060', 'Setor Bueno', 'Goiânia');

-- Dados Específicos
INSERT INTO pessoa_juridica (id_hospede, nome_fantasia, razao_social, cnpj)
VALUES (26, 'Livraria Conhecimento', 'Livraria e Papelaria Conhecimento LTDA', '23.345.678/0001-90');

-- Telefone
INSERT INTO hospede_telefone (id_hospede, telefone) VALUES (26, '(62) 3933-4455');

-- Email(s)
INSERT INTO hospede_email (id_hospede, email) VALUES (26, 'vendas@livrariaconhecimento.com');


-- ================================================================================================================
-- TABELA PAI: PAGAMENTO
-- ================================================================================================================
INSERT INTO pagamento (id_reserva, valor_total)
VALUES 
(6, 480.00), 
(7, 500.00), 
(8, 1250.00),
(9, 360.00),
(10, 1250.00),
(11, 240.00),
(12, 1000.00),
(13, 480.00),
(14, 840.00),
(15, 1250.00),
(16, 750.00),
(17, 1680.00),
(18, 600.00),
(19, 1500.00),
(20, 360.00),
(21, 750.00),
(22, 2100.00),
(23, 240.00),
(24, 1000.00),
(25, 840.00),
(26, 960.00),
(27, 500.00),
(28, 840.00),
(29, 750.00),
(30, 360.00);


-- ================================================================================================================
-- Insert de DINHEIRO
-- ================================================================================================================
INSERT INTO dinheiro (id_pagamento, valor_recebido) 
VALUES 
(4, 500.00);
(7, 360.00),
(10, 1000.00),
(13, 1300.00),
(16, 400.00),
(19, 2100.00),
(22, 840.00),
(25, 750.00);


-- ================================================================================================================
-- Insert PIX
-- ================================================================================================================
INSERT INTO pix (id_pagamento, chave_pix, cod_transacao) 
VALUES 
(5, 'hotelcentral@email.com', 'TX_PIX_998877665544A');
(8, 'hotelcentral@email.com', 'TX_PIX_001'),
(11, 'hotelcentral@email.com', 'TX_PIX_002'),
(14, 'hotelcentral@email.com', 'TX_PIX_003'),
(17, 'hotelcentral@email.com', 'TX_PIX_004'),
(20, 'hotelcentral@email.com', 'TX_PIX_005'),
(23, 'hotelcentral@email.com', 'TX_PIX_006'),
(26, 'hotelcentral@email.com', 'TX_PIX_007'),
(28, 'hotelcentral@email.com', 'TX_PIX_008');


-- ================================================================================================================
-- Insert CARTAO
-- ================================================================================================================
INSERT INTO cartao_credito (id_pagamento, qtd_parcelas) 
VALUES 
(6, 5);
(9, 1),
(12, 3),
(15, 2),
(18, 6),
(21, 4),
(24, 1),
(27, 5)