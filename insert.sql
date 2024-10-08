-- Insert demo data into members table
INSERT INTO members (member_id, name, phone)
VALUES 
('MEM001', 'John Doe', '123-456-7890'),
('MEM002', 'Jane Smith', '234-567-8901'),
('MEM003', 'Emily Davis', '345-678-9012');

-- Insert demo data into authors
INSERT INTO authors (name, phone)
VALUES 
('J.K. Rowling', '111-222-3333'),
('George R.R. Martin', '222-333-4444'),
('J.R.R. Tolkien', '333-444-5555');

-- Insert demo data into books table
INSERT INTO books (author_id, title)
VALUES 
(1, "Harry Potter and the Philosopher\'s Stone"),
(1, 'Harry Potter and the Chamber of Secrets'),   
(2, 'A Game of Thrones'),                       
(2, 'A Clash of Kings'),                       
(3, 'The Hobbit'),                            
(3, 'The Lord of the Rings');    

-- Insert demo data into member assign books table
INSERT INTO member_assign_books (book_id, member_id)
VALUES 
(1, 1), 
(2, 1), 
(2, 3), 
(2, 2), 
(1, 3); 

-- Insert demo data into assign book returns table
INSERT INTO assign_book_returns (member_assign_id)
VALUES 
(1), 
(3),
(5);  





