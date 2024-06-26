USE [master]
GO
/****** Object:  Database [DBCoaching]    Script Date: 12-06-2024 16:53:35 ******/
CREATE DATABASE [DBCoaching]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCoaching', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBCoaching.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCoaching_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBCoaching_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBCoaching] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCoaching].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCoaching] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCoaching] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCoaching] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCoaching] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCoaching] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCoaching] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCoaching] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCoaching] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCoaching] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCoaching] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCoaching] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCoaching] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCoaching] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCoaching] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCoaching] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCoaching] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCoaching] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCoaching] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCoaching] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCoaching] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCoaching] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCoaching] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCoaching] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCoaching] SET  MULTI_USER 
GO
ALTER DATABASE [DBCoaching] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCoaching] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCoaching] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCoaching] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCoaching] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCoaching] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCoaching] SET QUERY_STORE = OFF
GO
USE [DBCoaching]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFunID]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetFunID](@raw int)
returns numeric(18,0)
as
begin
	declare @result numeric(18,0)
	set @result = RIGHT('00'+convert(varchar,datepart(YY,GETDATE())),2)
				+ RIGHT('00'+convert(varchar,datepart(MM,GETDATE())),2)
				+ RIGHT('00'+convert(varchar,datepart(DD,GETDATE())),2)
				+ (select RIGHT('00000'+ CONVERT(nvarchar,@raw % 10000),5))
	return @result
end
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[Course_ID] [numeric](18, 0) NOT NULL,
	[Course_Name] [varchar](50) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseTeacher](
	[CourseTeacher_ID] [numeric](18, 0) NOT NULL,
	[Teacher_ID] [numeric](18, 0) NOT NULL,
	[CourseType_ID] [numeric](18, 0) NOT NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseTeacher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseType]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseType](
	[CourseType_ID] [numeric](18, 0) NOT NULL,
	[CourseType_Description] [varchar](255) NULL,
	[CourseType_Fees] [numeric](18, 2) NOT NULL,
	[Course_ID] [numeric](18, 0) NOT NULL,
	[TypeMaster_ID] [numeric](18, 0) NOT NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEnrollment]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEnrollment](
	[Enrollment_ID] [numeric](18, 0) NOT NULL,
	[Student_ID] [numeric](18, 0) NOT NULL,
	[CourseType_ID] [numeric](18, 0) NOT NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__tblEnrol__4365BD6A99484621] PRIMARY KEY CLUSTERED 
(
	[Enrollment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudents_Info]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudents_Info](
	[Std_ID] [numeric](18, 0) NOT NULL,
	[Std_Fname] [varchar](50) NULL,
	[Std_Lname] [varchar](50) NULL,
	[Std_Dob] [datetime] NULL,
	[Std_Gender] [varchar](10) NULL,
	[Std_PhoneNo] [varchar](12) NULL,
	[Std_Email] [nvarchar](50) NULL,
	[Std_Address] [varchar](255) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__tblStude__FE2B44AEE9BDB3A1] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeacher](
	[Teacher_ID] [numeric](18, 0) NOT NULL,
	[Teacher_Fname] [varchar](50) NULL,
	[Teacher_Lname] [varchar](50) NULL,
	[Teacher_Gender] [varchar](10) NULL,
	[Teacher_Email] [nvarchar](50) NULL,
	[Teacher_Qualification] [varchar](12) NULL,
	[Teacher_PhoneNo] [varchar](12) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Teacher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTokenMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTokenMaster](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[CoachingName] [varchar](50) NULL,
	[AuthToken] [nvarchar](250) NULL,
	[IssuedOn] [datetime] NULL,
	[ExpiresOn] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeMaster](
	[TypeMaster_ID] [numeric](18, 0) NOT NULL,
	[TypeMaster_Name] [varchar](50) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[DeletedBy] [numeric](18, 0) NULL,
	[DeletedOn] [date] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeMaster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCourse] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblCourse] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCourseTeacher] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblCourseTeacher] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCourseType] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblCourseType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblEnrollment] ADD  CONSTRAINT [DF__tblEnroll__Creat__0A9D95DB]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblEnrollment] ADD  CONSTRAINT [DF__tblEnroll__IsAct__0B91BA14]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblStudents_Info] ADD  CONSTRAINT [DF__tblStuden__Creat__3F466844]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblStudents_Info] ADD  CONSTRAINT [DF__tblStuden__IsAct__403A8C7D]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblTeacher] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblTeacher] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblTokenMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblTypeMaster] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[tblTypeMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCourseTeacher]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseTeacher_tblCourseType] FOREIGN KEY([CourseType_ID])
