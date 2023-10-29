--TEST USE LINE
--Remeber: mid and cid and cuid
DROP DATABASE noteworthy;

CREATE DATABASE noteworthy;

USE noteworthy;

CREATE TABLE musicians (
  mid integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  wechatid VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
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


INSERT INTO musicians (name, email, wechatid, description)
VALUES
('JohnDoe', 'JohnDoe@noteworthy.com', 'edfsd', 'A classically trained pianist, I have dedicated my life to sharing my passion for music. With over 15 years of experience, I bring a touch of elegance to every performance.'),
('Frank', 'Frank@noteworthy.com','test', 'As a jazz guitarist, I''ve traveled the world sharing the stage with some of the greatest names in the industry. Music is not just a job for me, it''s a calling.'),
('j', 'j@noteworthy.com', 'test', 'Starting as a drummer in a garage band, I''ve honed my skills and am now a multi-instrumentalist with a penchant for energetic live shows.'),
('Edgar', 'Edgar@noteworthy.com', 'test', 'From the violin''s strings to the conductor''s stand, I''ve lived and breathed symphonic music. With a focus on bringing the classics to new audiences, I always aim to inspire.'),
('dj', 'dj@noteworthy.com', 'test', 'Electronic beats and synthesizers are my tools. Known in the EDM scene as DJ "dj", I specialize in creating immersive audio experiences.'),
('Xiong', 'Xiong@noteworthy.com', 'test', 'A virtuoso of the erhu, I blend traditional Chinese melodies with contemporary sounds, creating a bridge between the old and the new.'),
('eEnNz','eEnNz@noteworthy.com', 'test', 'Singing from the heart, I infuse every song with emotions. Whether it''s R&B, pop, or soul, I put my unique spin on it.'),
('Sun','sun@noteworthy.com', 'test', 'I may not be a musician, but on the football field, I dance to my own rhythm. Known for my quick reflexes and strategic plays, I''m Sun, the midfielder everyone''s talking about.'),
('NingXiangJiangXing', 'NingXiangJiangXing@noteworthy.com', 'test', 'Blending eastern and western harmonies, I, NingXiangJiangXing, am a flutist known for my hauntingly beautiful compositions.'),
('mapleSyrup', 'mapleSyrup@noteworthy.com','test', 'With a voice as sweet as syrup and a persona as genuine as my namesake, I''m mapleSyrup, your next favorite pop sensation.'),
('Lee', 'Lee@noteworthy.com','test', 'Nature and design converge in my work. As a landscape architect named Lee, I envision spaces that blend the organic with the aesthetic.'),
('Br', 'Br@noteworthy.com','test', 'Every element has a story, and as a chemist named Br, I delve deep into the molecular world to uncover nature''s secrets.')
;




INSERT INTO categories (name)
VALUES
('Arranger'),
('Mixing Engineer'),
('Singer'),
('Instrumentalist'),
('Singer-songwriter'),
("beatmaker")
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
