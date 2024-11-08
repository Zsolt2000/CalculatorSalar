USE [CalculatorSalar]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAngajatiTaxe]    Script Date: 11/4/2024 12:00:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER   PROCEDURE [dbo].[UpdateAngajatiTaxe]
@impozit_nou real,
@cas_nou real,
@cass_nou real,
@id_nou int
AS
BEGIN
UPDATE Angajati
set
TOTAL_BRUT=SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE,
CAS=TOTAL_BRUT*@cas_nou,
CASS=TOTAL_BRUT*@cass_nou,
BRUT_IMPOZABIL=TOTAL_BRUT-(TOTAL_BRUT*@cas_nou+TOTAL_BRUT*@cass_nou),
IMPOZIT=BRUT_IMPOZABIL*@impozit_nou,

VIRAT_CARD=(SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)-(((SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)-((SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)*@cas_nou+(SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)*@cass_nou))*@impozit_nou)-((SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)*@cas_nou)-((SALAR_BAZA* (1.0+SPOR/100.0) +PREMII_BRUTE)*@cass_nou)

WHERE TAXA_ID=@id_nou

END

