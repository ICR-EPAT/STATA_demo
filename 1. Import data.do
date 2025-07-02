
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 22/01/2025
 * Written by: Xiaoran Lai
clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
dbo_R_DDURAFMEK3808_AdvRQG ///
dbo_R_DDURAFMEK3808_AdvRQG_aeRQG ///  // Added for AE analysis
dbo_R_DDURAFMEK3808_Bio ///
dbo_R_DDURAFMEK3808_ConMedRQG ///      // Added for conmed analysis
dbo_R_DDURAFMEK3808_Disc ///
dbo_R_DDURAFMEK3808_DrugAdmin ///
dbo_R_DDURAFMEK3808_ECG ///            // Added for cardiac safety
dbo_R_DDURAFMEK3808_Gen ///
dbo_R_DDURAFMEK3808_Haem {            // Added for lab safety
    odbc load, table("`i'") lowercase datestring
    cap qui rename usubjid id
    cap qui rename dsubjid id
    save `i'.dta, replace
    clear
}
log close