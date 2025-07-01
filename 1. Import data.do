
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 21/April/2025
 * Latest updated: 01/July/2025
 * Written by:Maggie Qiao
 
clear
cd "Data"

odbc query "DDURAFMEK_YYYYMMDD"

foreach i in ///
dbo_R_DDURAFMEK3808_AdvRQG ///
dbo_R_DDURAFMEK3808_AdvRQG_aeRQG ///
dbo_R_DDURAFMEK3808_Bio ///
dbo_R_DDURAFMEK3808_BioProteins  /// 
dbo_R_DDURAFMEK3808_Biopsy ///
dbo_R_DDURAFMEK3808_Bone ///
dbo_R_DDURAFMEK3808_ConMedRQG /// 
dbo_R_DDURAFMEK3808_ConMedRQG_ConMed /// 
dbo_R_DDURAFMEK3808_CytogenScr /// 
dbo_R_DDURAFMEK3808_Diag ///
dbo_R_DDURAFMEK3808_Disc /// 
dbo_R_DDURAFMEK3808_DrugAdmin ///
dbo_R_DDURAFMEK3808_DrugAdmin_drug2rqg ///
dbo_R_DDURAFMEK3808_DrugAdmin_drug3rqg ///
dbo_R_DDURAFMEK3808_Dth ///
dbo_R_DDURAFMEK3808_DWMRI ///
dbo_R_DDURAFMEK3808_ECG ///
dbo_R_DDURAFMEK3808_Elig ///
dbo_R_DDURAFMEK3808_Eval /// 
dbo_R_DDURAFMEK3808_Ever ///
dbo_R_DDURAFMEK3808_Ever_sda6scharqg ///
dbo_R_DDURAFMEK3808_Ever_sda7schbrqg /// 
dbo_R_DDURAFMEK3808_Gen ///
dbo_R_DDURAFMEK3808_Haem ///
dbo_R_DDURAFMEK3808_Kras /// 
dbo_R_DDURAFMEK3808_MedH ///
dbo_R_DDURAFMEK3808_MUG ///
dbo_R_DDURAFMEK3808_NTL /// 
dbo_R_DDURAFMEK3808_Opth ///
dbo_R_DDURAFMEK3808_PAR2EPKSAM ///
dbo_R_DDURAFMEK3808_Part2DAdmin ///
dbo_R_DDURAFMEK3808_Part2DAdmin_sda4scharqg ///
dbo_R_DDURAFMEK3808_Part2DAdmin_sda5schbrqg ///
dbo_R_DDURAFMEK3808_PART2EADMI ///
dbo_R_DDURAFMEK3808_PART2EADMI_PART2Esda8vsrqg ///
dbo_R_DDURAFMEK3808_PART2EADMI_PARTsda9everrqg ///
dbo_R_DDURAFMEK3808_PD ///
dbo_R_DDURAFMEK3808_Pet ///
dbo_R_DDURAFMEK3808_Phy ///
dbo_R_DDURAFMEK3808_PK ///
dbo_R_DDURAFMEK3808_Preg ///
dbo_R_DDURAFMEK3808_PrSurg ///
dbo_R_DDURAFMEK3808_Rad ///
dbo_R_DDURAFMEK3808_Reg ///
dbo_R_DDURAFMEK3808_SystRQG ///
dbo_R_DDURAFMEK3808_SystRQG_systherRQG ///
dbo_R_DDURAFMEK3808_TL ///
dbo_R_DDURAFMEK3808_TLSC ///
dbo_R_DDURAFMEK3808_Tum ///
dbo_R_DDURAFMEK3808_Uri ///
dbo_R_DDURAFMEK3808_Vit ///
dbo_R_DDURAFMEK3808_Xray {

odbc load, table("`i'") lowercase datestring
cap qui rename usubjid id
cap qui rename dsubjid id
cap qui rename d_usubjid id
cap qui rename x_usubjid id
cap qui rename z_usubjid id
cap qui rename x_ptinits ptinits
cap qui rename x_birthdat birthdat
cap noi tostring id, replace
cap qui sort id
save `i'.dta, replace
clear
}

log close
