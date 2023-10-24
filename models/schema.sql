--TEST USE LINE
--Remeber: mid and cid and cuid
DROP DATABASE noteworthy;

CREATE DATABASE noteworthy;

USE noteworthy;

CREATE TABLE musicians (
  mid integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE categories (
  cid integer PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(255) NOT NULL,
  createAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE musician_categories (
  mid INTEGER,
  cid INTEGER,
  PRIMARY KEY (mid, cid),
  FOREIGN KEY (mid) REFERENCES musicians(mid),
  FOREIGN KEY (cid) REFERENCES categories(cid)
);

CREATE TABLE clients (
  client_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE client_messages (
  message_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  client_id INTEGER,
  message TEXT NOT NULL,
  sentAt TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE client_preferred_musicians (
  client_id INTEGER,
  mid INTEGER,
  PRIMARY KEY (client_id, mid),
  FOREIGN KEY (client_id) REFERENCES clients(client_id),
  FOREIGN KEY (mid) REFERENCES musicians(mid)
);


INSERT INTO musicians (name)
VALUES
('JohnDoe'),
('Frank'),
('j'),
('Edgar'),
('dj'),
('Xiong'),
('eEnNz'),
('Sun'),
('NingXiangJiangXing'),
('mapleSyrup'),
('Lee'),
('Br')
;

INSERT INTO categories (name)
VALUES
('cat1'),
('cat2'),
('cat3'),
('cat4'),
('cat5'),
('cat6')
;

INSERT INTO musician_categories(mid, cid)
VALUES
(1,2),
(1,3),
(1,6),
(2,4),
(2,5),
(2,2),
(3,1),
(3,3),
(4,5),
(4,1),
(4,2),
(5,4),
(5,5),
(6,1),
(6,3),
(7,1),
(7,2),
(8,3),
(8,2),
(9,1),
(9,6),
(10,5),
(11,6),
(11,4),
(12,3)
;
