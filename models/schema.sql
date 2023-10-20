--TEST USE LINE
--Remeber: mid and cid
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

INSERT INTO musicians (name)
VALUES
('JohnDoe'),
('Test1'),
('Test2'),
('Test3'),
('Test4'),
('Test5'),
('Test6'),
('Test7'),
('Test8'),
('Test9'),
('Test10')
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
(11,6)
;