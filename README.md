# Sistema de Gestão de Hotéis - Banco de Dados Relacional

## Escopo do Projeto
O sistema visa monitorar e gerenciar a disponibilidade de quartos, perfis de hóspedes, fluxo de reservas e a gestão financeira, garantindo que não haja sobreposição de datas e controlando as finanças adquiridas ao longo do processo.

---

## Tecnologias Utilizadas
* **SGBD:** PostgreSQL (v16+)
* **Interface de Gerenciamento:** pgAdmin 4
* **Modelagem Conceitual:** draw.io / Ferramenta de DER

---

## Diferenciais do Modelo Relacional Implementado
Para atender aos requisitos de negócios complexos de um hotel real, o banco de dados foi normalizado seguindo as regras formais e conta com:
1. **Especialização/Herança:** Aplicada na tabela de Hóspedes (Pessoa Física vs. Pessoa Jurídica) e nos Pagamentos (Pix, Cartão de Crédito e Dinheiro).
2. **Relacionamento Muitos para Muitos (N:M):** Implementado via tabela associativa entre Reservas e Quartos, permitindo que uma única reserva contemple múltiplos quartos simultaneamente.
3. **Atributos Multivalorados Isolados:** Tabelas satélites para telefones e e-mails, garantindo a Primeira Forma Normal (1FN).

---

## Organização do Repositório

O projeto está dividido nas seguintes pastas para facilitar a execução:

* **`/1-estrutura`:** Contém o script SQL de criação de todas as tabelas, chaves primárias, chaves estrangeiras e restrições (`create_tables.sql`).
* **`/2-dados`:** Contém a carga de dados de teste (massa de dados contendo hotéis, quartos, categorias, hóspedes e históricos de reservas e pagamentos).
* **`/3-arquivos e imagens do ML`:** Prints das consultas (`SELECT`) executadas no pgAdmin, comprovando o funcionamento prático do banco e relatórios gerados.