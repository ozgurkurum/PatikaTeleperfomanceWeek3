USE [master]
GO
/****** Object:  Database [social]    Script Date: 5.06.2022 18:52:56 ******/
CREATE DATABASE [social]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'social', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\social.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'social_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\social_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [social] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [social].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [social] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [social] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [social] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [social] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [social] SET ARITHABORT OFF 
GO
ALTER DATABASE [social] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [social] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [social] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [social] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [social] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [social] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [social] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [social] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [social] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [social] SET  ENABLE_BROKER 
GO
ALTER DATABASE [social] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [social] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [social] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [social] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [social] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [social] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [social] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [social] SET RECOVERY FULL 
GO
ALTER DATABASE [social] SET  MULTI_USER 
GO
ALTER DATABASE [social] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [social] SET DB_CHAINING OFF 
GO
ALTER DATABASE [social] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [social] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [social] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [social] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [social] SET QUERY_STORE = OFF
GO
USE [social]
GO
/****** Object:  Table [dbo].[friend_confirmation]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friend_confirmation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userFriendSourceId] [int] NOT NULL,
	[userFriendTargetId] [int] NOT NULL,
	[friendStatus] [bit] NULL,
 CONSTRAINT [PK_friend_confirmation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_followers]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_followers](
	[groupFollowerId] [bigint] IDENTITY(1,1) NOT NULL,
	[groupId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupFollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_member]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_member](
	[memberId] [bigint] IDENTITY(1,1) NOT NULL,
	[groupId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
	[joinedAt] [datetime] NULL,
	[updaredAt] [datetime] NULL,
	[totalPosts] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_post]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_post](
	[postId] [bigint] IDENTITY(1,1) NOT NULL,
	[groupId] [bigint] NOT NULL,
	[memberId] [bigint] NOT NULL,
	[post] [varchar](255) NULL,
 CONSTRAINT [PK__group_po__DD0C739A2B3C655E] PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message_history]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_history](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[messageId] [int] NOT NULL,
	[messageType] [char](6) NULL,
	[messageContent] [nvarchar](max) NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [PK_message_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_likes]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_likes](
	[likeId] [bigint] IDENTITY(1,1) NOT NULL,
	[postId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[likeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[social_group]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_group](
	[groupId] [bigint] IDENTITY(1,1) NOT NULL,
	[createdBy] [bigint] NULL,
	[title] [varchar](50) NULL,
	[details] [text] NULL,
	[groupStatus] [varchar](8) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_followers]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_followers](
	[followerId] [bigint] IDENTITY(1,1) NOT NULL,
	[sourceId] [bigint] NOT NULL,
	[targetId] [bigint] NOT NULL,
	[status] [varchar](8) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[followerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_friends]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_friends](
	[friendId] [bigint] IDENTITY(1,1) NOT NULL,
	[sourceId] [bigint] NOT NULL,
	[targetId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[friendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_message]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_message](
	[messageId] [bigint] IDENTITY(1,1) NOT NULL,
	[sourceId] [bigint] NOT NULL,
	[targetId] [bigint] NOT NULL,
	[userMessage] [nvarchar](max) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[imageUrl] [varchar](50) NULL,
	[videoUrl] [varchar](50) NULL,
	[messageType] [char](6) NOT NULL,
 CONSTRAINT [PK__user_mes__4808B9933A5A8483] PRIMARY KEY CLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_posts]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_posts](
	[postId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[userMessages] [varchar](255) NULL,
	[totalLikes] [bigint] NULL,
	[createAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[middleName] [varchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[mobile] [varchar](15) NULL,
	[email] [varchar](50) NULL,
	[passwordHash] [varchar](255) NULL,
	[username] [nchar](30) NULL,
	[registeredAt] [datetime] NULL,
	[lastLogin] [datetime] NULL,
	[profileDescription] [varchar](50) NULL,
	[noOfPosts] [int] NULL,
	[profilePicture] [varchar](100) NULL,
	[totalFollowers] [int] NULL,
	[totalFriends] [int] NULL,
 CONSTRAINT [PK__users__CB9A1CFF7B35A3EA] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MyTable_Email]    Script Date: 5.06.2022 18:52:56 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UQ_MyTable_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[group_member] ADD  CONSTRAINT [DF_group_member_totalPosts]  DEFAULT ((0)) FOR [totalPosts]
GO
ALTER TABLE [dbo].[user_message] ADD  CONSTRAINT [DF__user_mess__messa__4CA06362]  DEFAULT ('text') FOR [messageType]
GO
ALTER TABLE [dbo].[group_followers]  WITH CHECK ADD  CONSTRAINT [fk_gfollowers_group] FOREIGN KEY([groupId])
REFERENCES [dbo].[social_group] ([groupId])
GO
ALTER TABLE [dbo].[group_followers] CHECK CONSTRAINT [fk_gfollowers_group]
GO
ALTER TABLE [dbo].[group_followers]  WITH CHECK ADD  CONSTRAINT [fk_gfollowers_user] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[group_followers] CHECK CONSTRAINT [fk_gfollowers_user]
GO
ALTER TABLE [dbo].[group_member]  WITH CHECK ADD  CONSTRAINT [fk_member_group] FOREIGN KEY([groupId])
REFERENCES [dbo].[social_group] ([groupId])
GO
ALTER TABLE [dbo].[group_member] CHECK CONSTRAINT [fk_member_group]
GO
ALTER TABLE [dbo].[group_member]  WITH CHECK ADD  CONSTRAINT [fk_member_user] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[group_member] CHECK CONSTRAINT [fk_member_user]
GO
ALTER TABLE [dbo].[group_post]  WITH CHECK ADD  CONSTRAINT [fk_post_group] FOREIGN KEY([groupId])
REFERENCES [dbo].[social_group] ([groupId])
GO
ALTER TABLE [dbo].[group_post] CHECK CONSTRAINT [fk_post_group]
GO
ALTER TABLE [dbo].[group_post]  WITH CHECK ADD  CONSTRAINT [fk_post_member] FOREIGN KEY([memberId])
REFERENCES [dbo].[group_member] ([memberId])
GO
ALTER TABLE [dbo].[group_post] CHECK CONSTRAINT [fk_post_member]
GO
ALTER TABLE [dbo].[post_likes]  WITH CHECK ADD  CONSTRAINT [fk_post] FOREIGN KEY([postId])
REFERENCES [dbo].[user_posts] ([postId])
GO
ALTER TABLE [dbo].[post_likes] CHECK CONSTRAINT [fk_post]
GO
ALTER TABLE [dbo].[post_likes]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[post_likes] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[user_followers]  WITH CHECK ADD  CONSTRAINT [fk_follower_source] FOREIGN KEY([sourceId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_followers] CHECK CONSTRAINT [fk_follower_source]
GO
ALTER TABLE [dbo].[user_followers]  WITH CHECK ADD  CONSTRAINT [fk_followers_target] FOREIGN KEY([targetId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_followers] CHECK CONSTRAINT [fk_followers_target]
GO
ALTER TABLE [dbo].[user_friends]  WITH CHECK ADD  CONSTRAINT [fk_follower_targer] FOREIGN KEY([targetId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_friends] CHECK CONSTRAINT [fk_follower_targer]
GO
ALTER TABLE [dbo].[user_friends]  WITH CHECK ADD  CONSTRAINT [fk_friend_source] FOREIGN KEY([sourceId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_friends] CHECK CONSTRAINT [fk_friend_source]
GO
ALTER TABLE [dbo].[user_friends]  WITH CHECK ADD  CONSTRAINT [fk_friend_targer] FOREIGN KEY([sourceId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_friends] CHECK CONSTRAINT [fk_friend_targer]
GO
ALTER TABLE [dbo].[user_friends]  WITH CHECK ADD  CONSTRAINT [fk_friends_targer] FOREIGN KEY([targetId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_friends] CHECK CONSTRAINT [fk_friends_targer]
GO
ALTER TABLE [dbo].[user_message]  WITH CHECK ADD  CONSTRAINT [fk_message_source] FOREIGN KEY([sourceId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_message] CHECK CONSTRAINT [fk_message_source]
GO
ALTER TABLE [dbo].[user_message]  WITH CHECK ADD  CONSTRAINT [fk_message_target] FOREIGN KEY([targetId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_message] CHECK CONSTRAINT [fk_message_target]
GO
ALTER TABLE [dbo].[user_posts]  WITH CHECK ADD  CONSTRAINT [fk_posts] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_posts] CHECK CONSTRAINT [fk_posts]
GO
ALTER TABLE [dbo].[user_message]  WITH CHECK ADD  CONSTRAINT [CK__user_mess__messa__4D94879B] CHECK  (([messageType]='video' OR [messageType]='image' OR [messageType]='text'))
GO
ALTER TABLE [dbo].[user_message] CHECK CONSTRAINT [CK__user_mess__messa__4D94879B]
GO
/****** Object:  StoredProcedure [dbo].[maxMessageUsers]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[maxMessageUsers]
AS
select top 10 
	COUNT(m.sourceId) messageNumber, m.sourceId from user_message m
	join Users u on u.userId=m.sourceId group by m.sourceId order by messageNumber desc	
GO
/****** Object:  Trigger [dbo].[friendshipConfirm]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[friendshipConfirm]
on [dbo].[user_friends]
after insert 
as 
begin
	Declare @sourceId int,
	@targetId int,
	@status bit
	set @status=0
	select  @sourceId=sourceId,@targetId=targetId from inserted
	insert into friend_confirmation(userFriendSourceId,userFriendTargetId,friendStatus) values (@sourceId,@targetId,@status)
end
GO
ALTER TABLE [dbo].[user_friends] ENABLE TRIGGER [friendshipConfirm]
GO
/****** Object:  Trigger [dbo].[messageHistory]    Script Date: 5.06.2022 18:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[messageHistory]
ON [dbo].[user_message]
for update
AS
BEGIN
DECLARE @messageId as int
DECLARE @messageContent as nvarchar(max)
DECLARE @messageType as char(6)
DECLARE @updateTime AS DATETIME

SELECT @messageId=messageId,@messageContent=userMessage,@messageType=messageType,@updateTime=updatedAt FROM deleted

INSERT INTO message_history (messageId,messageType,messageContent,updatedAt)
VALUES (@messageId,@messageContent,@messageType,@updateTime)

UPDATE user_message SET userMessage=@messageContent, messageType=@messageType, updatedAt=GETDATE()
WHERE messageId=@messageId

END
GO
ALTER TABLE [dbo].[user_message] ENABLE TRIGGER [messageHistory]
GO
USE [master]
GO
ALTER DATABASE [social] SET  READ_WRITE 
GO
