-- --TEST USE LINE
-- --Remeber: mid and cid and clid
-- DROP DATABASE noteworthy;

-- CREATE DATABASE noteworthy;

-- USE noteworthy;

-- CREATE TABLE musicians (
--   mid integer PRIMARY KEY AUTO_INCREMENT,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255) NOT NULL UNIQUE,
--   wechatid VARCHAR(255) NOT NULL,
--   description TEXT NOT NULL,
--   createdAt TIMESTAMP NOT NULL DEFAULT NOW()
-- );

-- CREATE TABLE categories (
--   cid integer PRIMARY KEY AUTO_INCREMENT, 
--   name VARCHAR(255) NOT NULL,
--   createAt TIMESTAMP NOT NULL DEFAULT NOW()
-- );

-- CREATE TABLE musician_categories (
--   mid INTEGER,
--   cid INTEGER,
--   PRIMARY KEY (mid, cid),
--   FOREIGN KEY (mid) REFERENCES musicians(mid),
--   FOREIGN KEY (cid) REFERENCES categories(cid)
-- );

-- CREATE TABLE clients (
--   clid INTEGER PRIMARY KEY AUTO_INCREMENT,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255) NOT NULL UNIQUE,
--   createdAt TIMESTAMP NOT NULL DEFAULT NOW()
-- );

-- CREATE TABLE client_messages (
--   message_id INTEGER PRIMARY KEY AUTO_INCREMENT,
--   clid INTEGER,
--   message TEXT NOT NULL,
--   sentAt TIMESTAMP NOT NULL DEFAULT NOW(),
--   FOREIGN KEY (clid) REFERENCES clients(clid)
-- );

-- CREATE TABLE client_preferred_musicians (
--   clid INTEGER,
--   mid INTEGER,
--   PRIMARY KEY (clid, mid),
--   FOREIGN KEY (clid) REFERENCES clients(clid),
--   FOREIGN KEY (mid) REFERENCES musicians(mid)
-- );


-- INSERT INTO musicians (name, email, wechatid, description)
-- VALUES
-- ('JohnDoe', 'JohnDoe@noteworthy.com', 'edfsd', 'A classically trained pianist, I have dedicated my life to sharing my passion for music. With over 15 years of experience, I bring a touch of elegance to every performance.'),
-- ('Frank', 'Frank@noteworthy.com','test', 'As a jazz guitarist, I''ve traveled the world sharing the stage with some of the greatest names in the industry. Music is not just a job for me, it''s a calling.'),
-- ('j', 'j@noteworthy.com', 'test', 'Starting as a drummer in a garage band, I''ve honed my skills and am now a multi-instrumentalist with a penchant for energetic live shows.'),
-- ('Edgar', 'Edgar@noteworthy.com', 'test', 'From the violin''s strings to the conductor''s stand, I''ve lived and breathed symphonic music. With a focus on bringing the classics to new audiences, I always aim to inspire.'),
-- ('dj', 'dj@noteworthy.com', 'test', 'Electronic beats and synthesizers are my tools. Known in the EDM scene as DJ "dj", I specialize in creating immersive audio experiences.'),
-- ('Xiong', 'Xiong@noteworthy.com', 'test', 'A virtuoso of the erhu, I blend traditional Chinese melodies with contemporary sounds, creating a bridge between the old and the new.'),
-- ('eEnNz','eEnNz@noteworthy.com', 'test', 'Singing from the heart, I infuse every song with emotions. Whether it''s R&B, pop, or soul, I put my unique spin on it.'),
-- ('Sun','sun@noteworthy.com', 'test', 'I may not be a musician, but on the football field, I dance to my own rhythm. Known for my quick reflexes and strategic plays, I''m Sun, the midfielder everyone''s talking about.'),
-- ('NingXiangJiangXing', 'NingXiangJiangXing@noteworthy.com', 'test', 'Blending eastern and western harmonies, I, NingXiangJiangXing, am a flutist known for my hauntingly beautiful compositions.'),
-- ('mapleSyrup', 'mapleSyrup@noteworthy.com','test', 'With a voice as sweet as syrup and a persona as genuine as my namesake, I''m mapleSyrup, your next favorite pop sensation.'),
-- ('Lee', 'Lee@noteworthy.com','test', 'Nature and design converge in my work. As a landscape architect named Lee, I envision spaces that blend the organic with the aesthetic.'),
-- ('Br', 'Br@noteworthy.com','test', 'Every element has a story, and as a chemist named Br, I delve deep into the molecular world to uncover nature''s secrets.')
-- ;

-- INSERT INTO categories (name)
-- VALUES
-- ('Arranger'),
-- ('Mixing Engineer'),
-- ('Singer'),
-- ('Instrumentalist'),
-- ('Songwriter'),
-- ('Beatmaker'),
-- ('Film Scorer'),
-- ('Game Scorer'),
-- ('Electronic Musician'),
-- ('Sound Engineer'),
-- ('Audio Editor'),
-- ('Electric Guitarist'),
-- ('Acoustic Guitarist'),
-- ('Drummer'),
-- ('Percussionist'),
-- ('Pianist'),
-- ('Keyboardist'),
-- ('Bassist'),
-- ('String Player'),
-- ('Wind Player'),
-- ('Lyricist'),
-- ('Composer'),
-- ('Chord Progression')
-- ;

