SELECT CLIENT.cname
FROM BUYS
INNER JOIN CLIENT
ON BUYS.cid = CLIENT.cid
GROUP BY CLIENT.cname
HAVING COUNT(BUYS.cid)>1

SELECT CLIENT.cname
FROM BUYS
INNER JOIN CLIENT
ON BUYS.cid = CLIENT.cid
GROUP BY CLIENT.cname
HAVING COUNT(DISTINCT BUYS.pid) = (SELECT COUNT(PRODUCT.pid) FROM PRODUCT)

SELECT CLIENT.cid
FROM CLIENT
WHERE CLIENT.rating > 
(SELECT MIN(CLIENT.rating) 
 FROM CLIENT 
 WHERE CLIENT.cname LIKE 'takis'
 )

SELECT CLIENT.cid
FROM CLIENT
WHERE CLIENT.rating > 
(SELECT MAX(CLIENT.rating) 
 FROM CLIENT 
 WHERE CLIENT.cname LIKE 'panagiotis'
 )

SELECT BOOK_COPIES.NoOfCopies
FROM BOOK_COPIES
INNER JOIN BOOK
ON BOOK_COPIES.BookID = BOOK.BookID
INNER JOIN LIBRARY_BRANCH
ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
WHERE LIBRARY_BRANCH.BranchName LIKE 'North' AND BOOK.Title LIKE 'Databases'

SELECT BOOK_COPIES.BranchID, COUNT(DISTINCT BOOK_COPIES.BookID) AS DistinctBookCopies
FROM BOOK_COPIES
GROUP BY BOOK_COPIES.BranchID

SELECT BORROWER.Name, BORROWER.CardNo
FROM BORROWER
WHERE BORROWER.CardNo not in(
SELECT BOOK_LOANS.CardNo
FROM.BOOK_LOANS
WHERE CAST (GETDATE() AS Date) < BOOK_LOANS.DateIn
)

SELECT BOOK.Title, BORROWER.Name, BORROWER.Address
FROM BOOK
INNER JOIN BOOK_LOANS
ON BOOK.BookID = BOOK_LOANS.BookID
INNER JOIN BORROWER
On BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN LIBRARY_BRANCH
On LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
WHERE LIBRARY_BRANCH.BranchName LIKE 'South' AND CAST(GETDATE() AS Date) = BOOK_LOANS.DateIn

SELECT LIBRARY_BRANCH.BranchName, COUNT(BOOK_LOANS.BookID) AS COUNT_BOOK_LOANS
FROM LIBRARY_BRANCH
INNER JOIN BOOK_LOANS
ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
WHERE BOOK_LOANS.DateIn > CAST(GETDATE() AS Date)
GROUP BY LIBRARY_BRANCH.BranchName

SELECT BOOK.Title, BORROWER.Address, COUNT(BOOK_LOANS.BookID)
FROM BOOK
INNER JOIN BOOK_LOANS
ON BOOK.BookID = BOOK_LOANS.BookID
INNER JOIN BORROWER
ON BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.DateIn > CAST(GETDATE() AS Date)
GROUP BY BOOK.Title, BORROWER.Address
HAVING COUNT(BOOK_LOANS.BookID)>5

SELECT BOOK.Title, BOOK_COPIES.NoOfCopies
FROM BOOK
INNER JOIN BOOK_COPIES
ON BOOK.BookID = BOOK_COPIES.BookID
INNER JOIN BOOK_AUTHORS
ON BOOK.BookID = BOOK_AUTHORS.BookID
INNER JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
WHERE BOOK_AUTHORS.AuthorName LIKE 'Jules King' AND LIBRARY_BRANCH.BranchName LIKE 'Central'