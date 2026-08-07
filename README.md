# CS50's Introduction to Databases with SQL

![Harvard](https://img.shields.io/badge/Harvard-CS50's%20SQL-A51C30?style=flat-square)
![SQL](https://img.shields.io/badge/SQL-Database-4479A1?style=flat-square)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square)


My coursework and problem set solutions for **CS50's Introduction to Databases with SQL**, offered by Harvard University.

The course covers relational databases, SQL, database design, data manipulation, views, optimization, scalability, and database security, using technologies such as SQLite, PostgreSQL, MySQL, and Python.

> **Institution:** Harvard University
> **Course:** CS50's Introduction to Databases with SQL
> **Status:** Coursework completed · Final Project pending



## Course Content

### Week 0 — Querying

**Topics:** Tables · Databases · Database Management Systems · SQL · SQLite · `SELECT` · `LIMIT` · `OFFSET` · `WHERE` · Comparisons · `NOT` · `NULL` · Pattern Matching · `LIKE` · Compound Conditions · Range Conditions · Ordering · Aggregate Functions · `ROUND` · `DISTINCT`

**Problem Sets:** Cyberchase · 36 Views · Normals · Players

---

### Week 1 — Relating

**Topics:** Relational Databases · One-to-One Relationships · One-to-Many Relationships · Many-to-Many Relationships · Entity Relationship Diagrams · Primary Keys · Foreign Keys · Subqueries · `IN` · `INNER JOIN` · Outer Joins · `LEFT JOIN` · `RIGHT JOIN` · `FULL JOIN` · `NATURAL JOIN` · `INTERSECT` · `UNION` · `EXCEPT` · `GROUP BY` · `HAVING`

**Problem Sets:** Packages, Please · DESE · Moneyball

---

### Week 2 — Designing

**Topics:** Schemas · Normalizing · Data Types · Storage Classes · Type Affinities · `PRIMARY KEY` · `FOREIGN KEY` · `CHECK` · `DEFAULT` · `NOT NULL` · `UNIQUE` · `DROP TABLE` · `ALTER TABLE` · `ADD COLUMN` · `RENAME COLUMN` · `DROP COLUMN` · Charlie

**Problem Sets:** ATL · Happy to Connect · Union Square Donuts

---

### Week 3 — Writing

**Topics:** Create, Read, Update, Delete · `INSERT INTO` · CSVs · `.import` · `DELETE FROM` · Foreign Key Constraints · `UPDATE` · Triggers · Soft Deletions

**Problem Sets:** Don't Panic! · Meteorite Cleaning

---

### Week 4 — Viewing

**Topics:** Views · `CREATE VIEW` · Views for Simplifying · Views for Aggregating · Temporary Views · `CREATE TEMPORARY VIEW` · Common Table Expressions · Views for Partitioning · Views for Securing · Soft Deletions

**Problem Sets:** Census Taker · The Private Eye · Bed and Breakfast

---

### Week 5 — Optimizing

**Topics:** Indexes · `CREATE INDEX` · `EXPLAIN QUERY PLAN` · Covering Indexes · B-Trees · Partial Indexes · `VACUUM` · Concurrency · Transactions · ACID · Atomicity · Consistency · Isolation · Durability · `BEGIN TRANSACTION` · `COMMIT` · `ROLLBACK` · Race Conditions · Locks

**Problem Sets:** In a Snap · your.harvard

---

### Week 6 — Scaling

**Topics:** Scalability · MySQL · Integers · Strings · Dates · Times · Real Numbers · Floating-Point Imprecision · Fixed Precision · Altering Tables · Stored Procedures · PostgreSQL · Vertical Scaling · Horizontal Scaling · Replication · Read Replicas · Sharding · Access Controls · `GRANT` · `REVOKE` · SQL Injection Attacks · Prepared Statements

**Problem Sets:** Happy to Connect (Sentimental) · From the Deep · Don't Panic! (Sentimental) with Python

## Technologies

* **SQL**
* **SQLite**
* **MySQL**
* **PostgreSQL**
* **Python**


## Skills Demonstrated

* Relational database querying
* Database design and normalization
* Entity Relationship Diagrams
* Primary and foreign keys
* Subqueries and complex joins
* Set operations
* Aggregation and grouping
* Data manipulation and CRUD operations
* CSV data import
* Triggers and soft deletions
* Views and Common Table Expressions
* Database indexing
* Query optimization
* Transactions and ACID properties
* Concurrency and database locks
* Database scalability
* Replication and sharding concepts
* Access controls
* SQL injection prevention
* SQL integration with Python


## Repository Structure

```text
.
├── week_0/
├── week_1/
├── week_2/
├── week_3/
├── week_4/
├── week_5/
├── week_6/
├── Final/
│   └── project/
│       ├── schema.sql
│       ├── sample_data.sql
│       ├── queries.sql
│       ├── DESIGN.md
│       ├── relationships.png
│       └── orms.db
└── README.md
```

Each directory contains the exercises and problem sets completed during the corresponding week of the course.

The `Final/project/` directory contains the final project, including the database schema, sample data, queries, design documentation, and entity relationship diagram.


## Final Project

### ORMS — Operating Room Management System

ORMS is a relational database designed to manage operating room schedules and the resources required for surgeries.

The project was inspired by the operating room whiteboard shown in *Grey's Anatomy*, where doctors, surgeons, and nurses can follow the surgeries scheduled for each day. The goal was to transform this idea into a structured database that can be used to manage surgeries, patients, medical staff, operating rooms, and equipment.

### Main Features

* Patient and medical record management
* Surgical procedure catalog
* Operating room management
* Medical staff and professional license tracking
* Equipment and room equipment management
* Surgery scheduling
* Many-to-many relationships between surgeries, staff, and equipment
* Daily surgical schedule
* Staff schedule
* Operating room status and next scheduled surgery
* Operating room utilization analysis
* Equipment availability verification
* Operating room scheduling conflict detection
* Medical staff scheduling conflict detection

### Database Design

The database was designed using relational database principles and includes:

* Primary and foreign keys
* `NOT NULL`, `UNIQUE`, and `CHECK` constraints
* Many-to-many junction tables
* Indexes for frequently used queries
* Views for schedules and operational analysis
* Triggers to prevent scheduling conflicts
* SQLite date and time functions for scheduling and utilization analysis

The main entities are:

`patients` · `procedures` · `operating_rooms` · `medical_staff` · `equipment` · `surgeries`

The project also includes the junction tables:

`surgery_staff` · `surgery_equipment` · `room_equipment`

### Project Files

```text
Final/
└── project/
    ├── schema.sql
    ├── sample_data.sql
    ├── queries.sql
    ├── DESIGN.md
    ├── relationships.png
    └── orms.db
```

The `schema.sql` file defines the database structure, `sample_data.sql` contains example records, and `queries.sql` contains queries demonstrating the functionality of the database. `DESIGN.md` documents the database design, relationships, optimizations, and limitations.

[View the Final Project](./Final/project)

## Author

**Barbara Barletta**

Data Analyst Intern · Python · SQL · Machine Learning · Risk Analytics

[GitHub](https://github.com/barlettab)
[Medium](https://medium.com/@barlettabc/from-grey-sloans-whiteboard-to-a-relational-database-4a40336625eb?postPublishedType=initial)
