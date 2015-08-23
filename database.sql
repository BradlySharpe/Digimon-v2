DROP TABLE IF EXISTS `Action`;
DROP TABLE IF EXISTS `Monster`;
DROP TABLE IF EXISTS `Digimon`;
DROP TABLE IF EXISTS `Event`;
DROP TABLE IF EXISTS `Sprite`;
DROP TABLE IF EXISTS `Stage`;
DROP TABLE IF EXISTS `State`;
DROP TABLE IF EXISTS `User`;

-- Create User table
CREATE TABLE User (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  dob DATE NOT NULL,
  password VARCHAR(40) NOT NULL,
  registered TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN NULL DEFAULT FALSE
);

ALTER TABLE `User`
  ADD UNIQUE(`email`);

-- Create Stage table
CREATE TABLE Stage (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

ALTER TABLE `Stage`
  ADD UNIQUE(`name`);

-- Create Digimon table
CREATE TABLE Digimon (
  id INT AUTO_INCREMENT PRIMARY KEY,
  stage INT,
  name VARCHAR(13) NOT NULL,
  active BOOLEAN NULL DEFAULT FALSE
);

ALTER TABLE `Digimon`
  ADD UNIQUE(`name`),
  ADD INDEX `stage` (`stage`),
  ADD CONSTRAINT fk_Digimon_StageId
    FOREIGN KEY (stage)
      REFERENCES Stage(id);

-- Create State table
CREATE TABLE State (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

ALTER TABLE `State`
  ADD UNIQUE(`name`);

-- Create Sprite table
CREATE TABLE Sprite (
  id INT AUTO_INCREMENT PRIMARY KEY,
  digimon INT NOT NULL,
  state INT NOT NULL
);

ALTER TABLE `Sprite`
  ADD UNIQUE(`digimon`, `state`);

-- Create Monster table
CREATE TABLE Monster (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user INT NOT NULL,
  digimon INT NOT NULL
);

ALTER TABLE `Monster`
  ADD INDEX `user` (`user`),
  ADD INDEX `digimon` (`digimon`),
  ADD CONSTRAINT fk_Monster_DigimonId
    FOREIGN KEY (digimon)
      REFERENCES Digimon(id),
  ADD CONSTRAINT fk_Monster_UserId
    FOREIGN KEY (user)
      REFERENCES User(id);

-- Create Event table
CREATE TABLE Event (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

-- Create Action table
CREATE TABLE Action (
  id INT AUTO_INCREMENT PRIMARY KEY,
  event INT NOT NULL,
  triggered TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `Action`
  ADD INDEX `event` (`event`),
  ADD CONSTRAINT fk_Action_EventId
    FOREIGN KEY (event)
      REFERENCES Event(id);
