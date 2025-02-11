USE [master]
GO
/****** Object:  Database [BD_VOLU]    Script Date: 12/8/2024 8:47:15 ******/
CREATE DATABASE [BD_VOLU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_VOLU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BD_VOLU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_VOLU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BD_VOLU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_VOLU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_VOLU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_VOLU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_VOLU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_VOLU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_VOLU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_VOLU] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_VOLU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_VOLU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_VOLU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_VOLU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_VOLU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_VOLU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_VOLU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_VOLU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_VOLU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_VOLU] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_VOLU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_VOLU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_VOLU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_VOLU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_VOLU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_VOLU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_VOLU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_VOLU] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_VOLU] SET  MULTI_USER 
GO
ALTER DATABASE [BD_VOLU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_VOLU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_VOLU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_VOLU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_VOLU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_VOLU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_VOLU] SET QUERY_STORE = OFF
GO
USE [BD_VOLU]
GO
/****** Object:  User [django2]    Script Date: 12/8/2024 8:47:15 ******/
CREATE USER [django2] FOR LOGIN [django2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [django]    Script Date: 12/8/2024 8:47:15 ******/
CREATE USER [django] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[admin_app_foundation]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_app_foundation](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[creation_date] [date] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[focus_area] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[admin_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetimeoffset](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_customuser]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_customuser](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetimeoffset](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_staff] [bit] NOT NULL,
	[role] [nvarchar](20) NOT NULL,
	[photo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_customuser_groups]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_customuser_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customuser_id] [bigint] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_customuser_user_permissions]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_customuser_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customuser_id] [bigint] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_profile]    Script Date: 12/8/2024 8:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_profile](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[bio] [nvarchar](max) NOT NULL,
	[location] [nvarchar](30) NOT NULL,
	[birth_date] [date] NULL,
	[photo] [nvarchar](100) NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_app_foundation] ON 

