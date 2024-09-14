.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color='blue' AND pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color='blue' AND pet='dog';


CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest>2 ORDER BY smallest LIMIT 20;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color 
  FROM students AS a, students AS b 
  WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;


CREATE TABLE sevens AS
  SELECT stu.seven
  FROM students as stu, numbers as num
  WHERE stu.time = num.time AND stu.number = 7 AND num.'7'='True';

