# Modelo de Banco de Dados para E-commerce

## Clientes PJ e PF

Para melhor representar tanto clientes Pessoa Jurídica (PJ) quanto Pessoa Física (PF), introduzimos um sistema de herança/subtipo. Agora, temos três tabelas principais relacionadas a clientes:

- **Clientes**: Esta tabela contém informações comuns a todos os tipos de clientes, como nome, email e senha. Ela serve como a tabela principal de clientes.

- **Clientes_PF**: Criamos uma tabela específica para armazenar informações de clientes PF, incluindo o CPF. Cada registro nesta tabela está vinculado a um cliente na tabela "Clientes" por meio de uma chave estrangeira.

- **Clientes_PJ**: Da mesma forma, introduzimos uma tabela para clientes PJ, que inclui informações como o CNPJ. Também está vinculada à tabela "Clientes" por meio de uma chave estrangeira.

Um cliente pode ser PJ ou PF, mas não ambos. Essa abordagem permite uma representação mais precisa de diferentes tipos de clientes.

## Pagamento

Para acomodar várias formas de pagamento para cada cliente, criamos a tabela "Pagamentos". Cada registro nesta tabela está associado a um cliente por meio de uma chave estrangeira. Isso nos permite registrar diferentes métodos de pagamento para cada cliente.

## Entrega

Introduzimos a tabela "Entregas" para rastrear informações relacionadas aos pedidos de entrega. Ela inclui campos para status de entrega e código de rastreio. Cada registro na tabela "Entregas" está vinculado a um pedido específico por meio de uma chave estrangeira. Esta tabela permite o gerenciamento eficiente de informações de entrega para cada pedido.

## Tabelas

Aqui estão as tabelas principais em nosso esquema de banco de dados atualizado:

1. **Clientes**: Contém informações comuns a todos os clientes.

2. **Clientes_PF**: Armazena informações específicas de clientes PF.

3. **Clientes_PJ**: Armazena informações específicas de clientes PJ.

4. **Pagamentos**: Registra várias formas de pagamento para cada cliente.

5. **Produtos**: Contém informações sobre os produtos oferecidos.

6. **Pedidos**: Registra detalhes de cada pedido, como data e cliente.

7. **Entregas**: Mantém informações sobre o status de entrega e rastreamento de pedidos.

Essas atualizações na modelagem do banco de dados nos permitem representar de maneira mais completa os diferentes tipos de clientes, gerenciar várias formas de pagamento e rastrear informações detalhadas de entrega para cada pedido.

Lembre-se de que essa é uma estrutura inicial e pode ser ajustada com base nos requisitos específicos do seu projeto. Certifique-se de adaptar essas tabelas e relacionamentos de acordo com suas necessidades.
