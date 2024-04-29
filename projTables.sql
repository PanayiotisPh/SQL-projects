CREATE TABLE dbo.USERS
(
  NameofUser nvarchar(30) NOT NULL,
  ID INTEGER NOT NULL,
  DateOfBirth smalldatetime NOT NULL,
  Sex nvarchar(10) NOT NULL,
  Username nvarchar(30) NOT NULL,
  PasswordOfUser nvarchar(30) NOT NULL,
  TypeOfUser nvarchar(30) NOT NULL,
  CONSTRAINT [PK_USERS]
  PRIMARY KEY ([ID])
);

CREATE TABLE dbo.LogFile
(
  DateAdded smalldatetime NOT NULL,
  ID INTEGER NOT NULL,
  CONSTRAINT [LOGFILEFK]
  FOREIGN KEY (ID) REFERENCES USERS(ID)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dbo.ObjectType
(
  Title nvarchar(30) NOT NULL,
  Model nvarchar(30) NOT NULL,
  ID INTEGER NOT NULL,
  CONSTRAINT [PK_OBJECTTYPE]
  PRIMARY KEY ([Title]),
  CONSTRAINT [OBJTYPEFK]
  FOREIGN KEY (ID) REFERENCES USERS(ID)
       ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dbo.Fingerprint
(
  x INTEGER NOT NULL,
  y INTEGER NOT NULL,
  FloorNumber INTEGER NOT NULL,
  DateAdded smalldatetime NOT NULL,
  NoOfObjects INTEGER NOT NULL,
  FingerPrintID INTEGER NOT NULL,
  ID INTEGER NOT NULL,
  CONSTRAINT [PK_FINGERPRINT]
  PRIMARY KEY ([FingerPrintID]),
  CONSTRAINT [FPRINTFK]
  FOREIGN KEY (ID) REFERENCES USERS(ID)
       ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE dbo.Objectt
(
  Height INTEGER NOT NULL,
  Width INTEGER NOT NULL,
  ObjectID INTEGER NOT NULL,
  FingerPrintID INTEGER NOT NULL,
  Title nvarchar(30) NOT NULL,
  CONSTRAINT [PK_OBJECT]
  PRIMARY KEY ([ObjectID]),
  CONSTRAINT [OBJFK]
  FOREIGN KEY (FingerPrintID) REFERENCES Fingerprint(FingerPrintID)
        ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT [OBJFK2]
  FOREIGN KEY (Title) REFERENCES ObjectType(Title)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE dbo.Campus
(
  NameOfCampus nvarchar(30) NOT NULL,
  Desciption text NOT NULL,
  RegDate smalldatetime NOT NULL,
  URLCampus INTEGER NOT NULL,
  CONSTRAINT [PK_CAMPUS]
  PRIMARY KEY ([NameOfCampus])
);

CREATE TABLE dbo.Building
(
  NameOfBuilding nvarchar(30) NOT NULL,
  BuildingCode INTEGER NOT NULL,
  DescriptionOfBuilding text NOT NULL,
  AddressOfBuilding nvarchar(50) NOT NULL,
  x INTEGER NOT NULL,
  y INTEGER NOT NULL,
  OwnerOfBuilding nvarchar(30) NOT NULL,
  RegisterDate smalldatetime NOT NULL,
  NoOfFloors INTEGER NOT NULL,
  NameOfCampus nvarchar(30) NOT NULL,
  CONSTRAINT [PK_BUILDING]
  PRIMARY KEY ([BuildingCode]),
  CONSTRAINT [BULDINGFK]
  FOREIGN KEY (NameOfCampus) REFERENCES Campus(NameOfCampus)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dbo.Floorr
(
  FloorNumber INTEGER NOT NULL,
  DescriptionOfFloor text NOT NULL,
  Topography nvarchar(50) NOT NULL,
  NoOfPOIs INTEGER NOT NULL,
  NoOfFingerprints INTEGER NOT NULL,
  BuildingCode INTEGER NOT NULL,
  CONSTRAINT [PK_FLOOR]
  PRIMARY KEY ([FloorNumber],[BuildingCode]),
  CONSTRAINT [FLOORFK]
  FOREIGN KEY ([BuildingCode]) REFERENCES Building(BuildingCode)
  
);

CREATE TABLE dbo.POI
(
  NameOfPOI INTEGER NOT NULL,
  TypeOfPOI INTEGER NOT NULL,
  DescriptionOfPOI text NOT NULL,
  OwnerOfPOI nvarchar(30),
  x INTEGER NOT NULL,
  y INTEGER NOT NULL,
  FloorNumber INTEGER NOT NULL,
  BuildingCode INTEGER NOT NULL,
  CONSTRAINT [PK_POI]
  PRIMARY KEY ([x],[y],[FloorNumber],[BuildingCode]),
  CONSTRAINT [POIFK]
  FOREIGN KEY ([FloorNumber], [BuildingCode]) REFERENCES Floorr(FloorNumber,BuildingCode)
  
);