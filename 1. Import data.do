
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 15/02/2025
 * Written by: Xiaoran Lai

clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
dbo_R_DDURAFMEK3808_AdvRQG ///
dbo_R_DDURAFMEK3808_AdvRQG_aeRQG ///
dbo_R_DDURAFMEK3808_Bio ///
dbo_R_DDURAFMEK3808_BioProteins ///   // NEW: Protein biomarkers per amendment
dbo_R_DDURAFMEK3808_Biopsy ///        // NEW: Tumor biopsy analysis
dbo_R_DDURAFMEK3808_ConMedRQG ///
dbo_R_DDURAFMEK3808_Disc ///
dbo_R_DDURAFMEK3808_DrugAdmin ///
dbo_R_DDURAFMEK3808_ECG ///
dbo_R_DDURAFMEK3808_Gen ///
dbo_R_DDURAFMEK3808_Haem ///
dbo_R_DDURAFMEK3808_Kras {           // NEW: KRAS mutation status
    odbc load, table("`i'") lowercase datestring
    cap qui rename usubjid id
    cap qui rename dsubjid id
    cap qui rename d_usubjid id
    cap qui rename x_usubjid id
    cap qui rename z_usubjid id
    cap noi tostring id, replace
    cap qui sort id
    save `i'.dta, replace
    clear
}
log close