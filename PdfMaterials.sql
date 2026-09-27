CREATE TABLE PdfMaterials
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    Category NVARCHAR(50),        -- GK / Syllabus / Material
    Title NVARCHAR(300),          -- PDF Title
    Description NVARCHAR(500),    -- Short info
    PdfPath NVARCHAR(300),        -- /PDF/filename.pdf

    PostDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);
