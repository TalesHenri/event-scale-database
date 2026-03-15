# Event Scale Database

Projeto de modelagem de banco de dados em **PostgreSQL** para gerenciamento de **escalas operacionais baseadas em eventos**.

## Objetivo

Aplicar conceitos de modelagem relacional em um cenário real, incluindo:

- gerenciamento de participantes
- associação de papéis e postos
- geração de escalas por evento
- controle de presença
- registro de substituições
- histórico de notificações

## Tecnologias

- PostgreSQL
- SQL

## Conceitos de Banco de Dados Aplicados

- Modelagem relacional
- Integridade referencial (Foreign Keys)
- Relacionamentos N:N
- Autorrelacionamento
- Constraints (`CHECK`, `UNIQUE`)
- Histórico operacional de eventos

## Estrutura do Banco

Principais entidades modeladas:

- **pessoa**
- **papel**
- **pessoa_papel**
- **gira**
- **escala**
- **posto**
- **alocacao_escala**
- **vinculo_pessoa**
- **presenca_gira**
- **substituicao_escala**
- **notificacao_envio**

## Arquivo do Schema

O arquivo `schema_sistema_centro_ajuda.sql` contém todo o schema necessário para recriar o banco.

Para recriar o banco:

```sql
psql -U usuario -d postgres -f schema_sistema_centro_ajuda.sql
