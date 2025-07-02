
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 21/01/2025
 * Written by:Maggie Qiao

clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
dbo_R_DDURAFMEK3808_AdvRQG ///
dbo_R_DDURAFMEK3808_Bio ///
dbo_R_DDURAFMEK3808_Disc ///
dbo_R_DDURAFMEK3808_DrugAdmin ///
dbo_R_DDURAFMEK3808_Gen {
    odbc load, table("`i'") lowercase datestring
    cap qui rename usubjid id
    cap qui rename dsubjid id
    save `i'.dta, replace
    clear
}
log close