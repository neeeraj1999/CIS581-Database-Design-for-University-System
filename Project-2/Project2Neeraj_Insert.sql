
INSERT INTO Gender (GenderDescription) VALUES
    ('Male'),
    ('Female'),
    ('Non-Binary'),
    ('Other');

-- Insert dummy data into Race table
INSERT INTO Race (RaceDescription) VALUES
    ('Caucasian'),
    ('African American'),
    ('Hispanic'),
    ('Asian'),
    ('Native American'),
    ('Other');

-- Insert dummy data into Address table
INSERT INTO Addresses(Street, City, State, Country, ZipCode) VALUES
    ('123 Main St', 'New York', 'New York', 'United States', '10001'),
    ('456 Oak Ave', 'Los Angeles', 'California', 'United States', '90001'),
    ('789 Pine Blvd', 'London', 'United Kingdom', 'United Kingdom', 'SW1A 1AA'),
    ('101 Maple Ln', 'Berlin', 'Germany', 'Germany', '10115'),
    ('202 Birch St', 'Paris', 'France', 'France', '75001'),
    ('303 Cedar Ave', 'Tokyo', 'Japan', 'Japan', '100-0001');

-- Insert dummy data into PersonInformation table
INSERT INTO PersonInformation (NTID, FirstName, LastName, Password, GenderId, RaceId, SSN, HomeAddressId, MailingAddressId, Email) VALUES
    ('JDoe', 'John', 'Doe', 'password1', 1, 1, '123-45-6789', 1, 2, 'john.doe@email.com'),
    ('AJohnson', 'Alice', 'Johnson', 'password2', 2, 2, '987-65-4321', 2, 3, 'alice.johnson@email.com'),
    ('BGutierrez', 'Bob', 'Gutierrez', 'password3', 1, 3, '456-78-9012', 3, 4, 'bob.gutierrez@email.com'),
    ('ELee', 'Emma', 'Lee', 'password4', 2, 4, '789-01-2345', 4, 5, 'emma.lee@email.com'),
    ('DRaine', 'Daniel', 'Raine', 'password5', 1, 5, '012-34-5678', 5, 6, 'daniel.raine@email.com'),
    ('OWang', 'Olivia', 'Wang', 'password6', 2, 6, '345-67-8901', 6, 1, 'olivia.wang@email.com');

-- Insert dummy data into StudentStatus table
INSERT INTO StudentStatus (StudentStatus) VALUES
    ('Active'),
    ('Inactive'),
    ('On Hold'),
    ('Graduated'),
    ('Suspended'),
    ('Withdrawn');

-- Insert dummy data into StudentType table
INSERT INTO StudentType (TypeName) VALUES
    ('Full-Time'),
    ('Part-Time'),
    ('Online'),
    ('Transfer'),
    ('International');

-- Insert dummy data into StudentInformation table
INSERT INTO StudentInformation (StudentTypeId, StudentStatusId, IsGraduate) VALUES
    (1, 1, 0),  -- Full-Time, Active, Not a Graduate
    (2, 2, 0),  -- Part-Time, Inactive, Not a Graduate
    (3, 3, 0),  -- Online, On Hold, Not a Graduate
    (4, 4, 0),  -- Transfer, Graduated, Not a Graduate
    (5, 5, 0),  -- International, Suspended, Not a Graduate
    (1, 6, 1);  -- Full-Time, Withdrawn, Graduate

-- Insert dummy data into SemesterText table
INSERT INTO SemesterText (SemesterDescription) VALUES
    ('Fall 2023'),
    ('Spring 2024'),
    ('Summer 2024'),
    ('Fall 2024'),
    ('Spring 2025'),
    ('Summer 2025');

