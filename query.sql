-- show all books
SELECT * FROM books;


-- show all author
SELECT * FROM authors;

-- show author wise books
SELECT authors.name AS author_name, books.title AS book_title
FROM books
JOIN authors ON books.author_id = authors.id
ORDER BY authors.name;

-- show book wise member assign

SELECT books.title AS book_title, members.name AS member_name, member_assign_books.assigned_at
FROM member_assign_books
JOIN books ON member_assign_books.book_id = books.id
JOIN members ON member_assign_books.member_id = members.id
ORDER BY books.title;


-- assign wise top popular book

SELECT books.title AS book_title, COUNT(member_assign_books.book_id) AS assign_count
FROM member_assign_books
JOIN books ON member_assign_books.book_id = books.id
GROUP BY books.title
ORDER BY assign_count DESC;


-- which member assign book but not return

SELECT members.name AS member_name, books.title AS book_title, member_assign_books.assigned_at
FROM member_assign_books
JOIN members ON member_assign_books.member_id = members.id
JOIN books ON member_assign_books.book_id = books.id
LEFT JOIN assign_book_returns ON member_assign_books.id = assign_book_returns.member_assign_id
WHERE assign_book_returns.member_assign_id IS NULL
ORDER BY member_assign_books.assigned_at DESC;


-- which book not assign single time yet
SELECT books.title AS book_title
FROM books
LEFT JOIN member_assign_books ON books.id = member_assign_books.book_id
WHERE member_assign_books.book_id IS NULL;


