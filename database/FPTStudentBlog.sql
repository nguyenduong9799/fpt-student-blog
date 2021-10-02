USE [master]
GO
/****** Object:  Database [FPTStudentBlog]    Script Date: 10/2/2021 12:31:27 PM ******/
CREATE DATABASE [FPTStudentBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTStudentBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTStudentBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTStudentBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTStudentBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTStudentBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET  MULTI_USER 
GO
ALTER DATABASE [FPTStudentBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTStudentBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTStudentBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTStudentBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTStudentBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTStudentBlog] SET QUERY_STORE = OFF
GO
USE [FPTStudentBlog]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[userID] [varchar](10) NULL,
	[date] [datetime] NULL,
	[commentContent] [nvarchar](max) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPosts]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosts](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](10) NOT NULL,
	[statusPID] [varchar](10) NOT NULL,
	[categoryID] [int] NULL,
	[title] [nvarchar](max) NULL,
	[postContent] [ntext] NULL,
	[date] [datetime] NULL,
	[vote] [int] NULL,
	[approveComment] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblPosts] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRank]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRank](
	[rankID] [int] NOT NULL,
	[rankName] [nvarchar](100) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_tblRank] PRIMARY KEY CLUSTERED 
(
	[rankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReports](
	[reportID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[reportContent] [varchar](max) NULL,
	[date] [datetime] NULL,
	[userID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblReports] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusPosts]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusPosts](
	[statusPID] [varchar](10) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatusPosts] PRIMARY KEY CLUSTERED 
(
	[statusPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusUser]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusUser](
	[statusUID] [varchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatusUser] PRIMARY KEY CLUSTERED 
(
	[statusUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTagBlog]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTagBlog](
	[postID] [int] NOT NULL,
	[tagID] [int] NOT NULL,
 CONSTRAINT [PK_tblTagBlog] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTags]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTags](
	[tagID] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [varchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblTags] PRIMARY KEY CLUSTERED 
(
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[statusUID] [varchar](10) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[totalVote] [int] NULL,
	[rankID] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVote]    Script Date: 10/2/2021 12:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVote](
	[postID] [int] NOT NULL,
	[userID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblVote] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (1, N'BUSINESS ADMINISTRATION')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (2, N'SOFTWARE ENGINEERING')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (3, N'INTERNATIONAL BUSSINESS')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (4, N'INFORMATION ASSURANCE')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (5, N'MULTIMEDIA COMMUNICATIONS')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (6, N'GRAPHIC DESIGN')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (7, N'HOTEL MANAGEMENT')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (8, N'ENGLISH LANGUAGE')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (9, N'JAPANESE LANGUAGE')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (1, 3, N'khoala', CAST(N'2021-09-29T21:50:59.150' AS DateTime), N'<p>asdadw</p>', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (2, 3, N'khoala', CAST(N'2021-09-29T21:51:15.083' AS DateTime), N'<p>dsrfsdref</p>', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (3, 3, N'khoala', CAST(N'2021-09-29T21:51:18.067' AS DateTime), N'<p>dsrfsdref</p>', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (4, 3, N'khoala', CAST(N'2021-09-29T21:51:52.400' AS DateTime), N'<p>asdaddad</p>', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (5, 3, N'khoala', CAST(N'2021-09-29T21:52:02.093' AS DateTime), N'<p>asdaddad</p>', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (6, 3, N'khoala', CAST(N'2021-09-29T21:53:51.157' AS DateTime), N'<p>adwadw</p>', NULL)
SET IDENTITY_INSERT [dbo].[tblComment] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPosts] ON 

INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (1, N'khoala', N'0', 1, N'[Case Study] Bí quyết kinh doanh trong mùa dịch của chuỗi thời trang Real Clothes', N'Thời trang vốn là sản phẩm không thiết yếu, đặc biệt khi sức khoẻ và cái chết cận kề. Tuy nhiên khá may mắn, trong danh mục không cần thiết của thời trang, thì các sản phẩm của Real vẫn mang tính rất là cơ bản và đời sống : quần tây đi làm / sơ mi công sở/ aó vest đi nắng ngồi máy lạnh. Nên thời gian qua doanh thu dù có giảm so với cùng kỳ các năm trước, vẫn ở mức chấp nhận được.', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 2, N'Too short')
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (2, N'quangnt', N'2', 2, N'A website on building software effectively', N'If there''s a theme that runs through my work and writing on this site, it''s the interplay between the shift towards agile thinking and the technical patterns and practices that make agile software development practical. While specifics of technology change rapidly in our profession, fundamental practices and patterns are more stable. So writing about these allows me to have articles on this site that are several years old but still as relevant as when they were written.

As software becomes more critical to modern business, software needs to be able to react quickly to changes, allowing new features to be be conceived, developed and put into production rapidly. The techniques of agile software development began in the 1990s and became steadily more popular in the last decade. They focus on a flexible approach to planning, which allows software products to change direction as the users'' needs change and as product managers learn more about how to make their users effective. While widely accepted now, agile approaches are not easy, requiring significant skills for a team, but more importantly a culture of open collaboration both within the team and with a team''s partners.', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 0, N'OK')
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (3, N'duongn', N'1', 3, N'Mình đã sử dụng email edu như thế nào?', N'<p>Khi đi học, làm việc nhóm là một điều rất hiển nhiên. Để quản lý các file tài liệu cũng như tài nguyên khi làm việc nhóm, mình thường sử dụng email của trường.</p><p>Vì lí do rất to bự: Driver của email edu không giới hạn dung lượng, nên việc mình upload các tài nguyên lên không sợ hết bộ nhớ. Từ hình ảnh, đến các file bài giảng, tài liệu cho đến quản lý hoạt động làm việc nhóm với Spreadsheets, Google Docs, Google Slides, Google Meets, Calendar, etc.</p><p>Cá nhân mình thấy các bạn sinh viên thường có thói quen dùng word, excel trong làm việc nhóm. Và vì vậy, các bạn thường có thói quen upload các file .docx hay .xlxs lên nhóm.</p><p>Tuy nhiên, mình thấy khá bất tiện khi làm điều này, vì mỗi lần chỉnh sửa, các bạn sẽ phải gửi một file mới, các bạn teammate khác muốn xem sẽ phải tải xuống các file rất nhiều lần. Ví dụ bạn chỉnh sửa 1 lần thì không vấn đề, nhưng chỉnh sửa cỡ 5 lần trở lên là tới công chiện với cái laptop của bạn liền =))</p>', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 32, N'Good Job')
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (4, N'linhntt', N'2', 4, N'[WTDTY] Thảm họa thế kỉ: giáo dục Việt Nam thời covid-19', N'"<h2><strong>Chất lượng giáo dục không được đảm bảo</strong></h2><p>Ngay cả với những gia đình vẫn còn đủ điều kiện nuôi dưỡng con cái thì họ lại gặp một vấn đề khác: nhiều trường học bị đóng cửa, học sinh phải chuyển sang học online tại nhà. Điều này gây nhiều hạn chế cho những bậc cha mẹ vẫn phải đi làm phần lớn thời gian ở bên ngoài. Trẻ có thể chịu những thiệt thòi khi không được chăm sóc và quan tâm đầy đủ, đúng mực</p>"', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (5, N'nhan', N'1', 5, N'Webinar "Kiểm Toán 101: Đường Nào Vào Nghề" - Tất Cả Những Gì Bạn Cần Biết Về Ngành Kiểm Toán', N'"<p>Hướng nghiệp đã không còn là chủ đề mới đối với các bạn trẻ, nhưng trên thực tế, nhu cầu tìm hiểu về các ngành nghề vẫn rất cao và việc định hướng nghề nghiệp hiện tại vẫn chưa đáp ứng được cho nguồn nhu cầu lớn đó.</p><p>Nắm bắt được tinh thần đó, với xuất phát điểm là nền tảng chia sẻ kiến thức và phát triển bản thân, Spiderum đã cho ra đời <a href="https://shopee.vn/shop/119238273/search?shopCollection=103531897"><strong>Tủ sách Hướng Nghiệp</strong></a><strong> và </strong><a href="https://open.spotify.com/show/0U7qIBlOPPyT3Avb0DvYOl"><strong>kênh Podcast “Người Trong Muôn Nghề”</strong></a> mang tới bức tranh thực tế về thế giới nghề nghiệp cũng như làm sáng tỏ những định kiến, hiểu lầm về mỗi ngành nghề. Chưa dừng lại tại đó, sắp tới nhà Nhện cũng sẽ cho ra mắt chuỗi webinar hướng nghiệp để các bạn có thể “mục sở thị" những ngành nghề mình mong muốn tìm hiểu thông qua buổi trao đổi, chia sẻ với các diễn giả giàu kinh nghiệm.</p><p>Webinar số đầu tiên “<strong>KIỂM TOÁN 101: ĐƯỜNG NÀO VÀO NGHỀ</strong>” sẽ giúp các bạn đang có nguyện vọng theo đuổi ngành kiểm toán hiểu rõ hơn về lĩnh vực tưởng chừng khô khan nhưng lại đầy màu sắc này. Đồng thời, đây cũng sẽ là buổi chia sẻ về câu chuyện học gì và làm gì để trở thành một kiểm toán viên cũng như “giải ảo” một số định kiến về ngành này. "Kiểm toán thực sự là gì? Làm gì trong những năm đầu vào nghề?" sẽ là những câu hỏi các bạn có thể tìm kiếm lời giải cho mình khi tham gia webinar này.&nbsp;</p>"', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[tblPosts] OFF
GO
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (0, N'None', 50)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (1, N'Bronze', 150)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (2, N'Silver', 250)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (3, N'Gold', 350)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (4, N'Platinum', 500)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (5, N'Diamond', 1000)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'0', N'Denied')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'1', N'Approved')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'2', N'Waiting')
GO
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'0', N'Banned')
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'1', N'Active')
GO
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (1, 1)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (1, 2)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (2, 1)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (2, 4)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (3, 3)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [dbo].[tblTags] ON 

INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (1, N'#baihoc', CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (2, N'#kinhte', CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (3, N'#email', CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (4, N'#fpt', CAST(N'2021-09-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblTags] OFF
GO
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'admin', N'AD', N'1', N'Khoa Admin', N'12345678', N'admin@gmail.com', N'113', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'duongn', N'US', N'1', N'Nguyen Duong', N'12345678', N'duongn@gmail.com', N'114', 23, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'khoala', N'US', N'1', N'Khoa Hacker', N'12345678', N'khoala@gmail.com', N'114', 1, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'linhntt', N'US', N'1', N'Nguyen Thi Thuy Linh', N'12345678', N'linhntt@gmail.com', N'117', 0, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'mentor', N'MT', N'1', N'Khoa Mentor', N'12345678', N'mentor@gmail.com', N'115', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'nhan', N'US', N'1', N'Nhan Nhan', N'12345678', N'nhannhan@gmail.com', N'118', 1, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'quangnt', N'US', N'1', N'Nguyen Thien Quang', N'12345678', N'quangnt1702@gmail.com', N'116', 0, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblVote] ([postID], [userID]) VALUES (3, N'khoala')
INSERT [dbo].[tblVote] ([postID], [userID]) VALUES (5, N'khoala')
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblPosts]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUsers]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblCategories]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblStatusPosts] FOREIGN KEY([statusPID])
REFERENCES [dbo].[tblStatusPosts] ([statusPID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblStatusPosts]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblUsers]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReports_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReports_tblPosts]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReports_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReports_tblUsers]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblPosts]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblTags] FOREIGN KEY([tagID])
REFERENCES [dbo].[tblTags] ([tagID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblTags]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRank] FOREIGN KEY([rankID])
REFERENCES [dbo].[tblRank] ([rankID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRank]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatusUser] FOREIGN KEY([statusUID])
REFERENCES [dbo].[tblStatusUser] ([statusUID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatusUser]
GO
ALTER TABLE [dbo].[tblVote]  WITH CHECK ADD  CONSTRAINT [FK_tblVote_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblVote] CHECK CONSTRAINT [FK_tblVote_tblPosts]
GO
ALTER TABLE [dbo].[tblVote]  WITH CHECK ADD  CONSTRAINT [FK_tblVote_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblVote] CHECK CONSTRAINT [FK_tblVote_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [FPTStudentBlog] SET  READ_WRITE 
GO
