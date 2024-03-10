USE CSE581projects
-- Gender
CREATE TABLE Gender (
    GenderId INT IDENTITY(1,1) PRIMARY KEY,
    GenderDescription VARCHAR(50) NOT NULL
);
GRANT select on npatil09.Gender to Graders;


-- Race
CREATE TABLE Race (
    RaceId INT IDENTITY(1,1) PRIMARY KEY,
    RaceDescription VARCHAR(50) NOT NULL 
);
GRANT select on npatil09.Race to Graders;




-- Addresses
CREATE TABLE Addresses (
    AddressId INT IDENTITY(1,1) PRIMARY KEY,
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
);
GRANT select on npatil09.Addresses to Graders;



-- PersonInformation
CREATE TABLE PersonInformation (
    PersonId INT IDENTITY(1,1) PRIMARY KEY,
    NTID VARCHAR(50) NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
MiddleName VARCHAR(50),
    LastName VARCHAR(50)NOT NULL,
	Password VARCHAR(50) NOT NULL,
    GenderId INT,
    RaceId INT,
    SSN VARCHAR(11) UNIQUE,
    HomeAddressId INT,
    MailingAddressId INT,
    Email VARCHAR(100),
Cell INT,
	FOREIGN KEY (GenderId) REFERENCES Gender(GenderId),
	FOREIGN KEY (RaceId) REFERENCES Race(RaceId),
	FOREIGN KEY (HomeAddressId) REFERENCES addresses(AddressId),
	FOREIGN KEY (MailingAddressId) REFERENCES addresses(AddressId)
);
GRANT select on npatil09.PersonInformation to Graders;


-- ... Any additional tables as required by the ER diagram ...


-- StudentStatus
CREATE TABLE StudentStatus (
    StudentStatusId INT IDENTITY(1,1) PRIMARY KEY,
    StudentStatus VARCHAR(50) NOT NULL
);
GRANT select on npatil09.StudentStatus to Graders;



-- StudentType
CREATE TABLE StudentType (
    StudentTypeId INT IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
);
GRANT select on npatil09.StudentType to Graders;


-- StudentInformation
CREATE TABLE StudentInformation (
    StudentId INT IDENTITY(1,1) PRIMARY KEY,
    StudentTypeId INT,
    StudentStatusId INT,
    IsGraduate BIT,
PersonId INT,
    FOREIGN KEY (PersonId) REFERENCES PersonInformation(PersonId),
	FOREIGN KEY (StudentTypeId) REFERENCES StudentType(StudentTypeId),
	FOREIGN KEY (StudentStatusId) REFERENCES StudentStatus(StudentStatusId)
);
GRANT select on npatil09.StudentInformation to Graders;



-- SemesterText
CREATE TABLE SemesterText (
    SemesterTextId INT IDENTITY(1,1) PRIMARY KEY,
    SemesterDescription VARCHAR(100) NOT NULL
);
GRANT select on npatil09.SemesterText to Graders;



-- SemesterInfo
CREATE TABLE SemesterInfo (
    SemesterId INT IDENTITY(1,1) PRIMARY KEY,
    SemesterTextId INT,
    FirstDay DATE NOT NULL,
    LastDay DATE NOT NULL,
    FOREIGN KEY (SemesterTextId) REFERENCES SemesterText(SemesterTextId)
);
GRANT select on npatil09.SemesterInfo to Graders;


-- ClassRoom
CREATE TABLE ClassRoom (
    ClassRoomId INT IDENTITY(1,1) PRIMARY KEY,
    Building VARCHAR(50) NOT NULL,
Level INT,
    RoomNumber VARCHAR(10) NOT NULL,
    Projector BIT,
    TypeIndicator VARCHAR(50) NOT NULL,
    MaximumSeating INT
);
GRANT select on npatil09.ClassRoom to Graders;



-- Level
CREATE TABLE Level (
    CourseLevelId INT IDENTITY(1,1) PRIMARY KEY,
    LevelDescription VARCHAR(255) NOT NULL
);
GRANT select on npatil09.Level to Graders;



-- Department
CREATE TABLE Department (
    DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentTitle VARCHAR(255) NOT NULL
);
GRANT select on npatil09.Department to Graders;



