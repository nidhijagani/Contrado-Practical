
CREATE TABLE [dbo].[DepartmentMaster](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DesignationMaster](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_DesignationMaster] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EmployeeMaster](
	[EmployeeId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpTagNumber] [nvarchar](50) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](150) NULL,
	[DepartmentId] [int] NULL,
	[DesignationId] [int] NULL,
	[Birthdate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DepartmentMaster] ON 
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [Department]) VALUES (1, N'Development')
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [Department]) VALUES (2, N'Networking')
GO
INSERT [dbo].[DepartmentMaster] ([DepartmentId], [Department]) VALUES (3, N'HR')
GO
SET IDENTITY_INSERT [dbo].[DepartmentMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DesignationMaster] ON 
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (1, N'Trainee', 1)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (2, N'Trainee', 2)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (3, N'Junior', 1)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (4, N'Junior', 2)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (5, N'Project Manager', 1)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (6, N'HR', 3)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (7, N'HRManager', 3)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (8, N'TeamLead', 1)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (9, N'HOD', 2)
GO
INSERT [dbo].[DesignationMaster] ([DesignationId], [Designation], [DepartmentId]) VALUES (10, N'Sr. Software Developer', 1)
GO
SET IDENTITY_INSERT [dbo].[DesignationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] ON 
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'ND145896', N'Nidhi', N'Jagani', N'nidhijagani@gmail.com', 1, 3, CAST(N'1995-01-26T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-05-19T11:15:02.660' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'ND145896', N'Nidhi 123', N'Jagani', N'nidhijagani01@gmail.com', 1, 3, CAST(N'1995-01-26T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-05-19T11:15:22.337' AS DateTime), 0, CAST(N'2024-05-19T11:16:37.670' AS DateTime), 0)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'ND145896', N'Nidhi 123', N'Jagani', N'nidhijagani02@gmail.com', 1, 3, CAST(N'1995-01-26T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-05-19T11:17:02.027' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'ND1526', N'nIDHI', N'Jagani', N'nidhi.j01@gmail.com', 1, 1, CAST(N'1995-01-25T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:35:14.613' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'ND45652', N'Nidhi78', N'Jagani1452', N'nidhijagani123@gmail.com', 1, 1, CAST(N'2024-04-30T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:36:43.777' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'ND1212', N'Nidhi', N'Jagani', N'nidhijagani799@gmail.com', 2, 4, CAST(N'2024-05-01T18:30:00.000' AS DateTime), NULL, 1, CAST(N'2024-05-19T15:37:22.627' AS DateTime), NULL, CAST(N'2024-05-19T19:02:10.040' AS DateTime), NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'ND895', N'nIDHI', N'Jagani', N'nidhi@gmail.com', 1, 1, CAST(N'2024-05-02T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:37:57.630' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'ND123456', N'Nidhi', N'Patel', N'nidhi01jagani@gmail.com', 1, 0, CAST(N'2024-05-01T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:38:36.793' AS DateTime), NULL, CAST(N'2024-05-19T17:57:08.883' AS DateTime), NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'ND9875', N'Nidhi', N'Patel', N'nidhi.jagani123@gmail.com', 2, 9, CAST(N'2022-05-15T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:39:19.500' AS DateTime), NULL, CAST(N'2024-05-19T19:11:15.733' AS DateTime), NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'SE896', N'Nidhi', N'Jagani', N'nidhijganai987@gmail.com', 2, 4, CAST(N'2016-01-12T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T15:40:05.333' AS DateTime), NULL, CAST(N'2024-05-19T19:11:04.627' AS DateTime), NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'EP89``', N'Nidhi', N'Jagani', N'nidhijagani6@gmail.com', 1, 1, CAST(N'2024-05-16T18:30:00.000' AS DateTime), NULL, 1, CAST(N'2024-05-19T15:41:25.147' AS DateTime), NULL, CAST(N'2024-05-19T19:02:03.340' AS DateTime), NULL)
GO
INSERT [dbo].[EmployeeMaster] ([EmployeeId], [EmpTagNumber], [FirstName], [LastName], [EmailAddress], [DepartmentId], [DesignationId], [Birthdate], [IsActive], [IsDeleted], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'ND986', N'Nisha', N'Dave', N'nisha.dave@gmail.com', 3, 7, CAST(N'1995-01-02T18:30:00.000' AS DateTime), NULL, 0, CAST(N'2024-05-19T17:34:38.267' AS DateTime), NULL, CAST(N'2024-05-19T18:13:20.910' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[EmployeeMaster] OFF
GO
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeMaster] ADD  CONSTRAINT [DF_EmployeeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

CREATE PROCEDURE [dbo].[AddUpdateEmployeeDetail] 
@employeeId int = 0,
@empTagNumber nvarchar(50) = null,
@firstName nvarchar(100) = null,
@lastName nvarchar(100),
@emailAddress nvarchar(150),
@designationId int,
@departmentId int,
@birthdate datetime,
@createdBy int = null,
@isActive bit = null
AS
BEGIN
	SET NOCOUNT ON;
IF((SELECT COUNT(*) FROM EmployeeMaster WHERE EmployeeId != @employeeId and EmailAddress = @emailAddress AND ISNULL(IsDeleted,0) = 0) = 0)
BEGIN
	IF(@employeeId > 0)
	BEGIN
		UPDATE EmployeeMaster
		SET EmpTagNumber = @empTagNumber,
			FirstName = @firstName,
			LastName = @lastName,
			EmailAddress = @emailAddress,
			DepartmentId = @departmentId,
			DesignationId = @designationId,
			Birthdate = @birthdate,
			IsActive = @isActive,
			UpdatedBy = @createdBy,
			UpdatedDate = GETUTCDATE()
		WHERE EmployeeId = @employeeId
		SELECT @employeeId AS Id, 'Employee detail saved successfully.' AS Message, 1 AS Success

	END
	ELSE
	BEGIN
		INSERT INTO EmployeeMaster
		(
			[EmpTagNumber]
           ,[FirstName]
           ,[LastName]
           ,[EmailAddress]
           ,[DepartmentId]
           ,[DesignationId]
           ,[Birthdate]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[IsActive]
           ,[IsDeleted]
		)
		values
		(
			@empTagNumber,
			@firstName,
			@lastName,
			@emailAddress,
			@departmentId,
			@designationId,
			@birthdate,
			GETUTCDATE(),
			@createdBy,
			@isActive,
			0
		)
		SELECT SCOPE_IDENTITY() AS Id, 'Employee detail saved successfully.' AS Message, 1 AS Success
	END
END
ELSE
BEGIN
	SELECT @employeeId AS Id, 'Employee emailaddress already exist.' AS Message, 0 AS Success
END
END
GO

CREATE PROCEDURE [dbo].[DeleteEmployee] 
@employeeId int = 0,
@updatedBy bigint = null
AS
BEGIN
	SET NOCOUNT ON;
		UPDATE EmployeeMaster 
		SET IsDeleted = 1,
			UpdatedBy = @updatedBy,
			UpdatedDate = GETUTCDATE()
		WHERE EmployeeId = @employeeId
		
		SELECT @employeeId AS Id, 'Employee deleted successfully.' AS Message, 1 AS Success
END
GO

CREATE PROCEDURE [dbo].[GetDepartmentList] 
AS
BEGIN
SET NOCOUNT ON;
	SELECT 
		dm.DepartmentId AS Id,
		dm.Department AS Name
	FROM DepartmentMaster dm
END
GO

CREATE PROCEDURE [dbo].[GetDesignationList] 
@departmentId int
AS
BEGIN
SET NOCOUNT ON;
	SELECT 
		dm.DesignationId AS Id,
		dm.Designation AS Name
	FROM DesignationMaster dm
	WHERE DepartmentId = @departmentId
END
GO

CREATE PROCEDURE [dbo].[GetEmployeeDetailsByEmployeeId] 
@employeeId int = 0
AS
BEGIN
SET NOCOUNT ON;
	SELECT 
		em.employeeId,
		em.EmpTagNumber,
		em.FirstName,
		em.LastName,
		em.EmailAddress,
		em.Birthdate,
		em.DepartmentId,
		em.DesignationId
	FROM EmployeeMaster em WITH (NOLOCK)
	WHERE  ISNULL(em.IsDeleted,0) = 0 AND em.EmployeeId = @employeeId
END
GO

--exec GetEmployeeList 10,1,'EmpTagNumber','desc','Ni'
CREATE PROCEDURE [dbo].[GetEmployeeList] 
    @pageSize INT = 10,
    @pageNumber INT = 1,
    @orderBy NVARCHAR(20) = 'EmpTagNumber',
    @sortBy NVARCHAR(5) = 'desc',
	@searchValue NVARCHAR(150) = ''
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate sortBy parameter
    IF @sortBy NOT IN ('asc', 'desc')
    BEGIN
        SET @sortBy = 'desc';
    END
	 DECLARE @sql NVARCHAR(MAX);
	     -- Total record count variable
    DECLARE @totalRecords INT;
    -- Calculate total record count
    SELECT @totalRecords = COUNT(*)
    FROM EmployeeMaster em
	LEFT JOIN DepartmentMaster dm WITH (NOLOCK) ON dm.DepartmentId = em.DepartmentId
    LEFT JOIN DesignationMaster dgm WITH (NOLOCK) ON dgm.DepartmentId = em.DepartmentId AND dgm.DesignationId = em.DesignationId
    WHERE ISNULL(em.IsDeleted, 0) = 0
	AND (@searchValue IS NULL OR em.EmailAddress LIKE '%' + @searchValue + '%'
	OR em.FirstName LIKE '%' + @searchValue + '%'
	OR em.LastName LIKE '%' + @searchValue + '%'
	OR em.EmpTagNumber LIKE '%' + @searchValue + '%');

    SET @sql = '
    SELECT 
        em.employeeId,
        em.EmpTagNumber,
        em.FirstName,
        em.LastName,
        em.EmailAddress,
        em.Birthdate,
        DATEDIFF(YEAR, em.Birthdate, GETUTCDATE()) AS Age,
        dm.Department,
        dgm.Designation,
		' + CAST(@totalRecords AS NVARCHAR) + ' AS TotalRecords
    FROM EmployeeMaster em WITH (NOLOCK)
    LEFT JOIN DepartmentMaster dm WITH (NOLOCK) ON dm.DepartmentId = em.DepartmentId
    LEFT JOIN DesignationMaster dgm WITH (NOLOCK) ON dgm.DepartmentId = em.DepartmentId AND dgm.DesignationId = em.DesignationId
    WHERE ISNULL(em.IsDeleted, 0) = 0';

    IF @searchValue IS NOT NULL
        SET @sql = @sql + ' AND (em.EmailAddress LIKE ''%' + @searchValue + '%''
		 OR em.FirstName LIKE ''%' + @searchValue + '%''
		  OR em.LastName LIKE ''%' + @searchValue + '%''
		 OR em.EmpTagNumber LIKE ''%' + @searchValue + '%'' )';

    SET @sql = @sql + '
    ORDER BY ' + @orderBy + ' ' + @sortBy + '
    OFFSET @PageSize * (@PageNumber - 1) ROWS
    FETCH NEXT @PageSize ROWS ONLY;';
	
    EXEC sp_executesql @sql,
                       N'@PageSize INT, @PageNumber INT, @searchValue NVARCHAR(150)',
                       @PageSize = @pageSize,
                       @PageNumber = @pageNumber,
                       @searchValue = @searchValue
END
GO
