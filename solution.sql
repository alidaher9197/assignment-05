CREATE DATABASE university_db;

CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL
)

CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE health_records(
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    blood_group VARCHAR(5)
);

INSERT INTO departments(dept_name)
VALUES
("computer science"),
("mathematics"),
("physics");

INSERT INTO courses( course_name, credits, dept_id)
VALUES 
("database systems",4,1),
("algorithms",3,1),
("calculus",4,2),
("quantum mechanics",5,3);