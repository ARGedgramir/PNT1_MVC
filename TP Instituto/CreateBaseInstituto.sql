create table [Instituto]
GO
ALTER TABLE [dbo].[cursoprofesor] DROP CONSTRAINT [FK_cursoprofesor_Profesor]
GO
ALTER TABLE [dbo].[cursoprofesor] DROP CONSTRAINT [FK_cursoprofesor_curso]
GO
ALTER TABLE [dbo].[cursoalumno] DROP CONSTRAINT [FK_cursoalumno_curso]
GO
ALTER TABLE [dbo].[cursoalumno] DROP CONSTRAINT [FK_cursoalumno_Alumno]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 21/11/2018 21:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Legajo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[FecNac] [date] NULL,
	[DNI] [int] NULL,
	[Mail] [varchar](max) NULL,
	[Tel] [int] NULL,
	[Antig] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso]    Script Date: 21/11/2018 21:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[idcurso] [int] NOT NULL,
	[nombrecurso] [char](40) NULL,
 CONSTRAINT [PK_curso] PRIMARY KEY CLUSTERED 
(
	[idcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cursoalumno]    Script Date: 21/11/2018 21:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursoalumno](
	[idcurso] [int] NOT NULL,
	[legajoalumn] [int] NOT NULL,
 CONSTRAINT [PK_cursoalumno] PRIMARY KEY CLUSTERED 
(
	[idcurso] ASC,
	[legajoalumn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cursoprofesor]    Script Date: 21/11/2018 21:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cursoprofesor](
	[idcurso] [int] NOT NULL,
	[legajoprof] [int] NOT NULL,
 CONSTRAINT [PK_cursoprofesor] PRIMARY KEY CLUSTERED 
(
	[idcurso] ASC,
	[legajoprof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 21/11/2018 21:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Legajo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[FecNac] [date] NULL,
	[DNI] [int] NULL,
	[Mail] [varchar](max) NULL,
	[Tel] [int] NULL,
	[Antig] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cursoalumno]  WITH CHECK ADD  CONSTRAINT [FK_cursoalumno_Alumno] FOREIGN KEY([legajoalumn])
REFERENCES [dbo].[Alumno] ([Legajo])
GO
ALTER TABLE [dbo].[cursoalumno] CHECK CONSTRAINT [FK_cursoalumno_Alumno]
GO
ALTER TABLE [dbo].[cursoalumno]  WITH CHECK ADD  CONSTRAINT [FK_cursoalumno_curso] FOREIGN KEY([idcurso])
REFERENCES [dbo].[curso] ([idcurso])
GO
ALTER TABLE [dbo].[cursoalumno] CHECK CONSTRAINT [FK_cursoalumno_curso]
GO
ALTER TABLE [dbo].[cursoprofesor]  WITH CHECK ADD  CONSTRAINT [FK_cursoprofesor_curso] FOREIGN KEY([idcurso])
REFERENCES [dbo].[curso] ([idcurso])
GO
ALTER TABLE [dbo].[cursoprofesor] CHECK CONSTRAINT [FK_cursoprofesor_curso]
GO
ALTER TABLE [dbo].[cursoprofesor]  WITH CHECK ADD  CONSTRAINT [FK_cursoprofesor_Profesor] FOREIGN KEY([legajoprof])
REFERENCES [dbo].[Profesor] ([Legajo])
GO
ALTER TABLE [dbo].[cursoprofesor] CHECK CONSTRAINT [FK_cursoprofesor_Profesor]
GO
