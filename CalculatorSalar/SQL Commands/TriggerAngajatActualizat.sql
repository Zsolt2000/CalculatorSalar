-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER TriggerAngajatActualizat
   ON  Angajati
   AFTER Update
AS 
BEGIN
	SET NOCOUNT ON;
	declare @impozit float;
declare @cas float;
declare @cass float;
declare @id int;
declare @nr_crt int;
declare @salar_baza int;
declare @spor int;
declare @premii_brute int;
declare @retineri int


select @impozit=IMPOZIT, @cas=CAS,@cass=CASS, @id=ID from Taxe

select @nr_crt=NR_CRT, @salar_baza=SALAR_BAZA,@spor=SPOR,@premii_brute=PREMII_BRUTE,@retineri=RETINERI from inserted
print @impozit+' '+ @cas+' '+ @cass+' '+ @id+' '+ @nr_crt+' '+ @salar_baza+' '+ @spor+' '+ @premii_brute+' '+ @retineri;

exec UpdateAngajatCuTaxe @impozit,@cas,@cass,@id,@nr_crt,@salar_baza,@spor,@premii_brute,@retineri;

END
GO