REFERENCES [dbo].[tblCourseType] ([CourseType_ID])
GO
ALTER TABLE [dbo].[tblCourseTeacher] CHECK CONSTRAINT [FK_tblCourseTeacher_tblCourseType]
GO
ALTER TABLE [dbo].[tblCourseTeacher]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseTeacher_tblTeacher] FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[tblTeacher] ([Teacher_ID])
GO
ALTER TABLE [dbo].[tblCourseTeacher] CHECK CONSTRAINT [FK_tblCourseTeacher_tblTeacher]
GO
ALTER TABLE [dbo].[tblCourseType]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseType_tblCourse] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[tblCourse] ([Course_ID])
GO
ALTER TABLE [dbo].[tblCourseType] CHECK CONSTRAINT [FK_tblCourseType_tblCourse]
GO
ALTER TABLE [dbo].[tblCourseType]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseType_tblTypeMaster] FOREIGN KEY([TypeMaster_ID])
REFERENCES [dbo].[tblTypeMaster] ([TypeMaster_ID])
GO
ALTER TABLE [dbo].[tblCourseType] CHECK CONSTRAINT [FK_tblCourseType_tblTypeMaster]
GO
ALTER TABLE [dbo].[tblEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_tblEnrollment_tblCourseType] FOREIGN KEY([CourseType_ID])
REFERENCES [dbo].[tblCourseType] ([CourseType_ID])
GO
ALTER TABLE [dbo].[tblEnrollment] CHECK CONSTRAINT [FK_tblEnrollment_tblCourseType]
GO
ALTER TABLE [dbo].[tblEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_tblEnrollment_tblStudents_Info] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[tblStudents_Info] ([Std_ID])
GO
ALTER TABLE [dbo].[tblEnrollment] CHECK CONSTRAINT [FK_tblEnrollment_tblStudents_Info]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCourse]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteCourse]
@Course_ID numeric(18,0),
@DeletedBy numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
Begin try
		begin
			
            delete from tblCourse
			WHERE Course_ID = @Course_ID and
			DeletedBy= @DeletedBy and 
			DeletedOn =GETDATE() and
			IsActive = 1;
   
			
			set @ErrorMgs = 'Successfully Delete Course detail, ID :- ' + cast(@Course_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStudents]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DeleteStudents]
@Std_ID numeric(18,0),
--@DeletedBy numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
Begin try
		begin
			--Declare @row int = 0
			--select @row = count(*) from dbo.tblStudents_Info
			--select @Std_ID = dbo.GetFunID(@row)

			delete from tblStudents_Info
			WHERE Std_ID = @Std_ID and
			--DeletedBy= @DeletedBy and 
			--DeletedOn =GETDATE() and
			IsActive = 1;
   
			
			set @ErrorMgs = 'Successfully Delete Student detail, ID :- ' + cast(@Std_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteTeacher]
@Teacher_ID numeric(18,0),
@DeletedBy numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
Begin try
		begin
			
            delete from tblTeacher
			WHERE Teacher_ID = @Teacher_ID and
			DeletedBy= @DeletedBy and 
			DeletedOn =GETDATE() and
			IsActive = 1;
   
			
			set @ErrorMgs = 'Successfully Delete Teacher detail, ID :- ' + cast(@Teacher_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTypeMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DeleteTypeMaster]
@TypeMaster_ID numeric(18,0),
@DeletedBy numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
Begin try
		begin
			
            delete from tblTypeMaster
			WHERE TypeMaster_ID = @TypeMaster_ID and
			DeletedBy= @DeletedBy and 
			DeletedOn =GETDATE() and
			IsActive = 1;
   
			
			set @ErrorMgs = 'Successfully Delete TypeMaster detail, ID :- ' + cast(@TypeMaster_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCourse]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetCourse]
