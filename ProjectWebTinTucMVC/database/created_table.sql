use webbanhang;

create table [Role](
	id bigint not null identity(1,1) primary key,
	name varchar(255) not NULL,
	code varchar(255) not null, 
	created_date DATETIME null,
	modified_date DATETIME null,
	created_by varchar(255) null,
	modified_by varchar(255) null
);

CREATE TABLE [User](
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	username nvarchar(255) NOT NULL,
	[password] nvarchar(255) NOT NULL,
	fullname nvarchar(255) NULL,
	[status] int NOT NULL,
	role_id bigint NOT NULL,
	created_date DATETIME null,
	modified_date DATETIME null,
	created_by nvarchar(255) null,
	modified_by nvarchar(255) null
);
/*foriegn key*/
ALTER TABLE [User] ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES [Role](id)

CREATE TABLE [News](
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	title NVARCHAR(255) NULL,
	thumbnail NVARCHAR(150) NULL,
	short_desciption TEXT  NULL,
	content TEXT NULL,
	category_id BIGINT NOT NULL,
	created_date DATETIME null,
	modified_date DATETIME null,
	created_by nvarchar(255) null,
	modified_by nvarchar(255) null
)
CREATE TABLE [Category](
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	name varchar(255) not NULL,
	code varchar(255) not null,
	created_date DATETIME null,
	modified_date DATETIME null,
	created_by nvarchar(255) null,
	modified_by nvarchar(255) null
)
ALTER TABLE [dbo].[News] ADD CONSTRAINT fk_news_category FOREIGN KEY (category_id) REFERENCES [Category](id)
/*user 1 - n user_news(comment) n - 1 news */
CREATE TABLE [Comment](
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	content TEXT NOT NULL,
	user_id BIGINT NOT NULL,
	news_id BIGINT NOT NULL,
	created_date DATETIME null,
	modified_date DATETIME null,
	created_by nvarchar(255) null,
	modified_by nvarchar(255) null
)
ALTER TABLE [dbo].[Comment] ADD CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES [User](id)
ALTER TABLE [dbo].[Comment] ADD CONSTRAINT fk_comment_news FOREIGN KEY (news_id) REFERENCES dbo.News(id)