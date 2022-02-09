-- drop table if exists tb_batch;
-- drop table if exists tb_advertising;
-- drop table if exists tb_inbound_order;
-- drop table if exists tb_section;
-- drop table if exists tb_warehouse;
-- drop table if exists tb_address;
-- drop table if exists tb_hibernate_sequence;
-- drop table if exists tb_product;
-- drop table if exists tb_product_type;
-- drop table if exists tb_purchase_itens;
-- drop table if exists tb_purchase_order;
-- drop table if exists tb_purchase_status;
-- drop table if exists tb_user;'

-- CREATE TABLES ZONE
--
-- CREATE TABLE `tb_address` (
--                            `id` bigint NOT NULL AUTO_INCREMENT,
--                            `city` varchar(255) DEFAULT NULL,
--                            `country` varchar(255) DEFAULT NULL,
--                            `postal_code` int NOT NULL,
--                            `state` varchar(255) DEFAULT NULL,
--                            `street` varchar(255) DEFAULT NULL,
--                            PRIMARY KEY (`id`)
-- ) ;
--
-- CREATE TABLE `tb_product_type` (
--                                 `id` bigint NOT NULL AUTO_INCREMENT,
--                                 `type` varchar(255) DEFAULT NULL,
--                                 PRIMARY KEY (`id`)
-- ) ;
--
-- CREATE TABLE `tb_product` (
--                            `id` bigint NOT NULL AUTO_INCREMENT,
--                            `name` varchar(255) DEFAULT NULL,
--                            `volume` double NOT NULL,
--                            `product_type_id` bigint DEFAULT NULL,
--                            PRIMARY KEY (`id`),
--                            FOREIGN KEY (`product_type_id`) REFERENCES tb_product_type (`id`)
-- );
--
-- CREATE TABLE `tb_user` (
--                            `dtype` varchar(31) NOT NULL,
--                            `id` bigint NOT NULL,
--                            `email` varchar(255) DEFAULT NULL,
--                            `name` varchar(255) DEFAULT NULL,
--                            `password` varchar(255) DEFAULT NULL,
--                            PRIMARY KEY (`id`)
-- ) ;
--
-- CREATE TABLE `tb_advertising` (
--                                `id` bigint NOT NULL AUTO_INCREMENT,
--                                `description` varchar(255) DEFAULT NULL,
--                                `price` decimal(19,2) DEFAULT NULL,
--                                `product_id` bigint DEFAULT NULL,
--                                `seller_id` bigint DEFAULT NULL,
--                                PRIMARY KEY (`id`),
--                                FOREIGN KEY (`product_id`) REFERENCES tb_product (`id`),
--                                FOREIGN KEY (`seller_id`) REFERENCES tb_user (`id`)
-- ) ;
--
-- CREATE TABLE `tb_warehouse` (
--                              `id` bigint NOT NULL AUTO_INCREMENT,
--                              `name` varchar(255) DEFAULT NULL,
--                              `address_id` bigint DEFAULT NULL,
--                              PRIMARY KEY (`id`),
--                              FOREIGN KEY (`address_id`) REFERENCES tb_address (`id`)
-- ) ;
--
-- CREATE TABLE `tb_section` (
--                            `id` bigint NOT NULL AUTO_INCREMENT,
--                            `description` varchar(255) DEFAULT NULL,
--                            `name` varchar(255) DEFAULT NULL,
--                            `temperature` double NOT NULL,
--                            `volume` double NOT NULL,
--                            `product_type_id` bigint DEFAULT NULL,
--                            `representative_id` bigint DEFAULT NULL,
--                            `warehouse_id` bigint DEFAULT NULL,
--                            PRIMARY KEY (`id`),
--                            FOREIGN KEY (`product_type_id`) REFERENCES tb_product_type (`id`),
--                            FOREIGN KEY (`representative_id`) REFERENCES tb_user (`id`),
--                            FOREIGN KEY (`warehouse_id`) REFERENCES tb_warehouse (`id`)
-- ) ;
--
-- CREATE TABLE `tb_inbound_order` (
--                                  `id` bigint NOT NULL AUTO_INCREMENT,
--                                  `creation_date` date DEFAULT NULL,
--                                  `section_id` bigint DEFAULT NULL,
--                                  PRIMARY KEY (`id`),
--                                  FOREIGN KEY (`section_id`) REFERENCES tb_section (`id`)
-- ) ;
--
-- CREATE TABLE `tb_batch` (
--                          `id` bigint NOT NULL AUTO_INCREMENT,
--                          `current_quantity` int NOT NULL,
--                          `current_temperature` double NOT NULL,
--                          `expiration_date` date DEFAULT NULL,
--                          `initial_quantity` int NOT NULL,
--                          `manufacturing_date` date DEFAULT NULL,
--                          `manufacturing_time` time DEFAULT NULL,
--                          `minimum_temperature` double NOT NULL,
--                          `advertising_id` bigint DEFAULT NULL,
--                          `inbound_order_id` bigint DEFAULT NULL,
--                          PRIMARY KEY (`id`),
--                          FOREIGN KEY (`advertising_id`) REFERENCES tb_advertising (`id`),
--                          FOREIGN KEY (`advertising_id`) REFERENCES tb_inbound_order (`id`)
-- ) ;
--
--
--
-- CREATE TABLE `tb_purchase_status` (
--                                    `id` bigint NOT NULL AUTO_INCREMENT,
--                                    `status_code` varchar(255) DEFAULT NULL,
--                                    PRIMARY KEY (`id`)
-- ) ;
--
-- CREATE TABLE `tb_purchase_order` (
--                                   `id` bigint NOT NULL AUTO_INCREMENT,
--                                   `date` date DEFAULT NULL,
--                                   `user_id` bigint DEFAULT NULL,
--                                   `purchase_status_id` bigint DEFAULT NULL,
--                                   PRIMARY KEY (`id`),
--                                   FOREIGN KEY (`user_id`) REFERENCES tb_user (`id`),
--                                   FOREIGN KEY (`purchase_status_id`) REFERENCES tb_purchase_status (`id`)
-- ) ;


