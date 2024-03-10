<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>University Database Series Overview</h1>    
    <!-- Project 1: Database Design -->
    <h2>Project 1: Database Design</h2>
    <p>Project 1 involves conceptualizing and designing a database that effectively stores and manages data relevant to a university's operational needs. This includes information about students, employees, semesters, and courses, among others. </p>
    <h3>Main Tasks:</h3>
    <ul>
        <li>Breaking down the business problem into logical data storage units (tables).</li>
        <li>Normalizing the design to at least the 2nd or 3rd normal form to ensure efficiency and reduce redundancy.</li>
        <li>Creating a detailed diagram that displays tables, columns, keys (primary and foreign), and relationships between tables.</li>
    </ul>
    <!-- Project 2: Database Implementation -->
    <h2>Project 2: Database Implementation and Dummy Data</h2>
    <p>Building upon the design, this phase involved the actual creation of the database in an SQL environment, incorporating design modifications, populating it with dummy data, and ensuring proper access controls were in place.</p>
    <h3>Key Activities:</h3>
    <ul>
        <li>Creating SQL scripts to define tables, keys, and relationships based on the design.</li>
        <li>Modifying the design as needed with justification for changes.</li>
        <li>Loading the database with dummy data to represent realistic scenarios and relationships between entities.</li>
        <li>Granting necessary permissions for data access and evaluation.</li>
    </ul>
    <!-- Project 3: Advanced Database Features -->
    <h2>Project 3: Advanced Database Management with Stored Procedures, Functions, and Views</h2>
    <p>Enhance the SQL database developed in Projects 1 and 2 by introducing advanced features like stored procedures, a function, and a view to support complex operations, data manipulation, and analytics within the CSE581Projects database.</p>
    <h3>Components:</h3>
    <h4>Stored Procedures:</h4>
    <ul>
        <li>SP1: This stored procedure likely involves using a cursor to iterate over a set of records for processing. Cursors are useful for row-by-row operations within SQL.</li>
        <li>SP2: Aimed at updating data in a table with validation, this stored procedure ensures that any updates adhere to specific business rules or constraints, maintaining data integrity.</li>
        <li>SP3: This procedure focuses on deleting data from a table, potentially with conditions to ensure only appropriate records are removed, safeguarding against accidental loss of critical information.</li>
        <li>SP4: A custom stored procedure performing a unique business action, which might involve complex operations such as batch updates, reporting, or calculations specific to the database's domain.</li>
    </ul>
    <h4>Function:</h4>
    <p>A SQL function designed to execute a particular task that's not covered in the lab exercises. Functions differ from stored procedures in that they can return a value and can be used in SQL statements wherever expressions are valid.</p>
    <h4>View:</h4>
    <p>A view named "Benefits," which aggregates and presents data related to every employee's benefits, including types of benefits, coverage details, and premium amounts. Views are used for simplifying data access and improving security by abstracting the underlying table structures.</p>
</body>
</html>
