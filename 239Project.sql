CREATE TABLE ad_79d0bebd6e7b512.business_review(
  `srno` int(11) NOT NULL AUTO_INCREMENT,
  `bid` varchar(60) DEFAULT NULL,
  `categories` varchar(60) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `review_text` varchar(3000) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `business_review` (
  `srno` int(11) NOT NULL AUTO_INCREMENT,
  `bid` varchar(60) DEFAULT NULL,
  `categories` varchar(60) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `review_text` varchar(3000) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE ad_79d0bebd6e7b512.topicdistribution (
  `srno` int(11) NOT NULL,
  `topic0` varchar(60) DEFAULT NULL,
  `topic1` varchar(60) DEFAULT NULL,
  `topic2` varchar(60) DEFAULT NULL,
  `topic3` varchar(60) DEFAULT NULL,
  `topic4` varchar(60) DEFAULT NULL,
  `topic5` varchar(60) DEFAULT NULL,
  `topic6` varchar(60) DEFAULT NULL,
  `topic7` varchar(60) DEFAULT NULL,
  `topic8` varchar(60) DEFAULT NULL,
  `topic9` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



	LOAD DATA LOCAL INFILE '/Users/deepu/Downloads/results_nov18_300000.csv' 
	INTO TABLE ad_79d0bebd6e7b512.business_review
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"' 
	LINES TERMINATED BY '\n' 
	IGNORE 1 ROWS
	(bid,categories,city,name,state,review_text,stars);



LOAD DATA LOCAL INFILE '/Users/deepu/Downloads/lda/lda-8b84e285-10-b123b9fe/document-topic-distributions.csv' 
INTO TABLE ad_79d0bebd6e7b512.topicdistribution
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

select Distinct city from business_review ;

Select distinct name from business_review where city="Windsor";

Select yr.name,count(dt.srno) as review_count_topic1
from ad_79d0bebd6e7b512.topicdistribution dt 
inner join ad_79d0bebd6e7b512.business_review yr on dt.srno=yr.srno 
where yr.name ="Pine Cone Restaurant";




Select yr.city,count(dt.srno) as review_count_topic9
from ad_79d0bebd6e7b512.topicdistribution dt 
inner join ad_79d0bebd6e7b512.business_review yr on dt.srno=yr.srno 
where yr.stars>2 and topic0 > 0.01 and city ="Las Vegas";







Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join 
business_review yr on dt.srno=yr.srno where yr.stars>2 and topic1 > 0.01 and city ="Ahwatukee";	


CREATE TABLE `restuarantpredictions` (
  `Sno` int(11) NOT NULL AUTO_INCREMENT,
  `year_val` varchar(45) DEFAULT NULL,
  `business_id` varchar(55) DEFAULT NULL,
  `business_name` varchar(55) DEFAULT NULL,
  `avg_rating` float DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE '/Users/deepu/Downloads/resturantRatings.csv' 
INTO TABLE restuarantPredictions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(year_val,business_id,business_name,avg_rating);	


