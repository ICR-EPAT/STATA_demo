
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 28/01/2025
 * Written by: Xiaoran Lai

clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
dbo_R_DDURAFMEK3808_AdvRQG ///
dbo_R_DDURAFMEK3808_AdvRQG_aeRQG ///
dbo_R_DDURAFMEK3808_Bio ///
dbo_R_DDURAFMEK3808_ConMedRQG ///
dbo_R_DDURAFMEK3808_Disc ///
dbo_R_DDURAFMEK3808_DrugAdmin ///
dbo_R_DDURAFMEK3808_ECG ///
dbo_R_DDURAFMEK3808_Gen ///
dbo_R_DDURAFMEK3808_Haem {
    odbc load, table("`i'") lowercase datestring
    // Standardize subject ID variable names across all tables
    cap qui rename usubjid id
    cap qui rename dsubjid id
    cap qui rename d_usubjid id      // New variant found in recent data
    cap qui rename x_usubjid id      // New variant found in recent data
    cap qui rename z_usubjid id      // New variant found in recent data
    cap noi tostring id, replace     // Ensure consistent string format
    cap qui sort id                  // Sort for consistent ordering
    save `i'.dta, replace
    clear
}
log close