-- SubCourses
CREATE TABLE SubCourses (
     CourseCode VARCHAR(10) PRIMARY KEY,
    SubCourseTitle VARCHAR(255) NOT NULL
);
GRANT select on npatil09.SubCourses to Graders;


-- CourseCatalogue
CREATE TABLE CourseCatalogue (
    CourseCode VARCHAR(10) NOT NULL,
    CourseNumber INT NOT NULL,
    CourseTitle VARCHAR(255) NOT NULL,
	PRIMARY KEY(CourseCode, CourseNumber),
    CourseDescription TEXT NOT NULL, 
    DepartmentId INT,
    CourseLevelId INT,
    CreditHours INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId),
    FOREIGN KEY (CourseLevelId) REFERENCES Level(CourseLevelId),
    FOREIGN KEY (CourseCode) REFERENCES SubCourses(CourseCode) 
);
GRANT select on npatil09.CourseCatalogue to Graders;


-- CourseSchedule
CREATE TABLE CourseSchedule (
    CRN INT IDENTITY(1,1) PRIMARY KEY,
    CourseCode VARCHAR(10),
    CourseNumberSection INT NOT NULL,
    SemesterId INT NOT NULL,
    LocationId INT NOT NULL,
    FOREIGN KEY (CourseCode, CourseNumberSection) REFERENCES CourseCatalogue(CourseCode,CourseNumber),
    FOREIGN KEY (SemesterId) REFERENCES SemesterInfo(SemesterId),
    FOREIGN KEY (LocationId) REFERENCES ClassRoom(ClassRoomId)
);
GRANT select on npatil09.CourseSchedule to Graders;



-- ... Additional CREATE TABLE statements for the remaining entities ...
-- EnrollmentStatus
CREATE TABLE EnrollmentStatus (
    StatusId INT IDENTITY(1,1) PRIMARY KEY,
    StatusDescription VARCHAR(100) NOT NULL
);
GRANT select on npatil09.EnrollmentStatus to Graders;



-- CourseEnrollment
CREATE TABLE CourseEnrollment (
    StudentId INT IDENTITY(1,1),
    CRN INT NOT NULL,
    EnrollmentStatusId INT,
    MidtermGrade CHAR(2) NOT NULL,
    FinalGrade CHAR(2) NOT NULL,
    PRIMARY KEY (StudentId, CRN),
    FOREIGN KEY (StudentId) REFERENCES StudentInformation(StudentId),
	FOREIGN KEY (CRN) REFERENCES CourseSchedule(CRN),
	FOREIGN KEY (EnrollmentStatusId) REFERENCES EnrollmentStatus(StatusId)
);
GRANT select on npatil09.CourseEnrollment to Graders;




-- ... Additional CREATE TABLE statements for other entities ...
-- College
CREATE TABLE College (
    CollegeId INT IDENTITY(1,1) PRIMARY KEY,
    CollegeName VARCHAR(255) NOT NULL
);
GRANT select on npatil09.College to Graders;



-- DegreeOfStudy
CREATE TABLE DegreeOfStudy (
    DegreeOfStudyId INT IDENTITY(1,1) PRIMARY KEY,
    CollegeId INT,
    StudyTitle VARCHAR(255) NOT NULL,
    FOREIGN KEY (CollegeId) REFERENCES College(CollegeId)
);
GRANT select on npatil09.DegreeOfStudy to Graders;



-- studentAreaOfStudy
CREATE TABLE studentAreaOfStudy (
    AreaId INT IDENTITY(1,1) PRIMARY KEY,
    StudentId INT,
    DegreeOfStudyId INT,
    Major BIT NOT NULL, -- Assuming Major is a boolean indicating whether this is a major area of study.
    FOREIGN KEY (StudentId) REFERENCES StudentInformation(StudentId),
    FOREIGN KEY (DegreeOfStudyId) REFERENCES DegreeOfStudy(DegreeOfStudyId)
);
GRANT select on npatil09.studentAreaOfStudy to Graders;



