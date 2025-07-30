
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 25/02/2025
 * Written by: Xiaoran Lai

clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
dm ///           // Demographics (baseline)
vs ///           // Vital Signs (baseline)
lb ///           // Laboratory (baseline)
ae ///           // Adverse Events (safety)
ex ///           // Exposure (safety)
{
    odbc load, table("`i'") lowercase datestring
    
    // Standardize subject identifiers
    cap qui rename usubjid id
    cap qui rename dsubjid id
    cap qui rename d_usubjid id
    cap qui rename x_usubjid id
    cap qui rename z_usubjid id
    
    // Handle patient identifiers for data transfer compliance
    cap qui rename x_ptinits ptinits              // Standardize patient initials
    cap qui rename x_birthdat birthdat            // Standardize birth date variable
    cap qui rename age age_years                  // Age in years with units
    
    // Additional variable renaming examples
    cap qui rename sex gender                     // Gender/sex standardization
    cap qui rename armcd treatment_arm            // Treatment arm code
    cap qui rename vsstresn vs_result_numeric     // Vital signs numeric result
    cap qui rename lbstresn lab_result_numeric    // Lab numeric result
    cap qui rename aeterm ae_term                 // AE preferred term
    cap qui rename aesev ae_severity              // AE severity
    cap qui rename exstdt ex_start_date           // Exposure start date
    cap qui rename exdose ex_dose                 // Exposure dose
    
    cap noi tostring id, replace
    cap qui sort id
    save `i'.dta, replace
    clear
}
log close