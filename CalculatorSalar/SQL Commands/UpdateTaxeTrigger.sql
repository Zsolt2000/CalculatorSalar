USE [CalculatorSalar]
GO
/****** Object:  Trigger [dbo].[TriggerUpdateTaxe]    Script Date: 11/4/2024 11:59:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER   Trigger [dbo].[TriggerUpdateTaxe]
   ON  [dbo].[Taxe] 
   AFTER Update
AS 
BEGIN
declare @new_impozit real;
declare @new_cas real;
declare @new_cass real;
declare @new_id int;
select @new_impozit=IMPOZIT, @new_cas=CAS,@new_cass=CASS, @new_id=ID from inserted
exec UpdateAngajatiTaxe @new_impozit,@new_cas,@new_cass,@new_id;
END
