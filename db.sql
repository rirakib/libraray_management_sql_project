-- Create the database
CREATE DATABASE library_management;

-- Select the database
USE library_management;

-- Create the members table
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    member_id VARCHAR(255) NOT NULL UNIQUE,  
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the authors table
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP 
);

-- Create the books table
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(id)
    ON DELETE CASCADE,
    INDEX (author_id)
);

-- Create member_assign_books table
CREATE TABLE member_assign_books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    assigned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(id)
    ON DELETE CASCADE, 
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES members(id)
    ON DELETE CASCADE,
    INDEX (book_id),  
    INDEX (member_id)
);

-- Create assign_book_returns table
CREATE TABLE assign_book_returns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_assign_id INT NOT NULL,
    returned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_assign_book FOREIGN KEY (member_assign_id) REFERENCES member_assign_books(id)
    ON DELETE CASCADE,
    INDEX (member_assign_id)
);
