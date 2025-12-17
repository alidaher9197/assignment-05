--task 1 creating database
CREATE DATABASE university_db;
USE university_db;
--task2 create table department
CREATE TABLE departments(
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);
--task3 create table courses
CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);
--task4 create table students
CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL
);
--task5 create table enrollments
CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE(student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
--task6 create table health_records
CREATE TABLE health_records(
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    blood_group VARCHAR(5),
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE
);
--task7 insert to department
INSERT INTO departments(dept_name)
VALUES
("computer science"),
("mathematics"),
("physics");
--task8 insert to courses
INSERT INTO courses( course_name, credits, dept_id)
VALUES 
("database systems",4,1),
("algorithms",3,1),
("calculus",4,2),
("quantum mechanics",5,3);
--isnert to students
INSERT INTO students(student_name)
VALUES
("alice"),
("bob"),
("charlie"),
("samy"),
("eva");
--insert to enrollment
INSERT INTO enrollments(student_id,course_id) 
VALUES 
(1,1),
(1,2),
(2,1),
(3,2),
(3,3),
(4,3),
(4,4);
--insert to health_record 
INSERT INTO health_records(student_id,blood_group) 
VALUES 
(1,"A+"),
(2,"B+"),
(3,"O-"),
(4,"AB+"),
(5,"A-");
--task8-1 inner join
SELECT students.student_id,students.student_name,health_records.blood_group FROM 
students INNER JOIN health_records 
ON
students.student_id=health_records.student_id;
--task8-2 inner join
SELECT * FROM students 
INNER JOIN enrollments 
ON 
students.student_id=enrollments.student_id 
INNER JOIN courses
ON
enrollments.course_id=courses.course_id;
--task9 left join
SELECT * FROM students 
LEFT JOIN enrollments 
ON 
students.student_id=enrollments.student_id 
LEFT JOIN courses
ON
enrollments.course_id=courses.course_id;
--task10 right join
SELECT *
FROM students
RIGHT JOIN enrollments
ON
enrollments.student_id=students.student_id
RIGHT JOIN courses
ON
courses.course_id=enrollments.course_id;
--task11 delete and my observation is that all related courses and enrollments are deleted automatically
DELETE FROM departments WHERE dept_id=3;
--task12 delete and my observation is that all related health_records and enrollments are deleted automatically
DELETE FROM students WHERE student_id=5;

