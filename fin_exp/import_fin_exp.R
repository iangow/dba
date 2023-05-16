library("haven")
fin_exp <- read_sas("fin_exp/midtermdata.sas7bdat")

# Rename variables
names(fin_exp) <- c("fyear", "ffic12", "dacc_lr", "dacc_dd", "dacc_mj",
                    "dacc_m", "restate", "restate_hlm", "aaer", "ffic48", 
                    "firmid", "num_meet", "num_dir", "num_dir_aud", "num_exp",
                    "num_exp_aud")

# Re-order variables
fin_exp <- fin_exp[, c("firmid", "fyear", "ffic12", "ffic48",
                       "dacc_lr", "dacc_dd", "dacc_mj", "dacc_m",
                       "restate", "restate_hlm", "aaer",
                       "num_meet", "num_dir", "num_dir_aud", 
                       "num_exp", "num_exp_aud")]
library("foreign")
write.dta(fin_exp, "fin_exp/fin_exp.dta")

path_to_stata <- "/Applications/Stata/StataMP.app/Contents/MacOS"

# Use Stata to do some final clean-up
stata_exec <- "stata-mp"
system(paste(file.path(path_to_stata, stata_exec), 
             "-b do fin_exp/import_fin_exp.do" ))