@Course_ID numeric(18,0),
@ErrorMgs varchar(500) out
as
begin

	begin try
	set @ErrorMgs = ''

	set nocount on;
		SELECT [Course_ID] as CourseID	
			  ,[Course_Name] as CourseName
			  ,[CreatedBy]
			  ,[CreatedOn]
			  ,[UpdatedBy]
			  ,[UpdatedOn]
			  ,[DeletedBy]
			  ,[DeletedOn]
			  ,[IsActive]
		  FROM [DBCoaching].[dbo].[tblCourse]
		  where IsActive = 1 and
		  course_ID in ( case when @Course_ID is null or @Course_ID = 0 then Course_ID else @Course_ID end)
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());

	end catch
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEnrollment]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetEnrollment]
    @Enrollment_ID NUMERIC(18,0),
    @ErrorMgs VARCHAR(500) OUT
AS
BEGIN
    BEGIN TRY
        SET @ErrorMgs = '';
        SET NOCOUNT ON;

        SELECT
            e.Enrollment_ID,
            s.Std_ID,
            s.Std_Fname,
            s.Std_Lname,
            s.Std_PhoneNo,
            s.Std_Email,
            c.Course_ID,
            c.TypeMaster_ID,
            c.CourseType_Fees,
            c.CourseType_Description,
            e.CreatedBy,
            e.CreatedOn,
            e.UpdatedBy,
            e.UpdatedOn,
            e.DeletedBy,
            e.DeletedOn,
            e.IsActive
        FROM
            tblEnrollment e
        JOIN
            tblStudents_Info s ON e.Student_ID = s.Std_ID
        JOIN
            tblCourseType c ON e.CourseType_ID = c.CourseType_ID
        WHERE
            e.IsActive = 1 AND
            e.Enrollment_ID = CASE 
                WHEN @Enrollment_ID IS NULL OR @Enrollment_ID = 0 
                THEN e.Enrollment_ID 
                ELSE @Enrollment_ID 
            END
        ORDER BY
            e.Enrollment_ID;

    END TRY
    BEGIN CATCH
        SET @ErrorMgs = 'ErrorMessage: ' + ERROR_MESSAGE();

        INSERT INTO dbo.DBErrors
        (
            UserName,
            ErrorNumber,
            ErrorState,
            ErrorSeverity,
            ErrorLine,
            ErrorProcedure,
            ErrorMessage,
            ErrorDateTime
        )
        VALUES
        (
            SUSER_SNAME(),
            ERROR_NUMBER(),
            ERROR_STATE(),
            ERROR_SEVERITY(),
            ERROR_LINE(),
            ERROR_PROCEDURE(),
            ERROR_MESSAGE(),
            GETDATE()
        );
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudents]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetStudents]
@Std_ID numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
	/*
		declare @Std_ID numeric(18,0) = 0,
@ErrorMgs varchar(500) 
exec dbo.usp_GetStudents @Std_ID,@ErrorMgs out
select @ErrorMgs

	*/

	begin try
	set @ErrorMgs = ''

	set nocount on;
		SELECT [Std_ID] as StudentID	
			  ,[Std_Fname] as StudentFname
			  ,[Std_Lname] as StudentLname
			  ,[Std_Dob] as StudentDOB
			  ,[Std_Gender] as StudentGender
			  ,[Std_PhoneNo] as StudentPhoneNo
			  ,[Std_Email] as StudentEmail
			  ,[Std_Address] as StudentAddress
			  ,[CreatedBy]
			  ,[CreatedOn]
			  ,[UpdatedBy]
			  ,[UpdatedOn]
			  ,[DeletedBy]
			  ,[DeletedOn]
			  ,[IsActive]
		  FROM [DBCoaching].[dbo].[tblStudents_Info]
		  where IsActive = 1 and
		  Std_ID in ( case when @Std_ID is null or @Std_ID = 0 then Std_ID else @Std_ID end)
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());

	end catch
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetTeacher]
@Teacher_ID numeric(18,0),
@ErrorMgs varchar(500) out
as
begin

	begin try
	set @ErrorMgs = ''

	set nocount on;
		SELECT [Teacher_ID] as TeacherID	
			  ,[Teacher_Fname] as TeacherFname
			  ,[Teacher_Lname] as TeacherLname
			  ,[Teacher_Gender] as TeacherGender
			  ,[Teacher_Email] as TeacherEmail
			  ,[Teacher_Qualification] as TeacherQualification
			  ,[Teacher_PhoneNo] as TeacherPhoneNo
			  ,[CreatedBy]
			  ,[CreatedOn]
			  ,[UpdatedBy]
			  ,[UpdatedOn]
			  ,[DeletedBy]
			  ,[DeletedOn]
			  ,[IsActive]
		  FROM [DBCoaching].[dbo].[tblTeacher]
		  where IsActive = 1 and
		  Teacher_ID in ( case when @Teacher_ID is null or @Teacher_ID = 0 then Teacher_ID else @Teacher_ID end)
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());

	end catch
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTokenMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_GetTokenMaster]
@CoachingName varchar(50)  = null,
@ErrorMgs varchar(500) out
as
begin
--exec usp_GetTokenMaster 'Bhavsar',''
	set @ErrorMgs = ''
	begin try
		set nocount on;
		select top 1 
			TM.TokenId as Id,
			TM.CoachingName as Name,
			TM.AuthToken,
			TM.IssuedOn,
			TM.ExpiresOn,
			TM.IsActive
		from dbo.tblTokenMaster TM
		where TM.CoachingName in (case when @CoachingName is null or @CoachingName = ''then TM.CoachingName else @CoachingName end)
		and TM.IsActive = 1
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :' + ERROR_MESSAGE();

		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTypeMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetTypeMaster]
