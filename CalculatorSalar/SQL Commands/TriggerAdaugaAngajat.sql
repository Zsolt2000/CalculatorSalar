USE [CalculatorSalar]
GO
/****** Object:  Trigger [dbo].[TriggerAdaugaAngajat]    Script Date: 10/27/2024 11:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[TriggerAdaugaAngajat]
on [dbo].[Angajati]
after Insert
AS 
BEGIN
set nocount on;
declare @impozit float;
declare @cas float;
declare @cass float;
declare @id int;
declare @nr_crt int;
declare @salar_baza int;
declare @spor int;
declare @premii_brute int;
declare @retineri int

if(not exists (select * from inserted))
return;

select @impozit=IMPOZIT, @cas=CAS,@cass=CASS, @id=ID from Taxe
select @nr_crt=NR_CRT, @salar_baza=SALAR_BAZA,@spor=SPOR,@premii_brute=PREMII_BRUTE,@retineri=RETINERI from inserted
print 'hello';
print @impozit+' '+ @cas+' '+ @cass+' '+ @id+' '+ @nr_crt+' '+ @salar_baza+' '+ @spor+' '+ @premii_brute+' '+ @retineri;

exec UpdateAngajatCuTaxe @impozit,@cas,@cass,@id,@nr_crt,@salar_baza,@spor,@premii_brute,@retineri;
END
