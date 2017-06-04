
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/02/2017 21:44:23
-- Generated from EDMX file: D:\Project\BinaryGaming\BinaryGaming\BinaryGamingData.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BinaryGaming];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MembershipTypesMembers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members] DROP CONSTRAINT [FK_MembershipTypesMembers];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionTypesTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_TransactionTypesTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_MembersTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_MembersTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_CommitteePositionsCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Committees] DROP CONSTRAINT [FK_CommitteePositionsCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_MembersCommittee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Committees] DROP CONSTRAINT [FK_MembersCommittee];
GO
IF OBJECT_ID(N'[dbo].[FK_MembersLoginLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LoginLogs] DROP CONSTRAINT [FK_MembersLoginLog];
GO
IF OBJECT_ID(N'[dbo].[FK_RolesMemberRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MemberRoles] DROP CONSTRAINT [FK_RolesMemberRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_MemberRolesMembers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MemberRoles] DROP CONSTRAINT [FK_MemberRolesMembers];
GO
IF OBJECT_ID(N'[dbo].[FK_MembersInvoices]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_MembersInvoices];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoicesTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_InvoicesTransaction];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[Transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transactions];
GO
IF OBJECT_ID(N'[dbo].[MembershipTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembershipTypes];
GO
IF OBJECT_ID(N'[dbo].[TransactionTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionTypes];
GO
IF OBJECT_ID(N'[dbo].[CommitteePositions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommitteePositions];
GO
IF OBJECT_ID(N'[dbo].[Committees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Committees];
GO
IF OBJECT_ID(N'[dbo].[LoginLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoginLogs];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[MemberRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MemberRoles];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Surname] nvarchar(40)  NOT NULL,
    [FirstName] nvarchar(30)  NOT NULL,
    [MiddleNames] nvarchar(30)  NOT NULL,
    [Address1] nvarchar(40)  NOT NULL,
    [Address2] nvarchar(40)  NOT NULL,
    [Suburb] nvarchar(40)  NOT NULL,
    [State] nvarchar(3)  NOT NULL,
    [Postcode] nvarchar(4)  NOT NULL,
    [Phone] nvarchar(25)  NOT NULL,
    [Email] nvarchar(200)  NOT NULL,
    [Mobile] nvarchar(25)  NOT NULL,
    [DateJoined] datetime  NOT NULL,
    [FinancialYN] bit  NOT NULL,
    [MembershipTypesId] int  NOT NULL,
    [MembershipExpiry] datetime  NOT NULL,
    [DiscordName] nvarchar(40)  NOT NULL,
    [DiscordId] bigint  NOT NULL,
    [PasswordHash] nvarchar(100)  NOT NULL,
    [PasswordSalt] nvarchar(100)  NOT NULL,
    [LoginAttempts] int  NOT NULL,
    [LockedYN] bit  NOT NULL,
    [LastLoggedIn] datetime  NOT NULL
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TransactionDate] datetime  NOT NULL,
    [Amount] decimal(8,2)  NOT NULL,
    [TransactionTypesId] int  NOT NULL,
    [MembersId] int  NOT NULL,
    [InvoicesId] int  NOT NULL
);
GO

-- Creating table 'MembershipTypes'
CREATE TABLE [dbo].[MembershipTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MembershipType] nvarchar(30)  NULL,
    [AnnualFee] decimal(8,2)  NULL,
    [ProrataPayments] int  NULL
);
GO

-- Creating table 'TransactionTypes'
CREATE TABLE [dbo].[TransactionTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TransactionType] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'CommitteePositions'
CREATE TABLE [dbo].[CommitteePositions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PostionName] nvarchar(40)  NULL,
    [Ranking] int  NOT NULL
);
GO

-- Creating table 'Committees'
CREATE TABLE [dbo].[Committees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CommitteePositionsId] int  NOT NULL,
    [MembersId] int  NOT NULL
);
GO

-- Creating table 'LoginLogs'
CREATE TABLE [dbo].[LoginLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MembersId] int  NOT NULL,
    [LoginDate] datetime  NOT NULL,
    [SuccessfulYN] bit  NOT NULL,
    [ErrorException] nvarchar(max)  NOT NULL,
    [ClientIpAddress] nvarchar(60)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(40)  NULL
);
GO

-- Creating table 'MemberRoles'
CREATE TABLE [dbo].[MemberRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RolesId] int  NOT NULL,
    [MembersId] int  NOT NULL,
    [InsertYN] bit  NOT NULL,
    [ChangeYN] bit  NOT NULL,
    [DeleteYN] bit  NOT NULL,
    [LookupYN] bit  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MembersId] int  NULL,
    [Date] datetime  NOT NULL,
    [MembershipType] nvarchar(30)  NULL,
    [Amount] decimal(8,2)  NOT NULL,
    [Outstanding] decimal(8,2)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MembershipTypes'
ALTER TABLE [dbo].[MembershipTypes]
ADD CONSTRAINT [PK_MembershipTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransactionTypes'
ALTER TABLE [dbo].[TransactionTypes]
ADD CONSTRAINT [PK_TransactionTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommitteePositions'
ALTER TABLE [dbo].[CommitteePositions]
ADD CONSTRAINT [PK_CommitteePositions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Committees'
ALTER TABLE [dbo].[Committees]
ADD CONSTRAINT [PK_Committees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LoginLogs'
ALTER TABLE [dbo].[LoginLogs]
ADD CONSTRAINT [PK_LoginLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MemberRoles'
ALTER TABLE [dbo].[MemberRoles]
ADD CONSTRAINT [PK_MemberRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MembershipTypesId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_MembershipTypesMembers]
    FOREIGN KEY ([MembershipTypesId])
    REFERENCES [dbo].[MembershipTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembershipTypesMembers'
CREATE INDEX [IX_FK_MembershipTypesMembers]
ON [dbo].[Members]
    ([MembershipTypesId]);
GO

-- Creating foreign key on [TransactionTypesId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_TransactionTypesTransaction]
    FOREIGN KEY ([TransactionTypesId])
    REFERENCES [dbo].[TransactionTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionTypesTransaction'
CREATE INDEX [IX_FK_TransactionTypesTransaction]
ON [dbo].[Transactions]
    ([TransactionTypesId]);
GO

-- Creating foreign key on [MembersId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_MembersTransaction]
    FOREIGN KEY ([MembersId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersTransaction'
CREATE INDEX [IX_FK_MembersTransaction]
ON [dbo].[Transactions]
    ([MembersId]);
GO

-- Creating foreign key on [CommitteePositionsId] in table 'Committees'
ALTER TABLE [dbo].[Committees]
ADD CONSTRAINT [FK_CommitteePositionsCommittee]
    FOREIGN KEY ([CommitteePositionsId])
    REFERENCES [dbo].[CommitteePositions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommitteePositionsCommittee'
CREATE INDEX [IX_FK_CommitteePositionsCommittee]
ON [dbo].[Committees]
    ([CommitteePositionsId]);
GO

-- Creating foreign key on [MembersId] in table 'Committees'
ALTER TABLE [dbo].[Committees]
ADD CONSTRAINT [FK_MembersCommittee]
    FOREIGN KEY ([MembersId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersCommittee'
CREATE INDEX [IX_FK_MembersCommittee]
ON [dbo].[Committees]
    ([MembersId]);
GO

-- Creating foreign key on [MembersId] in table 'LoginLogs'
ALTER TABLE [dbo].[LoginLogs]
ADD CONSTRAINT [FK_MembersLoginLog]
    FOREIGN KEY ([MembersId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersLoginLog'
CREATE INDEX [IX_FK_MembersLoginLog]
ON [dbo].[LoginLogs]
    ([MembersId]);
GO

-- Creating foreign key on [RolesId] in table 'MemberRoles'
ALTER TABLE [dbo].[MemberRoles]
ADD CONSTRAINT [FK_RolesMemberRoles]
    FOREIGN KEY ([RolesId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolesMemberRoles'
CREATE INDEX [IX_FK_RolesMemberRoles]
ON [dbo].[MemberRoles]
    ([RolesId]);
GO

-- Creating foreign key on [MembersId] in table 'MemberRoles'
ALTER TABLE [dbo].[MemberRoles]
ADD CONSTRAINT [FK_MemberRolesMembers]
    FOREIGN KEY ([MembersId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MemberRolesMembers'
CREATE INDEX [IX_FK_MemberRolesMembers]
ON [dbo].[MemberRoles]
    ([MembersId]);
GO

-- Creating foreign key on [MembersId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_MembersInvoices]
    FOREIGN KEY ([MembersId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersInvoices'
CREATE INDEX [IX_FK_MembersInvoices]
ON [dbo].[Invoices]
    ([MembersId]);
GO

-- Creating foreign key on [InvoicesId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_InvoicesTransaction]
    FOREIGN KEY ([InvoicesId])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoicesTransaction'
CREATE INDEX [IX_FK_InvoicesTransaction]
ON [dbo].[Transactions]
    ([InvoicesId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------