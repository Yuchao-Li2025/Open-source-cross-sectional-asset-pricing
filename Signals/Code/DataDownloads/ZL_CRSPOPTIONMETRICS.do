* SAS 3. CRSP-OPTION METRICS linking files -----------------------------------------------
import delimited "$pathDataPrep/oclink.csv", clear varnames(1)
keep if score <= 2  // WHICH LINKS DO WE WANT TO KEEP?
bysort permno (score): keep if _n == 1  // If link to more than one permno, keep the best match
* rename ticker tickerIBES
keep secid permno
save "$pathDataIntermediate/OPTIONMETRICSCRSPLinkingTable", replace
