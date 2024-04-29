INSERT INTO dbo.[USERS] (NameOfUser,ID,DateOfBirth,Sex,Username,PasswordOfUser,TypeOfUser)
VALUES
  ('Cora Mcconnell',1,'Sep 14, 1973','male','coramcconnell@1.57','OTY78YJS2XL','ds'),
  ('Erica Johnson',2,'Feb 10, 1985','male','ericajohnson7070@1.57','KWZ56GNG4UK','ds'),
  ('Hedda Henson',3,'Sep 23, 1977','male','heddahenson1605@1.57','BLT41WSW3MX','ds'),
  ('Daquan Holloway',4,'Apr 12, 1972','male','daquanholloway@1.57','ILD51ZRL9TU','lmu'),
  ('Andrew Powell',5,'May 12, 1967','male','andrewpowell@1.57','PQA82WWS4KX','lmu'),
  ('Sybill Franklin',6,'Oct 18, 1997','female','sybillfranklin@1.57','KHP48QVQ5GV','lmu'),
  ('Warren Coffey',7,'Jun 4, 1985','female','warrencoffey@1.57','ARF18DCX8MP','lmu'),
  ('Vernon Weeks',8,'Jan 4, 1991','female','vernonweeks@1.57','IBI21UMS2BZ','lmu'),
  ('Clark Warren',9,'Oct 8, 1996','male','clarkwarren@1.57','GFK11HKE3QR','lmu'),
  ('Willow Fernandez',10,'May 24, 1970','male','willowfernandez5035@1.57','TBF45UMD6VI','lmu');

  
 

INSERT INTO dbo.[LogFile] (DateAdded ,ID )
VALUES
  ('Jun 5, 2022',9),
  ('Jan 20, 2023',8),
  ('Dec 23, 2021',8),
  ('Dec 11, 2021',9),
  ('May 8, 2022',6),
  ('Jun 21, 2022',10),
  ('Dec 17, 2022',6),
  ('Dec 1, 2021',6),
  ('Apr 12, 2023',9),
  ('Jul 28, 2023',9);

INSERT INTO dbo.[FingerPrint] (x,y,FloorNumber ,DateAdded ,NoOfObjects ,FingerPrintID,ID)
VALUES
  (8,8,1,'Oct 15, 2023',6,1,8),
  (8,3,4,'Jun 5, 2023',1,2,9),
  (8,0,4,'Aug 18, 2022',8,3,9),
  (3,8,1,'Feb 7, 2023',7,4,9),
  (4,1,3,'May 17, 2022',1,5,7),
  (6,6,3,'Apr 14, 2022',4,6,6),
  (1,2,1,'Jan 27, 2023',12,7,5),
  (6,1,1,'May 12, 2022',4,8,8),
  (10,8,1,'Aug 24, 2023',14,9,8),
  (9,8,4,'May 25, 2022',9,10,5);

INSERT INTO dbo.[ObjectType] (Title,Model,ID)
VALUES
  ('Non Limited','W4W 3V3',6),
  ('Risus LLP','S6E 1Y2',10),
  ('Lacinia Mattis Integer PC','N4F 3U4',7),
  ('Proin Ltd','V3S 3O4',10),
  ('Ante Iaculis Corporation','Y8T 2W6',4),
  ('Urna Nullam Associates','D7X 7G2',5),
  ('Quis Tristique Incorporated','T4W 4Q9',7),
  ('Sapien Cras Ltd','P7I 7X7',5),
  ('Pede Ac Foundation','F6R 0H2',4),
  ('Risus Varius Corp.','M6D 4P8',9);



INSERT INTO dbo.[Objectt] (Height,Width,ObjectID,FingerPrintID ,Title)
VALUES
  (2,6,1,8,'Ante Iaculis Corporation'),
  (8,8,2,5,'Risus LLP'),
  (1,7,3,8,'Non Limited'),
  (7,7,4,7,'Non Limited'),
  (7,10,5,3,'Proin Ltd'),
  (8,1,6,6,'Lacinia Mattis Integer PC'),
  (2,7,7,5,'Sapien Cras Ltd'),
  (3,3,8,5,'Lacinia Mattis Integer PC'),
  (7,10,9,4,'Risus Varius Corp.'),
  (5,4,10,8,'Sapien Cras Ltd');



