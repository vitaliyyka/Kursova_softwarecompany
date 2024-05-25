USE SoftwareCompany;

CREATE TABLE Customers (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Person VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    ClientID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Customers(ClientID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    JobTitle VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE TaskStatus (
    StatusID INT PRIMARY KEY,
    StatusName VARCHAR(50)
);

CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100),
    ProjectID INT,
    AssignedTo INT,
    StatusID INT,
    StartDate DATE,
    EndDate DATE,
    Description TEXT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (StatusID) REFERENCES TaskStatus(StatusID)
);

ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_Customers
FOREIGN KEY (ClientID) REFERENCES Customers(ClientID);

ALTER TABLE Tasks
ADD CONSTRAINT FK_Tasks_Projects
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

ALTER TABLE Tasks
ADD CONSTRAINT FK_Tasks_Employees
FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID);

ALTER TABLE Tasks
ADD CONSTRAINT FK_Tasks_TaskStatus
FOREIGN KEY (StatusID) REFERENCES TaskStatus(StatusID);