@TypeMaster_ID numeric(18,0),
@ErrorMgs varchar(500) out
as
begin
begin try
	set @ErrorMgs = ''

	set nocount on;
		SELECT [TypeMaster_ID] as TypeMasterID	
			  ,[TypeMaster_Name] as TypeMasterName
			  ,[CreatedBy]
			  ,[CreatedOn]
			  ,[UpdatedBy]
			  ,[UpdatedOn]
			  ,[DeletedBy]
			  ,[DeletedOn]
			  ,[IsActive]
		  FROM [DBCoaching].[dbo].[tblTypeMaster]
		  where IsActive = 1 and
		  TypeMaster_ID in ( case when @TypeMaster_ID is null or @TypeMaster_ID = 0 then TypeMaster_ID else @TypeMaster_ID end)
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());

	end catch
  end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetValidateToken]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_GetValidateToken]
@AuthToken varchar(100),
@result bit out,
@ErrorMgs varchar(500) out
as
begin
	begin try
		set nocount on;
	
		Declare @raw int = 0
		set @result = 0
		set @ErrorMgs = ''
		select @raw = count(*) from dbo.tblTokenMaster where IsActive = 1 and AuthToken = @AuthToken
		if(@raw > 0)
		begin
			select @raw = count(*) from dbo.tblTokenMaster where IsActive = 1 and AuthToken = @AuthToken and ExpiresOn >= GETDATE() 
			if(@raw	> 0)
			begin
				set @result = 1
				set @ErrorMgs = ''
			end
			else
			begin
				set @ErrorMgs = 'App Key is Expired,Please contact to Administrator.'
			end
		end
		else
		begin
			set @ErrorMgs = 'App Key is not valid,Please provide correct Information.'
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :' + ERROR_MESSAGE();

		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCourse]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InsertCourse]
	@Course_ID NUMERIC(18,0),
    @Course_Name VARCHAR(50),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		
			
			select @row = count(*) from dbo.tblCourse
			select @Course_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblCourse(Course_ID, Course_Name,CreatedBy)
			 VALUES (@Course_ID, @Course_Name, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert Course detail, ID :- ' + cast(@Course_ID as varchar(20))
		--end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCourseTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_InsertCourseTeacher]
	@CourseTeacher_ID NUMERIC(18,0),
	@Teacher_ID numeric(18,0),
	@CourseType_ID numeric(18,0),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		begin
			
			select @row = count(*) from dbo.tblCourseTeacher
			select @CourseTeacher_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblCourseTeacher(CourseTeacher_ID, Teacher_ID,CourseType_ID, CreatedBy)
			 VALUES (@CourseTeacher_ID, @Teacher_ID, @CourseType_ID, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert detail, ID :- ' + cast(@CourseTeacher_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCourseType]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_InsertCourseType]
	@CourseType_ID NUMERIC(18,0),
    @CourseType_Description varchar(255),
	@CourseType_Fees numeric(18,2),
	@Course_ID numeric(18,0),
	@TypeMaster_ID numeric(18,0),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		begin
			
			select @row = count(*) from dbo.tblCourseType
			select @CourseType_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblCourseType(CourseType_ID, CourseType_Description, CourseType_Fees,Course_ID,TypeMaster_ID, CreatedBy)
			 VALUES (@CourseType_ID, @CourseType_Description, @CourseType_Fees, @Course_ID, @TypeMaster_ID, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert Course detail, ID :- ' + cast(@CourseType_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertEnrollment]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_InsertEnrollment]
	@Enrollment_ID NUMERIC(18,0),
	@Student_ID numeric(18,0),
	@CourseType_ID numeric(18,0),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		begin
			
			select @row = count(*) from dbo.tblEnrollment
			select @Enrollment_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblEnrollment(Enrollment_ID, Student_ID, CourseType_ID, CreatedBy)
			 VALUES (@Enrollment_ID, @Student_ID, @CourseType_ID, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert detail, ID :- ' + cast(@Enrollment_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertStudent]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InsertStudent]
	@Std_ID NUMERIC(18,0),
    @Std_Fname VARCHAR(50),
    @Std_Lname VARCHAR(50),
    @Std_Dob DATE,
    @Std_Gender VARCHAR(10),
    @Std_PhoneNo VARCHAR(12),
    @Std_Email NVARCHAR(50),
    @Std_Address VARCHAR(255),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
/*
declare @Std_ID NUMERIC(18,0),
    @Std_Fname VARCHAR(50) = 'Shalin',
    @Std_Lname VARCHAR(50) = 'Bhavsar',
    @Std_Dob DATE = '1982-12-22',
    @Std_Gender VARCHAR(10) = 'Male',
    @Std_PhoneNo VARCHAR(12) = '8424009005',
    @Std_Email NVARCHAR(50) = 'bhavsar.shalin2212@gmail.com',
    @Std_Address VARCHAR(255) = 'Kalher',
    @CreatedBy NUMERIC(18,0) = 1,
	@ErrorMgs Varchar(500) 
exec usp_InsertStudent @Std_ID,@Std_Fname,@Std_Lname,@Std_Dob,@Std_Gender,@Std_PhoneNo,@Std_Email,@Std_Address,@CreatedBy,@ErrorMgs out
select @ErrorMgs
*/

	Begin try
		Declare @row int = 0
		if exists (select @Std_ID from dbo.tblStudents_Info where Std_Email = @Std_Email)
		begin	
			set @ErrorMgs = 'Already email address exist : ' + @Std_Email
		end
		else
		begin
			
			select @row = count(*) from dbo.tblStudents_Info
			select @Std_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblStudents_Info(Std_ID, Std_Fname, Std_Lname, Std_Dob, Std_Gender, Std_PhoneNo, Std_Email, Std_Address, CreatedBy)
			 VALUES (@Std_ID, @Std_Fname, @Std_Lname, @Std_Dob, @Std_Gender, @Std_PhoneNo, @Std_Email, @Std_Address, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert Student detail, ID :- ' + cast(@Std_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InsertTeacher]
	@Teacher_ID NUMERIC(18,0),
    @Teacher_Fname VARCHAR(50),
    @Teacher_Lname VARCHAR(50),
    @Teacher_Gender VARCHAR(10),
	@Teacher_Email NVARCHAR(50),
    @Teacher_Qualification VARCHAR(50),
    @Teacher_PhoneNo VARCHAR(12),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		if exists (select @Teacher_ID from dbo.tblTeacher where Teacher_Email = @Teacher_Email)
		begin	
			set @ErrorMgs = 'Already email address exist : ' + @Teacher_Email
		end
		else
		begin
			
			select @row = count(*) from dbo.tblTeacher
			select @Teacher_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblTeacher(Teacher_ID, Teacher_Fname, Teacher_Lname, Teacher_Gender, Teacher_Email, Teacher_Qualification, Teacher_PhoneNo, CreatedBy)
			 VALUES (@Teacher_ID, @Teacher_Fname, @Teacher_Lname, @Teacher_Gender,@Teacher_Email, @Teacher_Qualification, @Teacher_PhoneNo, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert Teacher detail, ID :- ' + cast(@Teacher_ID as varchar(20))
		end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTypeMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InsertTypeMaster]
	@TypeMaster_ID NUMERIC(18,0),
    @TypeMaster_Name VARCHAR(50),
    @CreatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out


As
Begin
Begin try
		Declare @row int = 0
		select @row = count(*) from dbo.tblTypeMaster
			select @TypeMaster_ID = dbo.GetFunID(@row)

			INSERT INTO dbo.tblTypeMaster(TypeMaster_ID, TypeMaster_Name,CreatedBy)
			 VALUES (@TypeMaster_ID, @TypeMaster_Name, @CreatedBy);
			
			set @ErrorMgs = 'Successfully Insert Type detail, ID :- ' + cast(@TypeMaster_ID as varchar(20))
		--end
	end try
	begin catch
		set @ErrorMgs = 'ErrorMessage :'  + ERROR_MESSAGE()

		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCourse]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdateCourse]
@Course_ID NUMERIC(18,0),
    @Course_Name VARCHAR(50),
    @UpdatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out
	As
Begin
	Begin try
		begin 
			update  tblCourse
			set 
			Course_Name=@Course_Name, 
			UpdatedBy=@UpdatedBy
			WHERE Course_ID=@Course_ID and IsActive=1
			

			set @Errormgs = 'Successfully Updated'
		end
    end try
	begin catch
		set @Errormgs = 'Failed :'  + ERROR_MESSAGE()
		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStudents]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdateStudents]
