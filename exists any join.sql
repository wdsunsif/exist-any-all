--1
SELECT DISTINCT p.Name AS PublisherName
FROM Press AS p
WHERE EXISTS (
    SELECT *
    FROM Books AS b
    WHERE b.Id_Press = p.Id
)

 
SELECT DISTINCT p.Name AS PublisherName
FROM Press AS p
WHERE p.Id IN (
    SELECT DISTINCT b.Id_Press
    FROM Books AS b
)
 
SELECT DISTINCT p.Name AS PublisherName
FROM Press AS p
INNER JOIN Books AS b ON p.Id = b.Id_Press

--2
 
SELECT *
FROM Books
WHERE Pages >= ALL (
    SELECT Pages
    FROM Books
)
 
SELECT *
FROM Books
WHERE Pages = (
    SELECT MAX(Pages)
    FROM Books
)


--3

SELECT *
FROM Teachers AS t
WHERE NOT EXISTS (
    SELECT *
    FROM S_Cards AS sc
    WHERE sc.Id_Student = t.Id
)

SELECT FirstName, LastName
FROM Teachers AS t
LEFT JOIN S_Cards AS sc ON t.Id = sc.Id_Student
WHERE sc.Id_Student IS  NULL

--4

SELECT Name
FROM Books AS  b
WHERE EXISTS (
    SELECT *
    FROM S_Cards AS sc
    WHERE sc.Id_Book = b.Id
)
AND  EXISTS(
    SELECT *
    FROM Teachers AS t
    JOIN S_Cards AS sc ON t.Id = sc.Id_Student
    WHERE sc.Id_Book = b.Id
)


SELECT DISTINCT b.Name
FROM Books AS b
JOIN S_Cards AS sc ON b.Id = sc.Id_Book
JOIN Teachers AS t ON sc.Id_Student = t.Id









