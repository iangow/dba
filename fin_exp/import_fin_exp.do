use "fin_exp/fin_exp.dta"
label variable firmid "Unique firm identifier"
label variable fyear "Fiscal year"
label variable ffic12 "Fama-French 12-industry group"
label variable ffic48 "Fama-French 48-industry group"
label variable aaer 	"Indicates that an SEC AAER found accounting fraud or misrepresentation occurred at the firm during the year"
label variable restate	"Indicates financial results for that year were restated"
label variable restate_hlm "Indicates that financial results for that year were restated due to fraud, misrepresentation, or investigation by SEC or PCAOB"
label variable dacc_mj "Discretionary accruals from the modified-Jones (1991) model"
label variable dacc_dd  "Discretionary accruals from Dechow-Dichev (2002) model"
label variable dacc_m  "Discretionary accruals from the McNichols (2002) model"
label variable dacc_lr "Discretionary accruals from the Larcker-Richardson (2004) model"
label variable num_meet "Number of board meetings during year"
label variable num_dir "Number of directors on the board"
label variable num_dir_aud "Number of directors on the audit committee"
label variable num_exp   "Number of financial experts on the board"
label variable num_exp_aud "Number of financial experts on the audit committee"
saveold "~/git/dba/fin_exp/fin_exp.dta", replace