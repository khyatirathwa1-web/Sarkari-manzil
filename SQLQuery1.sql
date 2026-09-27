CREATE TABLE ContactMessages (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Message NVARCHAR(MAX),
    CreatedDate DATETIME DEFAULT GETDATE()
);
