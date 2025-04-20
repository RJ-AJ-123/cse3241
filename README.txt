# Bits & Books Database Project

## Purpose of This README.md
    This file serves as the table of contents and instructions for rebuilding and navigating the Bits & Books database project.
    It includes:
        A description of each file and its role
        Instructions for rebuilding the database
        Notes on project compliance and completeness

# Project Directory Structure

BitsAndBooks-FinalProject/
- README.md
- FinalReport.pdf            
- UserManual.pdf             
- project.sqlite             
- CreateDatabase.sql         
- LoadData.sql               
- FinalQueries.sql           
- SampleInsertDelete.sql     
- Checkpoints/               
  - Checkpoint1.pdf
  - Checkpoint2.pdf
  - Checkpoint3.pdf
  - Checkpoint4.pdf          


## File Descriptions

### `README.md`
- Table of contents and rebuild instructions.

### `FinalReport.pdf`
- **ER Model**: Clean layout (no hand-drawing) with entities, relationships, and cardinalities.
- **Relational Schema**: Primary keys, foreign keys, and functional dependencies for each table.
- **Normalization**: Normal form of each table, with BCNF notes if applicable.
- **Indexes**: Created indexes with rationale.
- **Views**: Purpose in English, relational algebra, SQL definition, and sample output.
- **Transactions**: Three multi-statement SQL transactions with detailed explanations.

### `UserManual.pdf`
- Table descriptions, attribute types, and constraints.
- Sample queries (Checkpoints 02 & 03) with English description, relational algebra, and SQL.
- INSERT/DELETE examples for books, publishers, authors, and customers.
- Explanation of insert/delete dependency order.

### `project.sqlite`
- The finalized SQLite database file containing all tables, views, indexes, and at least 20 rows of sample data.

### `CreateDatabase.sql`
- All structural creation statements (CREATE TABLE, CREATE VIEW, CREATE INDEX).
- Well-commented and formatted for standalone execution.

### `LoadData.sql`
- All INSERT INTO statements, ordered to respect foreign-key dependencies.
- Includes controlled UPDATE or DELETE commands where necessary.

### `FinalQueries.sql`
- SELECT queries referenced in `FinalReport.pdf`.
- Comments indicate the corresponding section of the report for each query.

### `SampleInsertDelete.sql`
- Optional file containing INSERT and DELETE commands as demonstrated in the `UserManual.pdf`.

### `Checkpoints/`
- Original graded checkpoint submissions (Checkpoint1–4) including revisions and instructor feedback.

## Rebuilding the Database
To rebuild the database from scratch, run the following commands in your terminal:
```bash
sqlite3 project.sqlite < CreateDatabase.sql
sqlite3 project.sqlite < LoadData.sql

Alternatively, open project.sqlite directly in:
    DataGrip or https://sqliteonline.com/
