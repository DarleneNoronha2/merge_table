# Processamento de Dados com BigQuery

## Descrição
Este repositório contém um script SQL para realizar operações de **MERGE** no Google BigQuery. O objetivo é comparar dados de uma tabela de origem com uma tabela de destino e atualizar ou inserir registros conforme necessário.

## Funcionalidades
- Utilização do comando `MERGE INTO` para mesclar dados entre tabelas.
- Atualização de registros existentes na `tabela_destino`.
- Inserção de novos registros quando não há correspondência na `tabela_destino`.

## Estrutura do Script
O script realiza as seguintes etapas:
1. **Seleciona** os dados da `tabela_de_comparação`.
2. **Adiciona** novas colunas (`brand` e `business_vertical`) à seleção.
3. **Mescla** os dados na `tabela_destino` com base em condições de correspondência específicas.
4. **Atualiza** os campos quando há correspondência.
5. **Insere** novos registros quando não há correspondência na `tabela_destino`.

## Pré-requisitos
Antes de executar o script, certifique-se de:
- Ter permissões adequadas para leitura e escrita no BigQuery e nas tabelas relacionadas.
- Configurar corretamente as tabelas `tabela_destino` e `tabela_de_comparação`.

## Uso
Para executar o script no BigQuery:
1. Abra o console do BigQuery no Google Cloud.
2. Cole o código SQL no editor de consultas.
3. Execute a consulta para atualizar ou inserir os dados na `tabela_destino`.
4. O script pode ser adicionado em um arquivo no Dataform para orquestração, em uma cheduled Query entre outros.

## Contato
darlene.rno@gmail.com
