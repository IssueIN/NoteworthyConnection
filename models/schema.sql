--TEST USE LINE
--Remeber: mid and cid and clid
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
  clid INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  createdAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE client_messages (
  message_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  clid INTEGER,
  message TEXT NOT NULL,
  sentAt TIMESTAMP NOT NULL DEFAULT NOW(),
  FOREIGN KEY (clid) REFERENCES clients(clid)
);

CREATE TABLE client_preferred_musicians (
  clid INTEGER,
  mid INTEGER,
  PRIMARY KEY (clid, mid),
  FOREIGN KEY (clid) REFERENCES clients(clid),
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
('Songwriter'),
('Beatmaker'),
('Film Scorer'),
('Game Scorer'),
('Electronic Musician'),
('Sound Engineer'),
('Audio Editor'),
('Electric Guitarist'),
('Acoustic Guitarist'),
('Drummer'),
('Percussionist'),
('Pianist'),
('Keyboardist'),
('Bassist'),
('String Player'),
('Wind Player'),
('Lyricist'),
('Composer'),
('Chord Progression')
;

INSERT INTO musician_categories(mid, cid)
VALUES
(4, 17),
(1, 14),
(7, 22),
(2, 3),
(11, 10),
(5, 21),
(10, 2),
(12, 9),
(6, 11),
(9, 7),
(3, 5),
(2, 18),
(1, 19),
(8, 20),
(7, 8),
(10, 13),
(5, 4),
(3, 16),
(9, 1),
(11, 23),
(8, 6),
(4, 2),
(6, 15),
(12, 12),
(2, 22),
(1, 8),
(7, 3),
(5, 13),
(11, 18),
(10, 20)
;
