CREATE TABLE CLIENT (
	cid int NOT NULL,
    cname nvarchar(10) NOT NULL,
    rating int NOT NULL,
    PRIMARY KEY (cid)
);

CREATE TABLE PRODUCT (
    pid int NOT NULL,
    pname nvarchar(10) NOT NULL,
    color nvarchar(10) NOT NULL,
    PRIMARY KEY (pid)
);

CREATE TABLE BUYS (
    cid int NOT NULL,
    pid int NOT NULL,
    dates date NOT NULL,
    PRIMARY KEY (dates),
    CONSTRAINT FK_cid FOREIGN KEY (cid)
    REFERENCES CLIENT(cid),
	CONSTRAINT FK_pid FOREIGN KEY (pid)
    REFERENCES PRODUCT(pid)
);