-- INSERT ZONE

INSERT INTO tb_product_type (type)
VALUES ('FRESH'),
       ('COLD'),
       ('FREEZE');


INSERT INTO tb_product (name, volume, product_type_id)
VALUES ('Banana Prata', 1, 1),
       ('Banana Nanica', 1, 1),
       ('Melância', 3, 1),
       ('Maçã', 1, 1),
       ('Peça de Carne', 2, 3),
       ('Linguiça', 1, 3),
       ('Sorvete de Chocolate', 1, 3),
       ('Queijo Mussarela', 1, 2),
       ('Salame', 1, 2),
       ('Queijo Mineiro', 1, 2);


INSERT INTO tb_user (dtype, id, email, name, password)
VALUES ('Representative', 1, 'fulano@email.com', 'Fulano', '$2a$10$c68AsV1lai7YKKg5g/QWEevpsIaQit6vsmcz4jPwjSYyTGrRPhvgq'),     -- albertinho123
       ('Representative', 2, 'nathalia@email.com', 'Nathalia', '$2a$10$OfyZEQrKF3zUQ5volj.m3.tNE6899EZKoIrE1LOh8U9I/wW8Ipg5e'), -- nat123
       ('Buyer', 3, 'rod@email.com', 'Rodrigo', '$2a$10$OfyZEQrKF3zUQ5volj.m3.tNE6899EZKoIrE1LOh8U9I/wW8Ipg5e'),                -- nat123
       ('Buyer', 4, 'lua@email.com', 'Luazinho', '$2a$10$OfyZEQrKF3zUQ5volj.m3.tNE6899EZKoIrE1LOh8U9I/wW8Ipg5e'),               -- nat123
       ('Seller', 5, 'aderson@email.com', 'Aderson', '$2a$10$OfyZEQrKF3zUQ5volj.m3.tNE6899EZKoIrE1LOh8U9I/wW8Ipg5e'); -- nat123

INSERT INTO tb_advertising (price, description, product_id, seller_id)
VALUES (20.0, 'Melancia gostosinha nham nham', 3, 5),
       (25.0, 'Sorvetinho gostosinho nham nham', 7, 5),
       (5.0, 'Queijinho gostosinho nham nham', 8, 5),
       (10.0, 'Salaminho gostosinho nham nham', 9, 5),
       (2.50, 'Maçazinha gostosinha nham nham', 4, 5);


INSERT INTO tb_address (street, city, state, country, postal_code)
VALUES ('Av. das Nações Unidas', 'Osasco', 'SP', 'Brasil', 06233200),
       ('Rod. José Carlos Daux', 'Florianópolis', 'SC', 'Brasil', 88032005);


INSERT INTO tb_warehouse (name, address_id)
VALUES ('Armazem Melicidade', 1),
       ('Armazem Floripa', 2);


INSERT INTO tb_section (description, name, temperature, volume, product_type_id, representative_id, warehouse_id)
values ('Setor de Produtos Fresco do Tipo Fruta', 'SETOR01-SP', 15.0, 500, 1, 1, 1),
       ('Setor de Produtos Fresco', 'SETOR02-SP', 18.0, 500, 1, 1, 1),
       ('Setor de Produtos Frios', 'SETOR03-SP', 10.0, 500, 2, 1, 1),
       ('Setor de Produtos Congelados', 'SETOR04-SP', 15.0, 500, 3, 2, 2),
       ('Setor de Produtos Fresco do Tipo Fruta', 'SETOR01-SC', 15.0, 500, 1, 2, 2),
       ('Setor de Produtos Fresco', 'SETOR02-SC', 18.0, 500, 1, 2, 2);


INSERT INTO tb_purchase_status
VALUES (1, 'APPROVED');
INSERT INTO tb_purchase_status
VALUES (2, 'PENDING');
INSERT INTO tb_purchase_status
VALUES (3, 'REJECTED');
INSERT INTO tb_purchase_status
VALUES (4, 'DELIVERED');