-- Prerequisites
CREATE TABLE Prerequisites (
    PrerequisiteId INT IDENTITY(1,1) PRIMARY KEY,
    ParentCode VARCHAR(10) NOT NULL,
    ParentNumber INT NOT NULL,
    ChildCode VARCHAR(10) NOT NULL,
    ChildNumber INT NOT NULL,
	FOREIGN KEY (ParentCode,ParentNumber) REFERENCES CourseCatalogue(CourseCode,CourseNumber),
    FOREIGN KEY (ChildCode,ChildNumber) REFERENCES CourseCatalogue(CourseCode,CourseNumber),
	
);
GRANT select on npatil09.Prerequisites to Graders;



-- EmployeeInfo
CREATE TABLE EmployeeInfo (
    EmployeeId INT IDENTITY(1,1),
    AnnualSalary DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY (EmployeeId) REFERENCES PersonInformation(PersonId)
);
GRANT select on npatil09.EmployeeInfo to Graders;



-- BenefitType
CREATE TABLE BenefitType (
    BenefitTypeId INT IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL
);
GRANT select on npatil09.BenefitType to Graders;


-- BenefitCoverage
CREATE TABLE BenefitCoverage (
    BenefitCoverId INT IDENTITY(1,1) PRIMARY KEY,
    CoverageDescription VARCHAR(255) NOT NULL
);
GRANT select on npatil09.BenefitCoverage to Graders;


-- EmployeeBenefits
CREATE TABLE EmployeeBenefits (
    EmployeeId INT,
    BenefitTypeId INT,
    BenefitCoverId INT,
	PRIMARY KEY(BenefitTypeId, BenefitCoverId, EmployeeId),
    EmployeePremium DECIMAL(10,2), -- This column represents the premium amount
    -- Additional attributes like effective dates, costs, etc.
    EmployerPremium DECIMAL(10,2),
    FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo(EmployeeId),
    FOREIGN KEY (BenefitTypeId) REFERENCES BenefitType(BenefitTypeId),
    FOREIGN KEY (BenefitCoverId) REFERENCES BenefitCoverage(BenefitCoverId)
);
GRANT select on npatil09.EmployeeBenefits to Graders;



-- ... Any additional tables as required by the ER diagram ...
-- EmployeeAndJobs
CREATE TABLE JobTypeDetail (
	JobTypeDetailId INT IDENTITY(1,1) ,
    JobTypeDescription VARCHAR(255) NOT NULL,
    PRIMARY KEY (JobTypeDetailId),
); 
GRANT select on npatil09.JobTypeDetail to Graders;



CREATE TABLE JobDescription (
    JobId INT IDENTITY(1,1) PRIMARY KEY,
    MinPay DECIMAL(10,2),
	JobDescription VARCHAR(255) NOT NULL,
    MaxPay DECIMAL(10,2),
    IsFaculty BIT,
	JobTypeDetailId INT,
    FOREIGN KEY (JobTypeDetailId) REFERENCES JobTypeDetail(JobTypeDetailId)
);
GRANT select on npatil09.JobDescription to Graders;



-- JobInformation
CREATE TABLE EmployeeandJobs (
    JobId INT IDENTITY(1,1),
    EmployeeId INT,
	PRIMARY KEY(JobId,EmployeeId),
	FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo(EmployeeId),
    FOREIGN KEY (JobId) REFERENCES Jobdescription(JobId),
);
GRANT select on npatil09.EmployeeandJobs to Graders;


-- DailySchedule
CREATE TABLE DailySchedule (
    DailyId INT IDENTITY(1,1) PRIMARY KEY,
    CRN INT,
    DayOfWeek VARCHAR(10),
    StartHour TIME,
    EndHour TIME,
    FOREIGN KEY (CRN) REFERENCES CourseSchedule(CRN)
);
GRANT select on npatil09.DailySchedule to Graders;


-- EmployeeAndCourse
CREATE TABLE EmployeeAndCourse (
    EmployeeId INT,
    CRN INT,
    PRIMARY KEY (EmployeeId, CRN),
    FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo(EmployeeId),
    FOREIGN KEY (CRN) REFERENCES CourseSchedule(CRN)
);
GRANT select on npatil09.EmployeeAndCourse to Graders;