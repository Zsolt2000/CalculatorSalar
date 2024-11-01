USE [CalculatorSalar]
GO
/****** Object:  Trigger [dbo].[TriggerUpdateTaxe]    Script Date: 10/27/2024 7:29:32 PM ******/
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
declare @new_impozit float;
declare @new_cas float;
declare @new_cass float;
declare @new_id int;
select @new_impozit=IMPOZIT, @new_cas=CAS,@new_cass=CASS, @new_id=ID from Taxe
exec UpdateAngajatiTaxe @new_impozit,@new_cas,@new_cass,@new_id;
END