@Std_ID NUMERIC(18,0),
    @Std_Fname VARCHAR(50),
    @Std_Lname VARCHAR(50),
    @Std_Dob DATE,
    @Std_Gender VARCHAR(10),
    @Std_PhoneNo VARCHAR(12),
    @Std_Email NVARCHAR(50),
    @Std_Address VARCHAR(255),
    --@UpdatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out
	As
Begin
	Begin try
	Declare @row int = 0
        BEGIN
		select @row = count(*) from dbo.tblStudents_Info
			select @Std_ID = dbo.GetFunID(@row)
			update  tblStudents_Info 
			set 
			Std_Fname=@Std_Fname, 
			Std_Lname=@Std_Lname, 
			Std_Dob=@Std_Dob, 
			std_Gender=@Std_Gender, 
			Std_PhoneNo=@Std_PhoneNo, 
			Std_Email=@Std_Email, 
			Std_Address=@Std_Address
			--UpdatedBy=@UpdatedBy
			WHERE Std_ID=@Std_ID and IsActive=1
			

			set @Errormgs = 'Successfully Updated'
		end
    end try
	begin catch
		set @Errormgs = 'Failed :'  + ERROR_MESSAGE()
		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTeacher]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdateTeacher]
@Teacher_ID NUMERIC(18,0),
    @Teacher_Fname VARCHAR(50),
    @Teacher_Lname VARCHAR(50),
    @Teacher_Gender VARCHAR(10),
	@Teacher_Email NVARCHAR(50),
    @Teacher_Qualification VARCHAR(50),
    @Teacher_PhoneNo VARCHAR(12),
    @UpdatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out
	As
