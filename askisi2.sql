CREATE TABLE BOOK (
	BookID int NOT NULL,
    Title nvarchar(10) NOT NULL,
    PublisherName nvarchar(10) NOT NULL,
    PRIMARY KEY (BookID)
);

CREATE TABLE PUBLISHER (
    Name nvarchar(10) NOT NULL,
    Address nvarchar(10) NOT NULL,
    Phone int NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE BOOK_AUTHORS (
    BookID int NOT NULL,
    AuthorName nvarchar(10) NOT NULL,
    CONSTRAINT FK_BookId FOREIGN KEY (BookID)
    REFERENCES BOOK(BookID),
);

CREATE TABLE LIBRARY_BRANCH (
    BranchID int NOT NULL,
    BranchName nvarchar(10) NOT NULL,
    Address nvarchar(10) NOT NULL,
    PRIMARY KEY (BranchID),
);

CREATE TABLE BORROWER (
    CardNo int NOT NULL,
    Name nvarchar(10) NOT NULL,
    Address nvarchar(10) NOT NULL,
	Phone int NOT NULL,
    PRIMARY KEY (CardNo)
);

CREATE TABLE BOOK_COPIES (
	BookID int NOT NULL,
    BranchID int NOT NULL,
    NoOfCopies int NOT NULL,
	CONSTRAINT FK_BookId2 FOREIGN KEY (BookID)
    REFERENCES BOOK(BookID),
	CONSTRAINT FK_BranchID FOREIGN KEY (BranchID)
    REFERENCES LIBRARY_BRANCH(BranchID),
);

CREATE TABLE BOOK_LOANS (
    BookID int NOT NULL,
    BranchID int NOT NULL,
    CardNo int NOT NULL,
	DateOut date NOT NULL,
	DateIn date NOT NULL,
	CONSTRAINT FK_BookId3 FOREIGN KEY (BookID)
    REFERENCES BOOK(BookID),
	CONSTRAINT FK_BranchID2 FOREIGN KEY (BranchID)
    REFERENCES LIBRARY_BRANCH(BranchID),
	CONSTRAINT FK_CardNo FOREIGN KEY (CardNo)
    REFERENCES BORROWER(CardNo)
);

