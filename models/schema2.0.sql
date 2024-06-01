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
('Songwriter', '唱作人'),
('Beatmaker', 'Beatmaker'),
('Video Scorer', '视频配乐'),
('Game Scorer', '游戏配乐'),
('Lyricist', '作词'),
('Composer', '作曲')
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
只由普通的音符构成，他同样寄托着情感。在合作过程中，我一直会问客户：你想表达的是什么？然后通过运用不同结构的编曲以及不同逻辑的混音突出这个重心。否则做出来的作品只会是一盘散沙。我会将你想表达的情感和思想融合进我们的音乐，并能让他人感受到。希望我们能有一次愉快的合作。'),
('Zhuoran Chu','褚卓燃','zchu4@u.rochester.edu','N79516','+1 5852983544', 'Eastman School of Music','伊斯曼音乐学院','Tonal, Atonal','Tonal, Atonal','NO DATA', 'NO DATA', 'NO DATA', '自幼学习钢琴,后跟随音乐大师丘英宏学习钢琴,在过程中开始对古典作曲产生兴趣。2022年考入伊斯曼音乐学院本科,就读古典作曲专业。', 'NO DATA', '将⻄方的现代音乐和中国传统音乐结合,找到属于自己独特的音乐⻛格。'),
('NO DATA', '林榆璇','linyuxuan127@gmail.com','LYX-3050353077','+1(347)330-2168','The Juilliard School','茱莉亚音乐学院','NO DATA', '古典音乐会音乐, 任意风格影视配乐','NO DATA', 
'- 为女高音及钢琴三重奏创作的艺术歌曲组曲《六首四行诗》在 2023 North Star New Voices in Art Song 作品征集比赛中获奖, 因而作品被发表. 
- 2023年夏天作为六位受邀的年轻作曲家之一参与Yellow Barn Young Artist Program 青年艺术家项目并举办了两场音乐会. 
- 受邀为美国著名单簧管演奏家Thomas Piercy 创作单簧管独奏作品并与新冠期间在 Tokyo to New York: “Moments in This Time” 线上慈善音乐会演出.','NO DATA', '林榆璇 (生于2003年) 是一位来自中国深圳的青年作曲人, 现在就读于美国茱莉亚音乐学院, 师从普利策奖得主Melinda Wagner 教授。 她于六岁开始学习钢琴, 随后学习了吉他以及中国传统乐器二胡和葫芦丝。 继承自学成才的民乐作曲家爷爷的衣钵, 她于十七岁时在 Reiko Füting 教授的指导下开始了作曲专业训练. 她的一些其他作曲导师还包括: Robert Beaser, David Conte, 王珂琳以及Colton Francis。 榆璇的作品曾在多地演出, 例如 为 covid-19 音乐家救济举办的 Tokyo to New York: “Moments in This Time” 线上慈善音乐会, 法国巴黎Schola Cantorum音乐学院的2022 EAMA 夏季音乐节, 美国佛蒙特周的普特尼 Yellow Barn 青年艺术家项目, 以及茱莉亚学院. 榆璇的作曲灵感主要来源于视觉艺术, 摄影作品, 大自然以及建筑设计。她也对视觉艺术和音乐结合的可能性非常感兴趣, 并热衷于寻求任何艺术形式之间结合的可能性.','NO DATA','作为一位以创作音乐会作品(独奏、室内乐,有时候是管弦乐)为主且偶尔涉猎编曲及影视配乐的年轻作曲学者, 也鉴于当代作曲家所创作的所谓“新音乐”普遍被低估且未被大众接触,我一直希望以一位活跃的作曲家的身份,以引人入胜且易于接触的方式呈现我的音乐,邀请观众踏入21世纪当代古典音乐的世界。
由于我们现在生活在一个几乎所有事物都可以通过多媒体轻松获得的环境,我致力于尽可能利用这一点来呈现我的音乐。这一愿望引导着我在艺术形式之间寻找合作的研究方向, 也是我深感兴趣参与跨领域项目的原因。我希望通过这种跨领域的方式追求尽可能全面、引人入胜且具有吸引力的听觉和视觉体验,以迎合广泛的观众和听众群体。'),
('NO DATA', '陈冠宇','1347116769@qq.com','ZGCM6a6','15602904516','NO DATA','中国传媒大学','Pop, Orchestral Music, A Cappella','流行，管弦乐，阿卡贝拉','NO DATA', 
'2023年杭州国际电子音乐作曲大赛歌曲组一等奖
2023年HONOR Talent荣耀原创音乐大赛一等奖
2023年HONOR Talent荣耀原创音乐大赛  原创未来之星一等奖
2023年擂闪配乐计划top18
2022年《Auf Und Auf voll Lebenslust》阿卡贝拉改编同时登上B站、抖音、小红书热门，点击量破千万', 'NO DATA', '陈冠宇，中国传媒大学音乐作曲与作曲技术理论电子音乐方向22级本科，师从作曲家王铉。初高中均毕业于深圳中学，自幼进入深圳中学金钟少年合唱团随青年高级教师刘梅学习合唱。曾参与深圳中学75周年校庆主题曲创作与配器，中国传媒大学校歌阿卡贝拉版改编，本田CL300系列摩托广告配乐等。', 'NO DATA', '创新和不忘初心是音乐创作的真命题，不要让音乐风格的模版成为局限自己创作的枷锁。'),
('NO DATA','向子洋','1363794205@qq.com','SwordArtOnlineKLA','18108449867','NO DATA','中国传媒大学','Funk, Fusion, Jazz', 'Funk, Fusion, Jazz','NO DATA', '不值一提','NO DATA', '初出茅庐的无名小卒','NO DATA', '做自己喜欢的音乐'),
('NO DATA', '卢加峻','1603075326@qq.com','Lu14739271112','14739271112','NO DATA','中国传媒大学','NO DATA','流行 国风 交响乐 Hip-Hop','NO DATA', '曾获得万人古筝演奏吉尼斯世界记录,CCTV《向阳花开》节目表演金奖,一带一路国际青少年文化艺术交流圣殿总决赛铂金奖,中国传媒大学 2022 年创意市集一等奖,曾为中国传媒大学 Self Love 自我成长社 编写社歌,参与中国传媒大学第九届 E 音之夜,第九届亚洲大学生电影展闭幕式开场曲《光影齐鸣》编曲,中国传媒大学校合唱团与北京广播电视台联合举办的活动钢琴伴奏编曲。','NO DATA', '吉尼斯世界记录万人古筝演奏获得者 古筝演奏者,网易音乐人,音乐制作人','NO DATA','音乐是一种艺术语言,用音乐述说出你的故事吧')
;

INSERT INTO musician_categories(mid, cid)
VALUES
(1,1),
(1,2),
(1,3),
(1,5),
(1,7),
(1,8),
(2,1),
(2,8),
(3,1),
(3,5),
(3,6),
(3,8),
(4,1),
(4,5),
(4,6),
(4,8),
(5,1),
(5,4),
(5,5),
(5,7),
(6,1),
(6,3),
(6,4),
(6,5),
(6,6),
(6,8)
;