INSERT [dbo].[admin_app_foundation] ([id], [name], [creation_date], [description], [focus_area], [address], [latitude], [longitude], [admin_id]) VALUES (1, N'Jordania Muñoz', CAST(N'2023-03-15' AS Date), N'Fundación en la cual es encargado de recoger y distribuir víveres, actividades voluntariado y actividades comunales', N'Colimen', N'Av 14 y 13 Ava', -1.547763, -80.013777, 7)
INSERT [dbo].[admin_app_foundation] ([id], [name], [creation_date], [description], [focus_area], [address], [latitude], [longitude], [admin_id]) VALUES (2, N'Jordania Muñoz', CAST(N'2023-03-15' AS Date), N'Fundación en la cual es encargado de recoger y distribuir víveres, actividades voluntariado y actividades comunales', N'Colimen', N'Av 14 y 13 Ava', -1.547763, -80.013777, 7)
INSERT [dbo].[admin_app_foundation] ([id], [name], [creation_date], [description], [focus_area], [address], [latitude], [longitude], [admin_id]) VALUES (3, N'Jordania Muñoz', CAST(N'2023-03-15' AS Date), N'Fundación en la cual es encargado de recoger y distribuir víveres, actividades voluntariado y actividades comunales', N'Colimen', N'Av 14 y 13 Ava', -1.547763, -80.013777, 7)
INSERT [dbo].[admin_app_foundation] ([id], [name], [creation_date], [description], [focus_area], [address], [latitude], [longitude], [admin_id]) VALUES (4, N'Jordania Muñoz', CAST(N'2023-03-15' AS Date), N'Fundación en la cual es encargado de recoger y distribuir víveres, actividades voluntariado y actividades comunales', N'Colimen', N'Av 14 y 13 Ava', -1.547763, -80.013777, 7)
SET IDENTITY_INSERT [dbo].[admin_app_foundation] OFF
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add custom user', 1, N'add_customuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change custom user', 1, N'change_customuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete custom user', 1, N'delete_customuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view custom user', 1, N'view_customuser')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add log entry', 2, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change log entry', 2, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete log entry', 2, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view log entry', 2, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add permission', 3, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change permission', 3, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete permission', 3, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view permission', 3, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add group', 4, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change group', 4, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete group', 4, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view group', 4, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add role', 7, N'add_role')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change role', 7, N'change_role')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete role', 7, N'delete_role')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view role', 7, N'view_role')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add Fundación', 8, N'add_foundation')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change Fundación', 8, N'change_foundation')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete Fundación', 8, N'delete_foundation')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view Fundación', 8, N'view_foundation')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add profile', 9, N'add_profile')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change profile', 9, N'change_profile')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete profile', 9, N'delete_profile')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view profile', 9, N'view_profile')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'admin_app', N'foundation')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'login', N'customuser')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'login', N'role')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'user', N'profile')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2024-08-06T06:28:06.7586340+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2024-08-06T06:28:07.5796690+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'auth', N'0001_initial', CAST(N'2024-08-06T06:28:07.6401270+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2024-08-06T06:28:07.6547930+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'auth', N'0003_alter_user_email_max_length', CAST(N'2024-08-06T06:28:07.6681120+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'auth', N'0004_alter_user_username_opts', CAST(N'2024-08-06T06:28:07.6821230+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0005_alter_user_last_login_null', CAST(N'2024-08-06T06:28:07.6936720+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0006_require_contenttypes_0002', CAST(N'2024-08-06T06:28:07.7008460+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2024-08-06T06:28:07.7173210+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0008_alter_user_username_max_length', CAST(N'2024-08-06T06:28:07.7320790+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2024-08-06T06:28:07.7452970+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0010_alter_group_name_max_length', CAST(N'2024-08-06T06:28:08.3751980+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0011_update_proxy_permissions', CAST(N'2024-08-06T06:28:08.4063990+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2024-08-06T06:28:08.4314680+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'login', N'0001_initial', CAST(N'2024-08-06T06:28:08.4712520+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'admin', N'0001_initial', CAST(N'2024-08-06T06:28:08.5057380+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2024-08-06T06:28:08.5117580+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2024-08-06T06:28:08.5336790+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'sessions', N'0001_initial', CAST(N'2024-08-06T06:28:08.5459370+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'login', N'0002_role_customuser_role_customuser_roles', CAST(N'2024-08-06T14:50:07.5689220+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'login', N'0003_remove_customuser_roles_alter_customuser_role_and_more', CAST(N'2024-08-06T14:55:51.9125770+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'login', N'0004_alter_customuser_role', CAST(N'2024-08-06T14:55:51.9533780+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'admin_app', N'0001_initial', CAST(N'2024-08-06T15:43:46.7616810+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'login', N'0005_customuser_photo', CAST(N'2024-08-07T09:13:08.2348090+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'user', N'0001_initial', CAST(N'2024-08-07T09:17:28.0555680+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'a6idu1z9n4slrvpdy4xj7kporl262y9s', N'.eJxVjEEOwiAQRe_C2hBgBgou3XsGAsxUqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWXpx-t5zKg9sO6J7abZZlbusyZbkr8qBdXmfi5-Vw_w5q6vVbJ1LoedDBGSSvzaAsWKOtCyO4gGAyZw2KgSAXtMAW0VDywEE7tKN4fwCt-TaH:1sbgxs:AlTTtBzGcCdaozGbqvFMOQl5mvWPMxNC3K5JgnvC0lU', CAST(N'2024-08-21T13:44:32.9744740+00:00' AS DateTimeOffset))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'mbz0ghnvepejdzzxavrwby3uehbv3fmi', N'e30:1sbPar:17b5bRWjBDgbHRirLd7-8_WwllmCW5qkOyBnync6PNc', CAST(N'2024-08-20T19:11:37.7345030+00:00' AS DateTimeOffset))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'w4ib8anfxgfxlsqhqookscgbet81o77d', N'e30:1sbg98:E50kZWCmfPf7y21AV0RXP8_yrHR3EzMA8uOyh52gDoI', CAST(N'2024-08-21T12:52:06.7652790+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[login_customuser] ON 

INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (1, N'pbkdf2_sha256$720000$JvNCSgkkiT6fyWOMalBhIW$8l32RWdyPdjwKXhjDxMSQ5gnnUTgrtHSeSFiEmBBwx4=', CAST(N'2024-08-06T19:11:37.7390280+00:00' AS DateTimeOffset), 0, N'nombre122@example.com', N'exmple', N'brun', N'av 10', N'123345678', 1, 0, N'USER', NULL)
INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (2, N'pbkdf2_sha256$720000$rmokoyWtpznNwhmjr6Bd4P$SS07pCHLy6q8XqYkf6xHthYHU+Ic346T5hd0g918ZZI=', CAST(N'2024-08-07T00:04:41.7925970+00:00' AS DateTimeOffset), 0, N'trackw.ish9.32.2@gmail.com', N'exmple', N'brun', N'av 10', N'1234567890', 1, 0, N'ADMIN', NULL)
INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (5, N'여喝뛣봔㕧샙듀始篼䅺땡뫛䚉勓䈆', NULL, 0, N'admin@example.com', N'Admin', N'User', N'Calle Admin 456', N'555-444-555', 1, 1, N'ADMIN', NULL)
INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (6, N'pbkdf2_sha256$720000$Uy53S1HEblIjHwefo2nvQv$XzXkCUylIY3rzNJ5QpuX9EqNHHCX3iXAb0sjbtOtjko=', CAST(N'2024-08-07T08:22:10.4206330+00:00' AS DateTimeOffset), 0, N'admin2@example.com', N'Admin2', N'Admin', N'av 10', N'1234567890', 1, 0, N'ADMIN', NULL)
INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (7, N'pbkdf2_sha256$720000$JLg3n8bLCtPcO3rCXdzVJo$LSl86Bbn4CNLR4TVzfYLYvkXeMSeIX3w6B9UJnbiaDk=', NULL, 0, N'administrador@gmail.com', N'', N'', N'', N'', 1, 1, N'USER', NULL)
INSERT [dbo].[login_customuser] ([id], [password], [last_login], [is_superuser], [email], [first_name], [last_name], [address], [phone], [is_active], [is_staff], [role], [photo]) VALUES (8, N'pbkdf2_sha256$720000$UOPhjC9cYJqy7fn9S8HZVh$j/MNh33M7M0DjnTNH1m+5EbB2DTCkd75B77iAApELx8=', CAST(N'2024-08-07T13:44:32.9427180+00:00' AS DateTimeOffset), 0, N'user1213@example.com', N'user', N'user2', N'av20', N'1234567890', 1, 0, N'USER', NULL)
SET IDENTITY_INSERT [dbo].[login_customuser] OFF
GO
/****** Object:  Index [admin_app_foundation_admin_id_64e12a4e]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [admin_app_foundation_admin_id_64e12a4e] ON [dbo].[admin_app_foundation]
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 12/8/2024 8:47:16 ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 12/8/2024 8:47:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 12/8/2024 8:47:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 12/8/2024 8:47:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__login_cu__AB6E6164757DF7ED]    Script Date: 12/8/2024 8:47:16 ******/
ALTER TABLE [dbo].[login_customuser] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_groups_customuser_id_50381d88]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [login_customuser_groups_customuser_id_50381d88] ON [dbo].[login_customuser_groups]
(
	[customuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_groups_customuser_id_group_id_280bd5c2_uniq]    Script Date: 12/8/2024 8:47:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [login_customuser_groups_customuser_id_group_id_280bd5c2_uniq] ON [dbo].[login_customuser_groups]
(
	[customuser_id] ASC,
	[group_id] ASC
)
WHERE ([customuser_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_groups_group_id_639d055d]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [login_customuser_groups_group_id_639d055d] ON [dbo].[login_customuser_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_user_permissions_customuser_id_c6f5792f]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [login_customuser_user_permissions_customuser_id_c6f5792f] ON [dbo].[login_customuser_user_permissions]
(
	[customuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_user_permissions_customuser_id_permission_id_afb8143d_uniq]    Script Date: 12/8/2024 8:47:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [login_customuser_user_permissions_customuser_id_permission_id_afb8143d_uniq] ON [dbo].[login_customuser_user_permissions]
(
	[customuser_id] ASC,
	[permission_id] ASC
)
WHERE ([customuser_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [login_customuser_user_permissions_permission_id_2b8ae21e]    Script Date: 12/8/2024 8:47:16 ******/
CREATE NONCLUSTERED INDEX [login_customuser_user_permissions_permission_id_2b8ae21e] ON [dbo].[login_customuser_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__user_pro__B9BE370EF7BFB474]    Script Date: 12/8/2024 8:47:16 ******/
ALTER TABLE [dbo].[user_profile] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admin_app_foundation]  WITH CHECK ADD  CONSTRAINT [admin_app_foundation_admin_id_64e12a4e_fk_login_customuser_id] FOREIGN KEY([admin_id])
REFERENCES [dbo].[login_customuser] ([id])
GO
ALTER TABLE [dbo].[admin_app_foundation] CHECK CONSTRAINT [admin_app_foundation_admin_id_64e12a4e_fk_login_customuser_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_login_customuser_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_customuser] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_login_customuser_id]
GO
ALTER TABLE [dbo].[login_customuser_groups]  WITH CHECK ADD  CONSTRAINT [login_customuser_groups_customuser_id_50381d88_fk_login_customuser_id] FOREIGN KEY([customuser_id])
REFERENCES [dbo].[login_customuser] ([id])
GO
ALTER TABLE [dbo].[login_customuser_groups] CHECK CONSTRAINT [login_customuser_groups_customuser_id_50381d88_fk_login_customuser_id]
GO
ALTER TABLE [dbo].[login_customuser_groups]  WITH CHECK ADD  CONSTRAINT [login_customuser_groups_group_id_639d055d_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[login_customuser_groups] CHECK CONSTRAINT [login_customuser_groups_group_id_639d055d_fk_auth_group_id]
GO
ALTER TABLE [dbo].[login_customuser_user_permissions]  WITH CHECK ADD  CONSTRAINT [login_customuser_user_permissions_customuser_id_c6f5792f_fk_login_customuser_id] FOREIGN KEY([customuser_id])
REFERENCES [dbo].[login_customuser] ([id])
GO
ALTER TABLE [dbo].[login_customuser_user_permissions] CHECK CONSTRAINT [login_customuser_user_permissions_customuser_id_c6f5792f_fk_login_customuser_id]
GO
ALTER TABLE [dbo].[login_customuser_user_permissions]  WITH CHECK ADD  CONSTRAINT [login_customuser_user_permissions_permission_id_2b8ae21e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[login_customuser_user_permissions] CHECK CONSTRAINT [login_customuser_user_permissions_permission_id_2b8ae21e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[user_profile]  WITH CHECK ADD  CONSTRAINT [user_profile_user_id_8fdce8e2_fk_login_customuser_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[login_customuser] ([id])
GO
ALTER TABLE [dbo].[user_profile] CHECK CONSTRAINT [user_profile_user_id_8fdce8e2_fk_login_customuser_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [BD_VOLU] SET  READ_WRITE 
GO
