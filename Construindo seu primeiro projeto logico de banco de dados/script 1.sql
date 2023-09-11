-- criação do banco de dados para o cenário de E-commerce
drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente


create table clients (
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

-- desc clients;
-- criar tabela produto

-- size - dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool default false,
    category enum('Eletronico','Vestimento','Brinquendos','Alimentos','Moveis') not null,
    avaliação float default 0,
    size varchar(10)
    -- constraint unique_cpf_client unique	(CPF)
);

create table payments(
	idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable float,
    primary key(idClient, idpayment)
);
 -- criar tabela pedido 
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') not null,
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references Clients(idClient)
			on update cascade
);
 -- desc orders;

 --  criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

 -- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
);

 -- criar tabela vendedor
create table Seller(
	idSeller int auto_increment primary key,
    SocialNme varchar(255) not null,
    AbstName varchar(11) not null,
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQauntity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
	constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

show tables;

show databases;
use information_schema;
show tables;
desc tables_constraints;
select * from referential_constraints;