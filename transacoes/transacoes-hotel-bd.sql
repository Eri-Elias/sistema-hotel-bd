-- O hospede deseja criar uma reserva na hora do check-in
BEGIN;
-- Criar a reserva para o hospede com o ID 3
INSERT INTO reserva (id_hospede, data_checkin, data_checkout, valor_estimado)
VALUES (3, '2026-08-10', '2026-08-15', 750.00);
-- Vincular a reserva criada ao número 5
INSERT INTO reserva_quarto (id_reserva, id_quarto)
VALUES (currval('reserva_id_reserva_seq'), 5);
-- Registrar o pagamento dessa reserva na tabela pai de pagamentos
INSERT INTO pagamento (id_reserva, valor_total)
VALUES (currval('reserva_id_reserva_seq'), 750.00);
-- Especifica que esse pagamento foi feito (via PIX)
INSERT INTO pix (id_pagamento, chave_pix, cod_transacao)
VALUES (currval('pagamento_id_pagamento_seq'), 'hotel@pix.com', 'PIX_RESERVA_XYZ123');
COMMIT;


-- Pagamento do cliente depois o uso da estadia
BEGIN;
-- Registrar o pagamento para uma reserva que já estava ativa no hotel
INSERT INTO pagamento (id_reserva, valor_total)
VALUES (7, 500.00);
-- Inserir a especificação do cartão de crédito vinculando ao pagamento acima
INSERT INTO cartao_credito (id_pagamento, qtd_parcelas)
VALUES (currval('pagamento_id_pagamento_seq'), 3); 
-- currval() retorna o último valor da sequência que foi gerada pela funcao nexval()
-- Atualiza o status do quarto para disponível depois o pagamento
UPDATE quarto 
SET status = TRUE 
WHERE id_quarto = (SELECT id_quarto FROM reserva_quarto WHERE id_reserva = 7);
COMMIT;


-- Tentar selecionar uma reserva e desistir
BEGIN;
-- O atendente seleciona a reserva 6 por engano e tenta deletar o vínculo do quarto
DELETE FROM reserva_quarto WHERE id_reserva = 6;
-- O atendente percebe o erro e desiste da exclusão antes de salvar
ROLLBACK;


-- Desejo de Crescimento
BEGIN;
-- Atualiza o preço da diária da categoria ID 2 (Suite, etc) para um novo valor
-- O dono do hotel deseja aprimorar a diária do quarto, melhorar o que está lá.
UPDATE categoria 
SET preco_diaria = 250.00 
WHERE id_categoria = 2;
COMMIT;


-- Desistencia da compra
BEGIN;
-- O atendente começa a inserir uma nova reserva para o hóspede 2
INSERT INTO reserva (id_hospede, data_checkin, data_checkout, valor_estimado);
VALUES (2, '2026-12-20', '2026-12-25', 900.00);
-- O cliente pode desistir da reserva antes do pagamento ser feito
-- Desfazer a inserçao para que não crie dados fantasmas no sistema do banco de dados
ROLLBACK;