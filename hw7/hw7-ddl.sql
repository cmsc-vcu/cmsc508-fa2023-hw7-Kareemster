# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int not null,
    skills_name varchar(255) not null,
    skills_desc varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, skills_name, skills_desc, skills_tag, skills_url, skills_time_commitment) values
(1, 'Python Programming', 'Ability to write software in Python', 'Programming', 'https://www.python.org/', 200),
(2, 'Data Analysis', 'Ability to analyze data using statistical methods', 'Data Science', 'https://www.datascience.com/', 150),
(3, 'Web Design', 'Ability to design user-friendly websites', 'Design', 'https://www.example.com/web-design-certification', 100),
(4, 'Machine Learning', 'Ability to create predictive models', 'Data Science', 'https://www.example.com/machine-learning-certification', 300),
(5, 'Database Management', 'Ability to manage SQL databases', 'Database', 'https://www.example.com/database-management-certification', 120),
(6, 'JavaScript Programming', 'Ability to write software in JavaScript', 'Programming', 'https://www.example.com/javascript-certification', 180),
(7, 'Project Management', 'Ability to manage projects effectively', 'Management', 'https://www.example.com/project-management-certification', 240),
(8, 'Graphic Design', 'Ability to create visually appealing designs', 'Design', 'https://www.example.com/graphic-design-certification', 160);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined) VALUES 
(1, 'John', 'Person 1', 'john@example.com', 'https://www.linkedin.com/in/john', 'https://example.com/john.jpg', 'john#1234', 'I am John', '2022-01-01'),
(2, 'Jane', 'Person 2', 'jane@example.com', 'https://www.linkedin.com/in/jane', 'https://example.com/jane.jpg', 'jane#1234', 'I am Jane', '2022-01-02'),
(3, 'Bob', 'Person 3', 'bob@example.com', 'https://www.linkedin.com/in/bob', 'https://example.com/bob.jpg', 'bob#1234', 'I am Bob', '2022-01-03'),
(4, 'Alice', 'Person 4', 'alice@example.com', 'https://www.linkedin.com/in/alice', 'https://example.com/alice.jpg', 'alice#1234', 'I am Alice', '2022-01-04'),
(5, 'Charlie', 'Person 5', 'charlie@example.com', 'https://www.linkedin.com/in/charlie', 'https://example.com/charlie.jpg', 'charlie#1234', 'I am Charlie', '2022-01-05'),
(6, 'Eve', 'Person 6', 'eve@example.com', 'https://www.linkedin.com/in/eve', 'https://example.com/eve.jpg', 'eve#1234', 'I am Eve', '2022-01-06'),
(7, 'David', 'Person 7', 'david@example.com', 'https://www.linkedin.com/in/david', 'https://example.com/david.jpg', 'david#1234', 'I am David', '2022-01-07'),
(8, 'Grace', 'Person 8', 'grace@example.com', 'https://www.linkedin.com/in/grace', 'https://example.com/grace.jpg', 'grace#1234', 'I am Grace', '2022-01-08'),
(9, 'Oliver', 'Person 9', 'oliver@example.com', 'https://www.linkedin.com/in/oliver', 'https://example.com/oliver.jpg', 'oliver#1234', 'I am Oliver', '2022-01-09'),
(10, 'Sophie', 'Person 10', 'sophie@example.com', 'https://www.linkedin.com/in/sophie', 'https://example.com/sophie.jpg', 'sophie#1234', 'I am Sophie', '2022-01-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can be NULL. ID can be auto_increment.

create table peopleskills(
    id int auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (id),
    foreign key (people_id) references people (people_id),
    unique (skills_id, people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
 insert into peopleskills(people_id, skills_id) values
 (1,1), (1,3), (1,6),
 (2,3), (2,4), (2,5),
 (3,1), (3,5),
 (5,3), (5,6),
 (6,2), (6,3), (6,4),
 (7,3), (7,5), (7,6),
 (8,1), (8,3), (8,5), (8,6),
 (9,2), (9,5), (9,6),
 (10, 1), (10,4), (10,5);


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id int not null,
    name varchar(255) not null,
    sort_priority int not null,
    primary key (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(id, name, sort_priority) values
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date default (current_date),
    primary key (id),
    foreign key (people_id) references people (people_id),
    foreign key (role_id) references roles (id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(people_id, role_id) values
(1, 2),
(2, 5), (2, 6),
(3, 2), (3, 4),
(4, 3),
(5, 3),
(6, 1), (6, 2),
(7, 1),
(8, 1), (8, 4),
(9, 2),
(10, 1), (10, 2);
