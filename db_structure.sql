
CREATE DATABASE bits_and_sound;
USE bits_and_sound;

DROP TABLE IF EXISTS `genres`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `user_category`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `carts`;
DROP TABLE IF EXISTS `invoices_products`;
DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `products` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT " ",
  `artist` varchar(50) NOT NULL,
  `id_genre` integer,
  `year` integer,
  `price` numeric(10,2),
  `type` varchar(10),
  `image` varchar(100)
);

CREATE TABLE `users` (
  `id` varchar(32) PRIMARY KEY,
  `lastname` varchar(50),
  `firstname` varchar(50),
  `email` varchar(50),
  `password` varchar(72),
  `id_category` integer,
  `image` varchar(100)
);

CREATE TABLE `users_category` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(20)
);

CREATE TABLE `carts` (
  `id_user` varchar(32),
  `id_product` integer
);

CREATE TABLE `genres` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `genre` varchar(20)
);

CREATE TABLE `invoices` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_user` varchar(32),
  `invoice` char(15),
  `date` timestamp DEFAULT (now())
);


CREATE TABLE `invoices_products` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `id_invoice` integer NOT NULL,
  `id_product` integer NOT NULL,
  `price` numeric(12,2)
);

ALTER TABLE `carts` ADD FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
ALTER TABLE `carts` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
ALTER TABLE `products` ADD FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id`);
ALTER TABLE `users` ADD FOREIGN KEY (`id_category`) REFERENCES `users_category` (`id`);
ALTER TABLE `invoices_products` ADD FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id`);
ALTER TABLE `invoices` ADD FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

-- ESTO A CONTINUACIÓN TAMBIÉN ESTA EN db_data.sql (para poblar la base)

INSERT INTO users_category (category) VALUES ('User');
INSERT INTO users_category (category) VALUES ('Admin');

INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('0fc9f8a1-c3a9-4c92-ad49-83492bfff84e', 1,'Pilley', 'Lind', 'lpilley0@newyorker.com', '$2b$12$7qK.wcmKdh/3rOXBK9EuX.2Tmd7BYUXXsmEAp9huyC61hySyfCf.y', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('c6fa0b2a-c107-4b46-9101-e353112e2556', 1,'Biernat', 'Romeo', 'rbiernat1@telegraph.co.uk', '$2b$12$QYwDdgW/21W4NAw93u4cXumcqZXxVDs/YpEE.eM02ti.KaMzlb55m', 'http://dummyimage.com/158x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('c25cac0d-62e5-4de7-a323-d4cd1ed97824', 1,'Hundal', 'Esme', 'ehundal2@princeton.edu', '$2b$12$NKnRVNUu0yYUNfKETrN1te8b3kxI7s5cSRqcd21Tcgc5uoAT4h4wW', 'http://dummyimage.com/132x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('b31ba8df-0b2f-4be3-bae6-294e9d6ccc38', 1,'Lesslie', 'Dimitry', 'dlesslie3@msn.com', '$2b$12$k6CUG3pU83dkwb.4YlYzPOOEFpjFX2A.LCAGkgH5IMDfeSBXso5ce', 'http://dummyimage.com/193x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('459713e8-a616-40e4-a546-54107bae6034', 1,'Brainsby', 'Garnet', 'gbrainsby4@paypal.com', '$2b$12$XLD7yfnCNGmEJfY7g7nmCuuCPZR2eRc6rh87oHer0l2DuXJrMm.uO', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('dac40229-c421-4535-9853-0c529afc53af', 1,'Whiten', 'Carlye', 'cwhiten5@ifeng.com', '$2b$12$M4jUkohjSbIC9MKzk1KxAuegP8qcEKDLzXJZu4RMCN29cCggm8Ria', 'http://dummyimage.com/133x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('9f3972b9-2d2f-46f5-96a2-98f778cf2383', 1,'Corah', 'Esmaria', 'ecorah6@github.io', '$2b$12$OfqVa.ytkMxkTFRxnGEsWe94dmR2ZPRR5ZfUfuPK66BGv1H1OehxW', 'http://dummyimage.com/141x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('7bfcca87-15ff-4e42-9a11-e1efb73376e9', 1,'Bramstom', 'Liv', 'lbramstom7@woothemes.com', '$2b$12$moOSSt4HzgQmV9b3VILNLukA2XuZoiG7jSktcJJnc44Kzi5tH0s4G', 'http://dummyimage.com/122x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('754900a5-101e-4902-be87-537ac9d48884', 1,'Brockelsby', 'Delphine', 'dbrockelsby8@unicef.org', '$2b$12$8tYtkIbmdBHMZqd0AeNVR.QdXBsx5B6meZrcP44DNGxl1iwdDlNAK', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('ff765472-06d9-439b-96f5-3115c8ec0fe4', 1,'Robet', 'Fitzgerald', 'frobet9@chronoengine.com', '$2b$12$xA/Ap5WHeSHzMoZugA4XNu25iag4FkRbXv161fRyLURUQkxSgN7d.', 'http://dummyimage.com/247x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('81da5292-8dd5-495b-8296-e87a63701d12', 1,'Blanpein', 'Opaline', 'oblanpeina@domainmarket.com', '$2b$12$uvFqTvtap6PMZvf8sUgL2O5GHZ71J9urGrSxkytXPdc8cF13PTL12', 'http://dummyimage.com/122x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('7906ab88-b689-41b2-8e11-6af486d85c25', 1,'Shevill', 'Bone', 'bshevillb@rediff.com', '$2b$12$JIcQMl90DvULyQNOujTcx.s2Hx.6glSatygb.O4wEwBRJWhGpgbby', 'http://dummyimage.com/187x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('f181b76e-4ea3-45f8-aeb8-415c721dcd18', 1,'Shingfield', 'Reggi', 'rshingfieldc@biblegateway.com', '$2b$12$T13I677sUdHF9QFhzye8fuCrT0krIFGRStKezJW95Z3cMfsswNJRm', 'http://dummyimage.com/241x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('fbd02216-3564-4339-8636-4160745bf0f0', 1,'Bromley', 'Jacquie', 'jbromleyd@hubpages.com', '$2b$12$J2fzgjz6fQCW7L.gBU5K0eOikAAYgP4eglP4eV3E3ISx2JvsamnUK', 'http://dummyimage.com/197x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('8e7847f1-a9b3-43d9-a8ac-ab1559ef0a5a', 1,'Beverstock', 'Aldric', 'abeverstocke@jugem.jp', '$2b$12$/v6wKcykBP5tbfAw35PIiOa12cLIldaA1xeSZhysnVjvo3.zNJ8Pi', 'http://dummyimage.com/214x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('5134a7e0-a887-405e-89b8-2aa2cb7d2862', 1,'Tomczykiewicz', 'Cad', 'ctomczykiewiczf@alibaba.com', '$2b$12$IUFrDbyIAJrad0WISLSoDe8v8OHm3SKpe8RTyQuHvXPX1PMzt0xkq', 'http://dummyimage.com/143x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('2de96b84-9820-4c78-83ae-c20b6f5a2320', 1,'Gales', 'Osmond', 'ogalesg@multiply.com', '$2b$12$AE/LCwfGnyKSbitMAxtF9eWvcG1AMBHcCBG3LZaCDm.vqCujQyqSi', 'http://dummyimage.com/220x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('9f5eed2f-2ca1-49cf-818d-0175a4b2c860', 1,'Yarrall', 'Dorena', 'dyarrallh@washingtonpost.com', '$2b$12$gK3FIm9MWHdcNvbwh8at8u.5mwDC0I09IJtI2ATVkXrol1tgAQfhW', 'http://dummyimage.com/178x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('76b1affd-fb29-4918-a588-620a0ee46da5', 1,'Pipes', 'Coretta', 'cpipesi@psu.edu', '$2b$12$0Qu8HmBRWd1T5FZKnxXo1uZVv3dXpSH1oWTWlTw4tgjScoDavH3Je', 'http://dummyimage.com/202x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('0a17acd9-7ec9-41a0-8713-f13db74e356c', 1,'Yurchishin', 'Karlik', 'kyurchishinj@drupal.org', '$2b$12$52g5tF2MPEuEQcF4QEmrjuFNim4zorhEur3k4hPlU1m4sXlLoiSqO', 'http://dummyimage.com/199x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('53988690-8a46-4528-897a-287ca0a3c765', 1,'Gartshore', 'Marcus', 'mgartshorek@godaddy.com', '$2b$12$gJJhZXT5U8ALUcS.xFd0J.PrxHg.mSQ3kOzXWIVpx0F9BA4CxtgEa', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('4c668891-da55-4bd7-bc1a-ff3d1e2ee19e', 1,'Pidduck', 'Louella', 'lpidduckl@mapy.cz', '$2b$12$3MPWGxMY8qYmdQpsWf4jdutzcWt.wbJejV32cKCmyXqe26jC64LaW', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('4a22d48d-939f-476f-a7c9-2b5192d57ba4', 1,'Sweatman', 'Packston', 'psweatmanm@china.com.cn', '$2b$12$Ur5PYByANyuepXiQL8f3..x52ybT/ujcF8vg7iYoExmlX0JKvnr6q', 'http://dummyimage.com/194x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('f690d5b0-ebcd-497d-9119-c197a097085e', 1,'Truckell', 'Egbert', 'etruckelln@facebook.com', '$2b$12$mTXesR82iFQJ4at7GuLYhe.slKHN.QGT3GNp0zLpGc.bgdCvTw2JO', 'http://dummyimage.com/180x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('dc9e3bff-2e0a-4b54-802c-1b03f03b8bc9', 1,'Whiffin', 'Zelig', 'zwhiffino@berkeley.edu', '$2b$12$To0ppFM5AiRkCzf6KYHzfeqWe5lBYavW5tbEKl.93MPZc31iVARMi', 'http://dummyimage.com/136x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('fda9eda3-4637-4c20-befd-6e00a680ac5e', 1,'Aleksidze', 'Boycey', 'baleksidzep@dagondesign.com', '$2b$12$b8xPOHs95Hk.asB1098Y0eqGQqXAtSm9mmvMiAGaZBDUOZq4iwC8i', 'http://dummyimage.com/235x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('a318233c-ae79-4d53-a769-cd22c97d2469', 1,'McClune', 'Kaine', 'kmccluneq@prweb.com', '$2b$12$r/qBTUtTkJWUjga7nUbM1uHSshC8xeO4v1Ug5P3SGIT/.R.5MBva2', 'http://dummyimage.com/134x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('6b9d6a82-2d13-4f8b-baec-72c3c35c1e78', 1,'Naisbet', 'Brier', 'bnaisbetr@admin.ch', '$2b$12$3ewV5uWFwglrU18eRV3t4eC8UvZ9U0Wk/PMRwe7/d1It0TL7SQdSW', 'http://dummyimage.com/109x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('b9d244db-0ede-4d58-bba6-feb7225d31e3', 1,'Pottes', 'Christiane', 'cpottess@ibm.com', '$2b$12$jjGXlqMXpFvUOhjgY9rBsuk9nPy65Avwex.VWbpXPf6eRs/EAYmOm', 'http://dummyimage.com/196x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('eedc4bf7-13d4-4b7e-962a-a8b8f2381ad0', 1,'Crichten', 'Alanah', 'acrichtent@blogspot.com', '$2b$12$sTmXAm8VLUFFQx00LXLBxOSrIZZTxoOI0aUMcbec4yZuls5p6RQDC', 'http://dummyimage.com/103x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('b54e9ee8-8848-4ea4-89ed-e4d11bc7f732', 1,'Jedryka', 'Glenine', 'gjedrykau@wikipedia.org', '$2b$12$k6B0BNOHxVzMoPOBz23MD.tnonj9ukpBJbwHTgUVFCnvGsPGtI8cW', 'http://dummyimage.com/139x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('679681bb-855c-4d94-85ab-8acd17013ee5', 1,'Gianullo', 'Obadiah', 'ogianullov@privacy.gov.au', '$2b$12$p6SkeBcZ4pRmdEx3OaIvheGI9RteMtvxSW9FvzaeYg17EEub65Ek6', 'http://dummyimage.com/224x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('a803f028-cfbb-4539-acc2-9b898bc1beae', 1,'Chasles', 'Blanca', 'bchaslesw@elpais.com', '$2b$12$fj.Jk8Mm/NSxiOFSNlP6OuDXLVRL/ZhWS4HCny6tF1BwbGGyPMt4u', 'http://dummyimage.com/247x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('46b5832f-7082-435e-bf20-c1d4b6a28d7f', 1,'Copsey', 'Almeda', 'acopseyx@dell.com', '$2b$12$YKmAYzQPR7j.qYayVHZUXOn80O4O5RSzN0GXL8Io/LxbBRMHlqit.', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('cde19fc1-0525-42a1-824f-d3220ccd5590', 1,'Minett', 'Melinde', 'mminetty@msu.edu', '$2b$12$4mz4A6FsXbyVu9wxL1Q4T.KsPNMZmzEuKB./SDZoy/0uKLudY.ZxC', 'http://dummyimage.com/127x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('77b186fe-3fa5-4d6e-b98f-7de70f094e66', 1,'Fardy', 'Ford', 'ffardyz@fotki.com', '$2b$12$wSMmlQAUuQJUOiavMCOErO14YmNnkNJc5re/DQtO719JiTCs6vLHG', 'http://dummyimage.com/206x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('2fde709b-9b6c-40b1-a81c-efac938c39c2', 1,'Faichnie', 'Dara', 'dfaichnie10@home.pl', '$2b$12$e2ElqjAfH.yAPoS/7s/.WutmZmb2AzAv9Ew.flVsFM7cGX/e5en4O', 'http://dummyimage.com/157x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('89bd059a-4348-4ce5-97ba-f4132596c6a8', 1,'Malzard', 'Jarad', 'jmalzard11@xinhuanet.com', '$2b$12$BDuV6T5Solw3RCjs3RKILevwBkHrROmtOa6VLbuDyT69SqtSDuhU.', 'http://dummyimage.com/186x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('5ec7f1bf-e096-4fe1-b6dd-a0b9acd67c9e', 1,'Cominotti', 'Risa', 'rcominotti12@themeforest.net', '$2b$12$uS8qand3WrcbC8WC..L.v.zHxngtSrsc1/gukVem0yrbk5etRlLOu', 'http://dummyimage.com/113x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('0ac7089f-fcf5-4006-965a-e43ed54d3407', 1,'Emps', 'Vergil', 'vemps13@360.cn', '$2b$12$i78Of.EBpGD3PTpEscMBlOFwGuiLOk50Vbj/NYMaTiTAlyLAfYa1i', 'http://dummyimage.com/135x100.png/5fa2dd/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('7c76b16d-0597-4cbe-99a0-bccc2ee716f7', 1,'Casa', 'Gregor', 'gcasa14@msn.com', '$2b$12$JudO7FUJ4QnrIfp5Ek.fB.a/em7A2lzPQe21Jrx98FQ2VbEkL1.8K', 'http://dummyimage.com/160x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('5bde3147-185b-4b52-8c3d-770cb4b36053', 1,'Speers', 'Ferne', 'fspeers15@nyu.edu', '$2b$12$IAM6wnbHwTFBx0.TndJUXu37O1CbeR.NoB4fPkCm.b3X4VXxbdEb.', 'http://dummyimage.com/153x100.png/dddddd/000000');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('7ea5d6b2-3567-4ff8-98e0-d73cea4b019c', 1,'Pendlington', 'Caye', 'cpendlington16@4shared.com', '$2b$12$pf1bo1VdtOrFNnBhk1We7ugbuislIDzpvOWytFadoa2s5uHBF2lfC', 'http://dummyimage.com/240x100.png/ff4444/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('750b4463-ae16-48fb-9f7d-dc73afefb70a', 1,'Dooland', 'Morley', 'mdooland17@wiley.com', '$2b$12$xyIcxv9uCujoA.rqPtmsj.bo5F31Zj42/SIj1KqFBa2WbJS7Xi.f.', 'http://dummyimage.com/165x100.png/cc0000/ffffff');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('9a807100-44c3-4cac-bf28-e3a94334e63f', 1,'Lozada', 'Francisco', 'fjlozada@hotmail.com', '$2b$10$oLEURZJJrtEYs5zmasbG6up.b4SirNbtgiEEnlPn1Ti5S8C3cXXya', 'images/users/1693278764034-headshot08.jpg');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('c63cc0d9-2ffe-4e40-aa5b-bd6425e679fc', 1,'Lozada', 'Francisco', 'fjlozada@gmail.com', '$2b$10$vrS/RrYggNugRndZKNx.0OwwoYGoyG9RE.Zt7dlvk/nqHPoYwd.42', 'images/users/1693278805199-headshot08.jpg');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('cdfa49a9-2bdf-46c9-bedd-f07f7608bf59', 1,'Test', 'User', 'usertest@gmail.com', '$2b$10$kFLS3BoA9Z8/Ul49mriSwuVhTHifRv8TR/uznrdq8RVeVzgrRllhC', 'images/users/1693678790226-f.elconfidencial.com_original_966_3c2_fea_9663c2fea596b7d03e5760ef3870b3a6.jpg');
INSERT INTO users (id, id_category, lastname, firstname, email, password, image) VALUES ('c2f95782-9195-488e-b5ab-4b0799daa6cf', 1,'martin', 'palermo', 'palermo@gmail.com', '$2b$10$H4O2pSNnyBEOqeODOsR3Be6am333otj2NK.LHhA41tLsVhAgH4PZ.', 'images/users/1694471089386-WhatsApp Image 2023-06-18 at 11.44.59.jpeg');

INSERT INTO genres (genre) VALUES ('Rock');
INSERT INTO genres (genre) VALUES ('Pop');
INSERT INTO genres (genre) VALUES ('Electronic');
INSERT INTO genres (genre) VALUES ('Punk');
INSERT INTO genres (genre) VALUES ('Synth');
INSERT INTO genres (genre) VALUES ('Jazz');
INSERT INTO genres (genre) VALUES ('Funk');
INSERT INTO genres (genre) VALUES ('Ballad');
INSERT INTO genres (genre) VALUES ('Kids');

INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Funkadelic', 'Margot Brain', 7, 1971, 12882, 'images/products/Album0001.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Dark Side of the Moon', 'Pink Floyd', 1, 1973, 54382, 'images/products/Album0003.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Rumors', 'Fleetwood Mac', 2, 1977, 54482, 'images/products/Album0004.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('British Steel', 'Judas Priest', 1, 1980, 91836, 'images/products/Album0007.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('The Fame Monster', 'Lady Gaga', 2, 2009, 88364, 'images/products/Album0008.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('The Message', 'Rodolph Excell', 3, 2011, 32455, 'images/products/headshot01.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Skeleton Crew', 'Hedvige Behan', 1, 2001, 19283, 'images/products/headshot02.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Exorcist: The Beginning', 'Annnora Haresnaip', 4, 2006, 61544, 'images/products/headshot03.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Imaginary Crimes', 'Dotti Cotsford', 1, 1993, 69833, 'images/products/headshot04.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Suchwiin Bulmyeong', 'Elle Samudio', 3, 1989, 36767, 'images/products/headshot05.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Paternity', 'Miran Godard', 8, 1998, 99111, 'images/products/headshot06.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Assassin Next Door', 'Parker Case', 1, 1994, 39504, 'images/products/headshot07.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Dishonored', 'Mannie Paten', 3, 2002, 64733, 'images/products/headshot08.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Bleak House', 'Gene Rizzillo', 3, 1990, 21455, 'images/products/headshot09.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Battle of Los Angeles', 'Eugenia Larkins', 4, 2000, 14344, 'images/products/headshot10.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Vikings', 'Arlinda Gent', 8, 2007, 43482, 'images/products/headshot11.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Parent Trap', 'Bee Meffen', 9, 2012, 13435, 'images/products/headshot12.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Lie with Me', 'Joan Lowe', 2, 2012, 144433, 'images/products/headshot13.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Dernier Combat', 'Magdalena Moneypenny', 5, 2001, 77362, 'images/products/headshot14.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Latin Music USA', 'Elmer Blampy', 8, 1992, 43929, 'images/products/headshot15.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Five Fingers', 'Helene Scholling', 1, 2012, 50000, 'images/products/headshot16.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Book of Fate', 'Inesita Elam', 6, 2010, 9012, 'images/products/headshot17.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Pig Hunt', 'Orelle Wardhough', 4, 1999, 88372, 'images/products/headshot18.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Oranges', 'Karim Hanrahan', 5, 2011, 13111, 'images/products/headshot19.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Favor', 'Madelene Ren', 8, 1995, 54672, 'images/products/headshot20.jpg', 'Track');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Abraxas', 'Santana', 1, 1998, 58444, 'images/products/1692028857782-Santana-Abraxas-1970.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Sgt Peppers', 'The Beatles', 1, 1980, 20000, 'images/products/1692044298533-The_Beatles-Sgt-Peppers-Lonely-Hearts-Club-Band_1967.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Master of Puppets', 'Metallica', 1, 1989, 54000, 'images/products/1692445627186-Metallica-Master_of_Puppets-1986.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Madonna', 'Madonna', 2, 1986, 65000, 'images/products/1692445709171-Album0009.webp', 'Album');
INSERT INTO products (title, artist, id_genre, year, price, image, type) VALUES ('Nevermind', 'Nirvana', 1, 1988, 91000, 'images/products/1693093640673-1692445671063-Album0010.webp', 'Album');

