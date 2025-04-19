# cse3241
database 

Project Directory Structure

BitsAndBooks-FinalProject/
├── README.md                            
├── FinalReport.pdf                      # Database schema, ER model, views, transactions 
├── UserManual.pdf                       # Table definitions, sample queries, insert/delete syntax 
├── project.sqlite                       # Final SQLite DB with all tables, views, indexes, and data
├── CreateDatabase.sql                   # CREATE TABLE / VIEW / INDEX scripts (structural only)
├── LoadData.sql                         # Data population scripts (INSERTs only, in dependency order)
├── FinalQueries.sql                     # Sample SELECT queries from the report, with comments
├── SampleInsertDelete.sql               # Optional: Insert/Delete commands from User Manual (if separate)
├── Checkpoints/                         # Graded Checkpoints + revisions (included as required)
│   ├── Checkpoint1.pdf
│   ├── Checkpoint2.pdf
│   ├── Checkpoint3.pdf
│   └── Checkpoint4.pdf                  # Includes feedback from instructor

Purpose of This README.md
    This file serves as the table of contents and instructions for rebuilding and navigating the Bits & Books database project.
    It includes:
        A description of each file and its role
        Instructions for rebuilding the database
        Notes on project compliance and completeness

File Descriptions
    FinalReport.pdf
        ER Model
            Clean layout, no hand-drawing
            Entities, relationships, cardinalities
        Relational Schema
            PK, FK, and functional dependencies for each table
        Normalization 
            Normal form for each table, with BCNF notes if applicable
        Indexes
            Created indexes with rationale
        Views
            English purpose, relational algebra, SQL, and sample output
        Transactions 
            Three multi-statement SQL transactions with explanations
    UserManual.pdf
        Table descriptions, attribute types, and constraints
        Sample queries from Checkpoints 02 & 03 (with English + RA + SQL)
        INSERT/DELETE examples for books, publishers, authors, customers
        Explanation of insert/delete dependency order
    project.sqlite
        The final SQLite database file
        Contains all tables, views, indexes, and 20+ rows of sample data
    CreateDatabase.sql
        Contains all structural creation statements:
            CREATE TABLE, CREATE VIEW, CREATE INDEX
        No INSERT/DELETE
        Well-commented and formatted for standalone execution
    LoadData.sql
        Contains all INSERT INTO statements
        Ordered to respect FK dependencies
        Include a few controlled UPDATE or DELETE commands
    FinalQueries.sql
        SELECT queries from FinalReport.pdf
        Comments indicate which section of the report each query corresponds to
        Can be pasted into SQLite command-line or GUI tools
    Checkpoints/
        All original graded checkpoint submissions

Rebuilding the Database
    You can rebuild the database from scratch using the following steps:
        sqlite3 project.sqlite < CreateDatabase.sql 
        sqlite3 project.sqlite < LoadData.sql

Alternatively, open project.sqlite directly in:
    DataGrip or https://sqliteonline.com/
