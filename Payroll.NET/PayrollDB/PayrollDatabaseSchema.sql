if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_EmployeeAffiliation_Affiliation]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[EmployeeAffiliation] DROP CONSTRAINT FK_EmployeeAffiliation_Affiliation
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ServiceCharge_Affiliation]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ServiceCharge] DROP CONSTRAINT FK_ServiceCharge_Affiliation
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CommissionedClassification_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CommissionedClassification] DROP CONSTRAINT FK_CommissionedClassification_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_DirectDepositAccount_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[DirectDepositAccount] DROP CONSTRAINT FK_DirectDepositAccount_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_EmployeeAffiliation_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[EmployeeAffiliation] DROP CONSTRAINT FK_EmployeeAffiliation_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_HourlyClassification_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[HourlyClassification] DROP CONSTRAINT FK_HourlyClassification_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PaycheckAddress_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PaycheckAddress] DROP CONSTRAINT FK_PaycheckAddress_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SalariedClassification_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SalariedClassification] DROP CONSTRAINT FK_SalariedClassification_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SalesReceipt_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SalesReceipt] DROP CONSTRAINT FK_SalesReceipt_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TimeCard_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TimeCard] DROP CONSTRAINT FK_TimeCard_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Affiliation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Affiliation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CommissionedClassification]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CommissionedClassification]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DirectDepositAccount]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DirectDepositAccount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employee]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Employee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EmployeeAffiliation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EmployeeAffiliation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HourlyClassification]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HourlyClassification]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PaycheckAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PaycheckAddress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SalariedClassification]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SalariedClassification]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SalesReceipt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SalesReceipt]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ServiceCharge]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ServiceCharge]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TimeCard]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TimeCard]
GO

CREATE TABLE [dbo].[Affiliation] (
	[Id] [int] IDENTITY (1, 1) NOT NULL ,
	[Dues] [decimal](18, 0) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CommissionedClassification] (
	[Salary] [money] NOT NULL ,
	[Commission] [money] NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DirectDepositAccount] (
	[Bank] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Account] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employee] (
	[EmpId] [int] NOT NULL ,
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Address] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ScheduleType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PaymentMethodType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PaymentClassificationType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EmployeeAffiliation] (
	[EmpId] [int] NOT NULL ,
	[AffiliationId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HourlyClassification] (
	[HourlyRate] [money] NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PaycheckAddress] (
	[Address] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SalariedClassification] (
	[Salary] [money] NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SalesReceipt] (
	[Date] [datetime] NOT NULL ,
	[Amount] [money] NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ServiceCharge] (
	[Date] [datetime] NOT NULL ,
	[Amount] [money] NOT NULL ,
	[AffiliationId] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TimeCard] (
	[Date] [datetime] NOT NULL ,
	[Hours] [int] NOT NULL ,
	[EmpId] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Affiliation] ADD 
	CONSTRAINT [PK_Affiliation] PRIMARY KEY  CLUSTERED 
	(
		[Id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employee] ADD 
	CONSTRAINT [PK_Employee] PRIMARY KEY  CLUSTERED 
	(
		[EmpId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CommissionedClassification] ADD 
	CONSTRAINT [FK_CommissionedClassification_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[DirectDepositAccount] ADD 
	CONSTRAINT [FK_DirectDepositAccount_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[EmployeeAffiliation] ADD 
	CONSTRAINT [FK_EmployeeAffiliation_Affiliation] FOREIGN KEY 
	(
		[AffiliationId]
	) REFERENCES [dbo].[Affiliation] (
		[Id]
	),
	CONSTRAINT [FK_EmployeeAffiliation_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[HourlyClassification] ADD 
	CONSTRAINT [FK_HourlyClassification_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[PaycheckAddress] ADD 
	CONSTRAINT [FK_PaycheckAddress_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[SalariedClassification] ADD 
	CONSTRAINT [FK_SalariedClassification_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[SalesReceipt] ADD 
	CONSTRAINT [FK_SalesReceipt_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

ALTER TABLE [dbo].[ServiceCharge] ADD 
	CONSTRAINT [FK_ServiceCharge_Affiliation] FOREIGN KEY 
	(
		[AffiliationId]
	) REFERENCES [dbo].[Affiliation] (
		[Id]
	)
GO

ALTER TABLE [dbo].[TimeCard] ADD 
	CONSTRAINT [FK_TimeCard_Employee] FOREIGN KEY 
	(
		[EmpId]
	) REFERENCES [dbo].[Employee] (
		[EmpId]
	)
GO