-- Insert dummy data into SemesterInfo table
INSERT INTO SemesterInfo (SemesterTextId, FirstDay, LastDay) VALUES
    (1, '2023-09-01', '2023-12-15'),  -- Fall 2023
    (2, '2024-01-15', '2024-05-30'),  -- Spring 2024
    (3, '2024-06-15', '2024-08-31'),  -- Summer 2024
    (4, '2024-09-01', '2024-12-15'),  -- Fall 2024
    (5, '2025-01-15', '2025-05-30'),  -- Spring 2025
    (6, '2025-06-15', '2025-08-31');  -- Summer 2025

-- Insert dummy data into ClassRoom table
-- projector (1-Yes , 0-No)
INSERT INTO ClassRoom (Building, RoomNumber, Projector, TypeIndicator, MaximumSeating) VALUES
    ('Science Hall', '101', 1, 'Lecture Hall', 30), 
    ('Engineering Building', '201', 0, 'Standard Classroom', 25),
    ('Arts Center', '301', 1, 'Studio', 40),
    ('Business Complex', '401', 0, 'Standard Classroom', 35),
    ('Liberal Arts Building', '501', 1, 'Lecture Hall', 50),
    ('Technology Center', '601', 0, 'Standard Classroom', 45);

INSERT INTO Level (LevelDescription) VALUES
    ('Undergraduate'),
    ('Graduate'),
    ('PhD');

-- Insert dummy data into Department table
INSERT INTO Department (DepartmentTitle) VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Biology');

-- Insert dummy data into SubCourses table
INSERT INTO SubCourses (CourseCode, SubCourseTitle) VALUES
    ('SC101', 'Introduction to Science'),
    ('EC201', 'Advanced Economics'),
    ('AR301', 'Art History'),
    ('BU401', 'Business Ethics'),
    ('LS501', 'Literature Seminar'),
    ('CS601', 'Advanced Computer Science');

-- Insert dummy data into CourseCatalogue table
INSERT INTO CourseCatalogue (CourseCode, CourseNumber, CourseTitle, CourseDescription, DepartmentId, CourseLevelId, CreditHours) VALUES
    ('SC101', 101, 'Introduction to Science', 'Fundamental concepts of computer science.', 1, 1, 3),
    ('EC201', 201, 'Advanced Economics', 'An overview of macroeconomic principles.', 2, 2, 3),
    ('AR301', 301, 'Renaissance Art', 'Study of art during the Renaissance period.', 3, 3, 3),
    ('BU401', 401, 'Business Strategy', 'Strategic management in business.', 4, 2, 3),
    ('LS501', 501, 'Modern Literature', 'Exploration of modern literary works.', 3, 1, 3),
    ('CS601', 601, 'Advanced Algorithms', 'In-depth study of advanced algorithms.', 1, 3, 3);

-- Insert dummy data into CourseSchedule table
INSERT INTO CourseSchedule (CourseCode, CourseNumberSection, SemesterId, LocationId) VALUES
    ('SC101', 101, 1, 1),
    ('EC201', 201, 2, 2),
    ('AR301', 301, 3, 3),
    ('BU401', 401, 4, 4),
    ('LS501', 501, 5, 5),
    ('CS601', 601, 6, 6);

-- Insert dummy data into EnrollmentStatus table
INSERT INTO EnrollmentStatus (StatusDescription) VALUES
    ('Enrolled'),
    ('Enrolled'),
    ('Waitlisted'),
    ('Enrolled'),
    ('Enrolled'),
    ('Waitlisted');

-- Insert dummy data into CourseEnrollment table
INSERT INTO CourseEnrollment (CRN, EnrollmentStatusId, MidtermGrade, FinalGrade) VALUES
    ( 1, 1, 'A', 'A'),
    ( 2, 2, 'B', 'B'),
    ( 3, 3, 'C', 'C'),
    ( 4, 1, 'A-', 'A-'),
    ( 5, 2, 'B+', 'B+'),
    ( 6, 3, 'C-', 'C-');

-- Insert dummy data into College table
INSERT INTO College (CollegeName) VALUES
    ('College of Science'),
    ('College of Business'),
    ('College of Arts');