Begin
	Begin try
		if exists (select Teacher_ID from tblTeacher where Teacher_Email = @Teacher_Email and IsActive=1)
		begin 
			update  tblTeacher
			set 
			Teacher_Fname=@Teacher_Fname, 
			Teacher_Lname=@Teacher_Lname, 
			Teacher_Gender=@Teacher_Gender,
			Teacher_Email=@Teacher_Email,
			Teacher_Qualification=@Teacher_Qualification, 
			Teacher_PhoneNo=@Teacher_PhoneNo, 
			
			UpdatedBy=@UpdatedBy
			WHERE Teacher_ID=@Teacher_ID and IsActive=1
			

			set @Errormgs = 'Successfully Udated'
		end
    end try
	begin catch
		set @Errormgs = 'Failed :'  + ERROR_MESSAGE()
		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTypeMaster]    Script Date: 12-06-2024 16:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdateTypeMaster]
    @TypeMaster_ID NUMERIC(18,0),
    @TypeMaster_Name VARCHAR(50),
    @UpdatedBy NUMERIC(18,0),
	@ErrorMgs Varchar(500) out
	As
Begin
	Begin try
		begin 
			update  tblTypeMaster
			set 
			TypeMaster_Name=@TypeMaster_Name, 
			UpdatedBy=@UpdatedBy
			WHERE TypeMaster_ID=@TypeMaster_ID and IsActive=1
			

			set @Errormgs = 'Successfully Updated'
		end
    end try
	begin catch
		set @Errormgs = 'Failed :'  + ERROR_MESSAGE()
		
		INSERT INTO dbo.DBErrors
			VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
		

	end catch
end
GO
USE [master]
GO
ALTER DATABASE [DBCoaching] SET  READ_WRITE 
GO