-- INSERT INTO musician_categories(mid, cid)
-- VALUES
-- (4, 17),
-- (1, 14),
-- (7, 22),
-- (2, 3),
-- (11, 10),
-- (5, 21),
-- (10, 2),
-- (12, 9),
-- (6, 11),
-- (9, 7),
-- (3, 5),
-- (2, 18),
-- (1, 19),
-- (8, 20),
-- (7, 8),
-- (10, 13),
-- (5, 4),
-- (3, 16),
-- (9, 1),
-- (11, 23),
-- (8, 6),
-- (4, 2),
-- (6, 15),
-- (12, 12),
-- (2, 22),
-- (1, 8),
-- (7, 3),
-- (5, 13),
-- (11, 18),
-- (10, 20)
-- ;


DROP DATABASE noteworthy;
CREATE DATABASE noteworthy;
USE noteworthy;

-- Musicians Table with English and Chinese Fields
CREATE TABLE musicians (
  mid INTEGER PRIMARY KEY AUTO_INCREMENT,
  name_en VARCHAR(255) NOT NULL,
  name_zh VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  wechatid VARCHAR(255) NOT NULL,
  phone VARCHAR(22) NOT NULL,
  education_en VARCHAR(255) NOT NULL,
  education_zh VARCHAR(255) NOT NULL,
  styles_en TEXT NOT NULL,
  styles_zh TEXT NOT NULL,
  achievements_en TEXT NOT NULL,
  achievements_zh TEXT NOT NULL,
  description_en TEXT NOT NULL,
  description_zh TEXT NOT NULL,
  ideology_en TEXT NOT NULL,
  ideology_zh TEXT NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table with English and Chinese Fields
CREATE TABLE categories (
  cid INTEGER PRIMARY KEY AUTO_INCREMENT,
  name_en VARCHAR(255) NOT NULL,
  name_zh VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Musician Categories Table
CREATE TABLE musician_categories (
  mid INTEGER,
  cid INTEGER,
  PRIMARY KEY (mid, cid),
  FOREIGN KEY (mid) REFERENCES musicians(mid),
  FOREIGN KEY (cid) REFERENCES categories(cid)
);

-- Clients Table with English and Chinese Fields
CREATE TABLE clients (
  clid INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Client Messages Table with English and Chinese Fields
CREATE TABLE client_messages (
  message_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  clid INTEGER,
  message TEXT NOT NULL,
  sentAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (clid) REFERENCES clients(clid)
);

-- Client Preferred Musicians Table
CREATE TABLE client_preferred_musicians (
  clid INTEGER,
  mid INTEGER,
  PRIMARY KEY (clid, mid),
  FOREIGN KEY (clid) REFERENCES clients(clid),
  FOREIGN KEY (mid) REFERENCES musicians(mid)
);

INSERT INTO categories (name_en, name_zh)
VALUES
('Arranger', '编曲师'),
('Mixing Engineer', '混音师'),
('Singer', '歌手'),
('Instrumentalist', '乐手'),
('Songwriter', '唱作人'),
('Beatmaker', 'Beatmaker'),
('Video Scorer', '视频配乐'),
('Game Scorer', '游戏配乐'),
('Electronic Musician', '电子音乐'),
('Sound Engineer', '修音师'),
('Audio Editor', '音频编辑'),
('Guitarist', '吉他手'),
('Drummer', '鼓手'),
('Percussionist', '打击乐手'),
('Keyboardist', '键盘手'),
('Bassist', '贝斯手'),
('String Player', '弦乐手'),
('Wind Player', '管乐手'),
('Lyricist', '作词'),
('Composer', '作曲'),
('Chord Progression','和弦进行')
;

INSERT INTO musicians(name_en,name_zh,email,wechatid,phone,education_en,education_zh,styles_en,styles_zh,achievements_en,achievements_zh,description_en,description_zh,ideology_en,ideology_zh)
VALUES
('EJ Wang', '王奕杰', 'jwang14@berklee.edu', 'Wyjjjj_0817', '6178171789', 'Berklee College of Music', '伯克利音乐学院', 'NO DATA', '流行、爵士、RNB', 'NO DATA', 
'词曲作品：《午安，武汉》，被深圳电视台所报道。
编曲、词曲作品：《赛尔夫的时间》，与索卡音乐集团合作制作音乐剧。
编曲、混音作品：《我的脆弱》，与万声音乐集团合作制作音乐 MV。
编曲、混音作品：《冰箱里的咕噜噜》，与内蒙古艺术学院合作制作音乐剧。
编曲、混音、词曲作品：《森林》，与亚特兰大民乐团合作制作新年现场演出。',
'NO DATA','有着多年音乐制作经验，担任过多个大型音乐剧以及现场演出的音乐制作人，熟练掌握编曲、混音、作词作曲技巧。', 
'NO DATA', '音乐是一种沟通的语言，很多时候我能通过音乐理解和感受不同人的生活。我相信音乐不
只由普通的音符构成，他同样寄托着情感。在合作过程中，我一直会问客户：你想表达的是什么？然后通过运用不同结构的编曲以及不同逻辑的混音突出这个重心。否则做出来的作品只会是一盘散沙。我会将你想表达的情感和思想融合进我们的音乐，并能让他人感受到。希望我们能有一次愉快的合作。')
;

INSERT INTO musician_categories(mid, cid)
VALUES
(1,1),
(1,2),
(1,4),
(1,5),
(1,6),
(1,9),
(1,10),
(1,19),
(1,20),
(1,21)
;