-- Insert dummy data into DegreeOfStudy table
INSERT INTO DegreeOfStudy (CollegeId, StudyTitle) VALUES
    (1, 'Bachelor of Science in Computer Science'),
    (2, 'Bachelor of Business Administration'),
    (3, 'Bachelor of Arts in Fine Arts');

-- Insert dummy data into studentAreaOfStudy table
INSERT INTO studentAreaOfStudy (StudentId, DegreeOfStudyId, Major) VALUES
    (1, 1, 1),
    (2, 2, 0), -- Assuming 0 represents not a major
    (3, 3, 1),
    (4, 1, 1),
    (5, 2, 0),
    (6, 3, 1);

-- Insert dummy data into Prerequisites table
INSERT INTO Prerequisites (ParentCode, ParentNumber, ChildCode, ChildNumber) VALUES
    ('SC101', 101, 'EC201', 201),
    ('AR301', 301, 'BU401', 401),
    ('LS501', 501, 'CS601', 601),
    ('EC201', 201, 'BU401', 401),
    ('SC101', 101, 'CS601', 601),
    ('AR301', 301, 'LS501', 501);

-- Insert dummy data into EmployeeInfo table
INSERT INTO EmployeeInfo (AnnualSalary) VALUES
    (75000.00),
    (60000.00),
    (80000.00),
    (70000.00),
    (85000.00),
    (72000.00);

-- Insert dummy data into BenefitType table
INSERT INTO BenefitType (TypeName) VALUES
    ('Health Insurance'),
    ('Dental Insurance'),
    ('Retirement Plan'),
    ('Paid Time Off'),
    ('Flexible Spending Account');

-- Insert dummy data into BenefitCoverage table
INSERT INTO BenefitCoverage (CoverageDescription) VALUES
    ('Full Coverage'),
    ('Partial Coverage'),
    ('Limited Coverage'),
    ('Basic Coverage'),
    ('Extended Coverage');

-- Insert dummy data into EmployeeBenefits table
INSERT INTO EmployeeBenefits (EmployeeId, BenefitTypeId, BenefitCoverId, EmployeePremium, EmployerPremium) VALUES
    (1, 1, 1, 100.00, 200.00),
    (2, 2, 2, 150.00, 180.00),
    (3, 3, 3, 120.00, 210.00),
    (4, 4, 4, 130.00, 190.00),
    (5, 5, 5, 110.00, 220.00),
    (6, 1, 2, 140.00, 200.00);

-- Insert dummy data into JobTypeDetail table
INSERT INTO JobTypeDetail (JobTypeDescription) VALUES
    ('Full-time'),
    ('Part-time'),
    ('Contract'),
    ('Temporary');

-- Insert dummy data into JobDescription table
INSERT INTO JobDescription (MinPay, JobDescription, MaxPay, IsFaculty, JobTypeDetailId) VALUES
    (50000.00, 'Software Engineer', 80000.00, 0, 1),
    (45000.00, 'Administrative Assistant', 60000.00, 0, 2),
    (60000.00, 'Professor', 100000.00, 1, 3),
    (48000.00, 'Customer Service Representative', 65000.00, 0, 2),
    (55000.00, 'Data Analyst', 75000.00, 0, 1),
    (70000.00, 'Dean', 120000.00, 1, 3);


-- Insert dummy data into EmployeeandJobs table
INSERT INTO EmployeeandJobs (EmployeeId) VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6);

-- Insert dummy data into DailySchedule table
INSERT INTO DailySchedule (CRN, DayOfWeek, StartHour, EndHour) VALUES
    (1, 'Monday', '08:00:00', '10:00:00'),
    (2, 'Wednesday', '11:00:00', '13:00:00'),
    (3, 'Friday', '14:00:00', '16:00:00'),
    (4, 'Tuesday', '09:30:00', '11:30:00'),
    (5, 'Thursday', '13:30:00', '15:30:00'),
    (6, 'Monday', '10:30:00', '12:30:00');

-- Insert dummy data into EmployeeAndCourse table
INSERT INTO EmployeeAndCourse (EmployeeId, CRN) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);











