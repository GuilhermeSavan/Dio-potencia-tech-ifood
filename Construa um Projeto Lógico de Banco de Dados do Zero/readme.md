# Esquema Lógico para Oficina Automotiva

Neste projeto, apresentamos o esquema lógico para um banco de dados de uma oficina automotiva. O esquema é projetado para lidar com várias entidades principais, incluindo Clientes, Veículos, Serviços, Mecânicos e Ordens de Serviço. Aqui está uma visão geral das principais tabelas e seus campos:

## Clientes:

- **ID**: Chave Primária que identifica exclusivamente cada cliente.
- **Nome**: O nome do cliente.
- **Endereço**: O endereço do cliente.
- **Telefone**: O número de telefone do cliente.
- ... (outros campos relacionados ao cliente)

## Veículos:

- **ID**: Chave Primária que identifica exclusivamente cada veículo.
- **Marca**: A marca do veículo.
- **Modelo**: O modelo do veículo.
- **Ano**: O ano de fabricação do veículo.
- **Placa**: A placa do veículo.
- **ID_Cliente**: Chave Estrangeira que referencia o cliente associado a este veículo.
- ... (outros campos relacionados ao veículo)

## Serviços:

- **ID**: Chave Primária que identifica exclusivamente cada serviço.
- **Descrição**: A descrição do serviço oferecido.
- **Preço**: O preço do serviço.
- ... (outros campos relacionados ao serviço)

## Mecânicos:

- **ID**: Chave Primária que identifica exclusivamente cada mecânico.
- **Nome**: O nome do mecânico.
- **Especialização**: A especialização ou habilidades do mecânico.
- ... (outros campos relacionados ao mecânico)

## Ordens de Serviço:

- **ID**: Chave Primária que identifica exclusivamente cada ordem de serviço.
- **Data**: A data em que a ordem de serviço foi criada.
- **ID_Cliente**: Chave Estrangeira que referencia o cliente associado a esta ordem de serviço.
- **ID_Veiculo**: Chave Estrangeira que referencia o veículo associado a esta ordem de serviço.
- ... (outros campos relacionados à ordem de serviço)

## Itens da Ordem de Serviço:

- **ID**: Chave Primária que identifica exclusivamente cada item da ordem de serviço.
- **ID_Servico**: Chave Estrangeira que referencia o serviço relacionado a este item.
- **ID_Mecanico**: Chave Estrangeira que referencia o mecânico responsável por este item.
- **ID_Ordem_Servico**: Chave Estrangeira que referencia a ordem de serviço à qual este item pertence.
- **Quantidade**: A quantidade deste serviço na ordem.
- ... (outros campos relacionados aos itens da ordem de serviço)