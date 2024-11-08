USE [CalculatorSalar]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAngajatCuTaxe]    Script Date: 10/27/2024 11:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateAngajatCuTaxe] 
@impozit_trigger float,
@cas_trigger float,
@cass_trigger float,
@id_trigger int,
@nr_crt int,
@salar_baza int,
@spor int,
@premii_brute int,
@retineri int
AS
BEGIN
 DECLARE @TOTAL_BRUT int;
 DECLARE @CAS int;
 DECLARE @CASS int;
 DECLARE @BRUT_IMPOZABIL int;
 DECLARE @VIRAT_CARD int;
 DECLARE @IMPOZIT int

 SET @TOTAL_BRUT= @salar_baza*(1.0+@spor/100.0)+@premii_brute;
 SET @CAS=@TOTAL_BRUT*@cas_trigger;
 SET @CASS=@TOTAL_BRUT*@cass_trigger;
 SET @BRUT_IMPOZABIL=@TOTAL_BRUT-@CAS-@CASS;
 SET @IMPOZIT=@BRUT_IMPOZABIL*@impozit_trigger;
 SET @VIRAT_CARD=@TOTAL_BRUT-@IMPOZIT-@CAS-@CASS-@retineri;

Update Angajati
SET
TOTAL_BRUT=@TOTAL_BRUT,
CAS=@CAS,
CASS=@CASS,
BRUT_IMPOZABIl=@BRUT_IMPOZABIL,
IMPOZIT=@IMPOZIT,
VIRAT_CARD=@VIRAT_CARD
WHERE NR_CRT=@nr_crt
END
