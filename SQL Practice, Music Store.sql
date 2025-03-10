--Retrieve all tracks with a unit price greater than $0.99.)¡(1)
SELECT Name  
FROM Track 
WHERE UnitPrice> "0.99";

--List all artists whose names start with "A".(2)
SELECT * 
FROM Artist 
WHERE Name like "A%";

--Display all invoices where the billing country is "Canada".(3)
SELECT * 
FROM Invoice 
WHERE BillingCountry = "Canada";

--Retrieve the total number of tracks in the database.(4)
SELECT count(Name)
FROM Track;

--List all album titles along with their corresponding artist names.(5)
SELECT Album.Title, Artist.Name 
FROM Album JOIN Artist 
WHERE Album.ArtistId = Artist.ArtistId;

--Find the top 5 most expensive tracks, sorted from highest to lowest.(6)
SELECT Name, UnitPrice 
FROM Track 
ORDER by UnitPrice DESC 
LIMIT 5;

--Retrieve the total sales amount for each country, sorted from highest to lowest.(7) 
SELECT BillingCountry, count(total) AS "Total" 
FROM Invoice 
GROUP by BillingCountry 
ORDER by total DESC;

--Count how many invoices each customer has made.(8)
SELECT count(*) AS "Invoices", Customer.FirstName as "First Name", Customer.LastName AS "Last Name" 
FROM Invoice Join Customer 
WHERE Invoice.CustomerId = Customer.CustomerId 
group by Customer.CustomerId;

--Display the total number of tracks for each album, only including albums with more than 10 tracks.(9)
SELECT Album.AlbumId, Album.Title, COUNT(Track.TrackId) AS TotalTracks 
FROM Album JOIN Track 
WHERE Album.AlbumId = Track.AlbumId 
GROUP BY Album.AlbumId, Album.Title 
HAVING COUNT(Track.TrackId) > 10;

--Retrieve all invoices where the billing city contains "York" (case-insensitive).(10)
SELECT * 
FROM Invoice 
WHERE BillingCity = "New York";

--Find the artist with the most albums in the database.(11)
SELECT Artist.ArtistId, Artist.Name, COUNT(Album.AlbumId) AS AlbumCount 
FROM Artist JOIN Album 
where Artist.ArtistId = Album.ArtistId 
GROUP BY Artist.ArtistId, Artist.Name 
ORDER BY AlbumCount DESC LIMIT 1;

--List the top 3 customers who have spent the most, including their total spending.(12)
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS "Total"
FROM Customer JOIN Invoice
WHERE Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY Total DESC
LIMIT 3;

--Retrieve all employees who report to a specific manager (use table aliases).(13)
--profe la verda no entendi muy bien la 13
--Find the most popular genre by counting how many tracks belong to each genre.(14)
SELECT Genre.GenreId, Genre.Name, COUNT(Track.TrackId) AS Track
FROM Genre JOIN Track 
WHERE Genre.GenreId = Track.GenreId
GROUP BY Genre.GenreId, Genre.Name
ORDER BY Track DESC
LIMIT 1;

--Display each customer's total purchases, but only include those who have spent more than $30.(15)
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS Total
FROM Customer JOIN Invoice 
WHERE Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
HAVING SUM(Invoice.Total) > 30
ORDER BY Total DESC;





