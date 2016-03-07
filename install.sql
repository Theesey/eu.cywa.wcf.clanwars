DROP TABLE IF EXISTS wcf1_clanwars;
CREATE TABLE wcf1_clanwars (
  clanwarID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  categoryID INT(10) NULL,
  active SMALLINT(1) DEFAULT 1,
	game VARCHAR(40) NOT NULL,
	platform VARCHAR(30) NOT NULL,
	status VARCHAR(30) NOT NULL,
	result_h INT(5) NOT NULL,
	result_g INT(5) NOT NULL,
  time INT(10) DEFAULT 0,
  clanname VARCHAR(50) NOT NULL,
  clantag VARCHAR(20) NOT NULL,
  clanlink VARCHAR(100) NOT NULL,
  gametype VARCHAR(60) NOT NULL,
  xonx VARCHAR(6) NOT NULL,
  league VARCHAR(70) NOT NULL,
  maps TEXT NULL,
  notes TEXT NULL
;)
