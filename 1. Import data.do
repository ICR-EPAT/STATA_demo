
 * Trial: RAFMEK
 * Purpose: Import data to Stata for data transfer
 * Date written: 16/01/2025
 * Updated: 25/02/2025
 * Written by: Xiaoran Lai

clear
cd "data/RAFMEK"
odbc query "DDURAFMEK_20250115"
foreach i in ///
[... same table list ...]
{
    odbc load, table("`i'") lowercase datestring
    cap qui rename usubjid id
    cap qui rename dsubjid id
    cap qui rename d_usubjid id
    cap qui rename x_usubjid id
    cap qui rename z_usubjid id
    // Handle patient identifiers for data transfer compliance
    cap qui rename x_ptinits ptinits    // Standardize patient initials
    cap qui rename x_birthdat birthdat  // Standardize birth date variable
    cap qui rename age age(years)       // Add units to age variable
    cap noi tostring id, replace
    cap qui sort id
    save `i'.dta, replace
    clear
}
log close