INSERT INTO dbo.[Building] (NameOfBuilding,BuildingCode,DescriptionOfBuilding,AddressOfBuilding,OwnerOfBuilding,RegisterDate,NoOfFloors,NameOfCampus,x,y)
VALUES
  ('Building A',1,'orci, consectetuer euismod est arcu ac orci. Ut semper pretium','2625 Ultricies Avenue','Stone Key','Oct 12, 2022',5,'Campus A',5,8),
  ('Building B',2,'sagittis semper.','327-216 Per St.','Baxter Garrison','Dec 14, 2022',1,'Campus B',8,1),
  ('Building C',3,'aliquam arcu. Aliquam ultrices iaculis odio.','886-4425 Fusce Rd.','Dieter Valdez','Aug 1, 2023',3,'Campus A',2,6),
  ('Building D',4,'posuere cubilia Curae','409-8742 Aliquam, Road','Zenaida Dunn','Sep 26, 2023',4,'Campus B',6,5),
  ('Building E',5,'Sed','P.O. Box 580, 3131 Pede. St.','Ulric Powers','Aug 19, 2022',9,'Campus C',7,5),
  ('Building F',6,'In mi pede, nonummy','Ap #427-8221 Amet Road','Ima Ramsey','Jun 17, 2022',4,'Campus A',4,1),
  ('Building G',7,'placerat, augue. Sed molestie. Sed id risus quis','154 Lorem Street','Thaddeus Atkinson','Jun 4, 2023',4,'Campus B',1,7),
  ('Building H',8,'vehicula risus. Nulla eget metus eu erat','Ap #965-8809 Tellus Rd.','Martha Rich','Nov 26, 2022',4,'Campus C',2,7),
  ('Building I',9,'dictum placerat, augue. Sed molestie. Sed id','P.O. Box 157, 2377 Lacus. Road','Erich Marsh','Mar 26, 2023',5,'Campus A',6,1),
  ('Building K',10,'elit. Etiam laoreet, libero et tristique','180 Amet St.','Blossom Sanders','Nov 16, 2023',9,'Campus B',5,7);

INSERT INTO dbo.[Campus] (NameOfCampus,Desciption,RegDate,URLCampus)
VALUES
  ('Campus A','Sed pharetra, felis eget varius ultrices, mauris ipsum','Aug 11, 2022',1),
  ('Campus B','nunc sit amet metus. Aliquam erat volutpat. Nulla','Jun 13, 2022',2),
  ('Campus C','ante bibendum ullamcorper. Duis cursus, diam at pretium','May 3, 2023',3),
  ('Campus D','eu sem. Pellentesque ut ipsum ac mi','Sep 19, 2023',4),
  ('Campus E','molestie dapibus ligula. Aliquam erat volutpat. Nulla','Jul 31, 2022',5),
  ('Campus F','consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum','Aug 3, 2022',6),
  ('Campus G','a, magna.','Nov 5, 2022',7),
  ('Campus H','laoreet posuere, enim nisl elementum purus, accumsan','Aug 1, 2022',8),
  ('Campus I','malesuada ut, sem. Nulla interdum.','Feb 14, 2023',9),
  ('Campus K','auctor, nunc nulla vulputate dui,','Jan 29, 2023',10);

INSERT INTO dbo.[Floorr] (FloorNumber,DescriptionOfFloor,Topography,NoOfPOIs,NoOfFingerprints,BuildingCode)
VALUES
  (1,'auctor. Mauris vel','Ap #169-1155 A, Rd.',15,13,2),
  (2,'sem, vitae aliquam eros turpis non enim. Mauris quis','639-5590 Dolor. Road',17,7,4),
  (3,'quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis','P.O. Box 285, 3804 Sed Rd.',19,16,2),
  (4,'Pellentesque ut ipsum ac','445-5254 Ornare Road',12,15,3),
  (5,'semper cursus. Integer mollis. Integer tincidunt aliquam arcu.','Ap #102-6150 Turpis St.',12,15,4),
  (6,'luctus felis purus ac tellus. Suspendisse','P.O. Box 577, 4461 Sit Road',16,14,5),
  (7,'mauris id sapien. Cras dolor dolor, tempus non, lacinia','840-5262 Natoque Avenue',6,4,1),
  (8,'vel lectus. Cum sociis natoque penatibus','Ap #615-1761 Etiam Street',13,12,7),
  (9,'Proin dolor. Nulla semper tellus id nunc','406-5109 Augue Avenue',2,8,1),
  (10,'iaculis','Ap #214-392 Turpis St.',18,3,2);

INSERT INTO dbo.[POI] (NameOfPOI,TypeOfPOI,DescriptionOfPOI,OwnerOfPOI,x,y,FloorNumber,BuildingCode)
VALUES
  (1,1,'dictum. Phasellus','Samson Shelton',3,2,6,5),
  (2,2,'massa rutrum magna. Cras convallis convallis','Lynn Cantu',1,2,6,5),
  (3,3,'diam.','Colleen Brady',5,2,8,7),
  (4,4,'Donec felis orci, adipiscing non, luctus sit amet, faucibus','Vernon Keller',3,4,8,7),
  (5,5,'diam. Sed diam lorem, auctor quis, tristique ac,','Hillary Nelson',5,4,1,2),
  (6,6,'tristique ac, eleifend vitae, erat.','Chava Harper',4,2,8,7),
  (7,7,'mauris. Morbi non sapien','Adrienne Allison',5,5,1,2),
  (8,8,'sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla','Nasim Duke',1,5,3,2),
  (9,9,'venenatis lacus. Etiam bibendum fermentum metus. Aenean','Gannon Atkins',4,3,8,7),
  (10,10,'ut, pharetra sed, hendrerit a, arcu. Sed et libero.','Ashton Chandler',5,6,8,7);

  