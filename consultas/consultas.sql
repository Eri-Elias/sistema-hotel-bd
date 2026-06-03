-- Seleciona apenas os quartos ativos
SELECT 
    h.nome_unidade AS hotel,
    COUNT(q.id_quarto) AS quantidade_quartos
FROM hotel h
INNER JOIN quarto q ON h.id_hotel = q.id_hotel
WHERE q.status = TRUE
GROUP BY h.id_hotel, h.nome_unidade
ORDER BY quantidade_quartos DESC;


-- Quais clientes estão no sistema que não possuem cadastro.
SELECT 
    h.id_hospede,
    COALESCE(pf.nome_completo, pj.nome_fantasia, pj.razao_social) AS nome_hospede, -- COALESCE: pega o primeiro nome que não for nulo
    COUNT(r.id_reserva) AS total_reservas
FROM hospede h
LEFT JOIN pessoa_fisica pf ON h.id_hospede = pf.id_hospede
LEFT JOIN pessoa_juridica pj ON h.id_hospede = pj.id_hospede
LEFT JOIN reserva r ON h.id_hospede = r.id_hospede
GROUP BY h.id_hospede, pf.nome_completo, pj.nome_fantasia, pj.razao_social
HAVING COUNT(r.id_reserva) < 1
ORDER BY nome_hospede ASC;


-- Análise de Perfil de Clientes / Separação de Mercado 
SELECT 
    pf.nome_completo AS hospede_pf,
    COUNT(r.id_reserva) AS total_reservas,
    SUM(p.valor_total) AS total_pago
FROM hospede h
INNER JOIN pessoa_fisica pf ON h.id_hospede = pf.id_hospede
INNER JOIN reserva r ON h.id_hospede = r.id_hospede
INNER JOIN pagamento p ON r.id_reserva = p.id_reserva
GROUP BY h.id_hospede, pf.nome_completo
HAVING SUM(p.valor_total) > (
    -- Média do valor total de todos os pagamentos do hotel - SQ 
    SELECT AVG(valor_total) FROM pagamento
)
ORDER BY total_pago DESC;


-- Faturamento por quarto
SELECT 
    c.nome_categoria AS categoria_quarto,
    COUNT(DISTINCT r.id_reserva) AS total_reservas,
    SUM(p.valor_total) AS faturamento_total
FROM categoria c
INNER JOIN quarto q ON c.id_categoria = q.id_categoria
INNER JOIN reserva_quarto rq ON q.id_quarto = rq.id_quarto
INNER JOIN reserva r ON rq.id_reserva = r.id_reserva
INNER JOIN pagamento p ON r.id_reserva = p.id_reserva
GROUP BY c.id_categoria, c.nome_categoria
ORDER BY faturamento_total DESC;


-- Identificar maior ocupação por andar
SELECT 
    h.nome_unidade AS hotel,
    q.andar,
    COUNT(rq.id_quarto) AS quartos_reservados_no_andar
FROM hotel h
INNER JOIN quarto q ON h.id_hotel = q.id_hotel
INNER JOIN reserva_quarto rq ON q.id_quarto = rq.id_quarto
GROUP BY h.id_hotel, h.nome_unidade, q.andar
HAVING COUNT(rq.id_quarto) > 5
ORDER BY h.nome_unidade ASC, q.andar ASC;


-- Ranking dos meios de pagamento mais utilizados
SELECT 
    CASE 
        WHEN px.id_pagamento IS NOT NULL THEN 'PIX'
        WHEN cc.id_pagamento IS NOT NULL THEN 'Cartão de Crédito'
        WHEN d.id_pagamento IS NOT NULL THEN 'Dinheiro em Espécie'
        ELSE 'Não Especificado'
    END AS meio_pagamento,
    COUNT(p.id_pagamento) AS quantidade_transacoes,
    SUM(p.valor_total) AS total_arrecadado
FROM pagamento p
LEFT JOIN pix px ON p.id_pagamento = px.id_pagamento
LEFT JOIN cartao_credito cc ON p.id_pagamento = cc.id_pagamento
LEFT JOIN dinheiro d ON p.id_pagamento = d.id_pagamento
GROUP BY meio_pagamento
ORDER BY quantidade_transacoes DESC;


-- Mostrar Clientes Jurídicos mais valorizados
-- Pessoa Juridica > todas as pessoas fisicas
SELECT 
    pj.nome_fantasia AS empresa,
    pj.razao_social,
    r.id_reserva,
    r.data_checkin,
    r.valor_estimado AS valor_da_reserva
FROM pessoa_juridica pj
INNER JOIN reserva r ON pj.id_hospede = r.id_hospede
-- Seleciona o valor de todas as reservas de Pessoas Fisicas - SQ
WHERE r.valor_estimado > ALL (
    SELECT res.valor_estimado 
    FROM reserva res
    INNER JOIN pessoa_fisica pf ON res.id_hospede = pf.id_hospede
)
ORDER BY r.valor_estimado DESC;


-- Calcular quanto tempo o hospede ficou no hotel
-- Diaria * Qtd. de tempo = valor total
SELECT 
    r.id_reserva,
    COALESCE(pf.nome_completo, pj.nome_fantasia) AS hospede,
    (r.data_checkout - r.data_checkin) AS quantidade_diarias,
    c.preco_diaria,
    ((r.data_checkout - r.data_checkin) * c.preco_diaria) AS valor_calculado_real,
    r.valor_estimado AS valor_guardado_na_reserva
FROM reserva r
LEFT JOIN pessoa_fisica pf ON r.id_hospede = pf.id_hospede
LEFT JOIN pessoa_juridica pj ON r.id_hospede = pj.id_hospede
INNER JOIN reserva_quarto rq ON r.id_reserva = rq.id_reserva
INNER JOIN quarto q ON rq.id_quarto = q.id_quarto
INNER JOIN categoria c ON q.id_categoria = c.id_categoria
ORDER BY quantidade_diarias DESC;