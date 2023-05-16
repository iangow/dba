use "fin_exp.dta", clear
encode ffic48, generate(ffic48factor)
gen aaer_or_hlm = (aaer > 0 | restate_hlm > 0)

## Statistical model #1
probit restate num_exp_aud i.fyear i.ffic48factor, vce(cluster firmid)

## Statistical model #2: 
probit restate_hlm num_exp_aud i.fyear i.ffic48factor, vce(cluster firmid)

## Statistical model #3:
probit aaer num_exp_aud i.fyear i.ffic48factor, vce(cluster firmid)

## Statistical model #4: 
probit aaer_or_hlm num_exp_aud i.fyear i.ffic48factor, vce(cluster firmid)

