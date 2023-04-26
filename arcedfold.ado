*! version 3.0.0 Mehrab Ali 20april2023

cap prog drop arcedfold
program  arcedfold
	
	version 12
	

**# Define syntax                                                            
*-------------------------------------------------------------------------------
	
	#d ;
	syntax [anything],
	[ROUNDs(string)]
	[SURVEYs(string)]
	[Final]
	Path(string)
	;
	#d cr

	

**# Check options                                                            
*-------------------------------------------------------------------------------
	
	if mi("`final'") {

		mata : st_numscalar("Confirmed", direxists("`path'/`anything'"))

		if scalar(Confirmed) == 0 {
			mkdir "`path'/`anything'"
		}	
		
		else {
			di as err "The `anything' folder already exists at `path'."
			exit 693
		}
	
	if mi("`rounds'") & mi("`surveys'") {
		di as err "Specify at least one round or survey."
		exit 198
	}
	

		**# Layer 1
		*-----------------------------------------------------------------------
		
			mkdir "`path'/`anything'/01_Admin"
			mkdir "`path'/`anything'/02_DataFlow"
			mkdir "`path'/`anything'/03_FieldWork"

			
				
		**# Layer 2
		*-----------------------------------------------------------------------
		
			* 01_Admin
			
			mkdir "`path'/`anything'/01_Admin/01_Management"
				mkdir "`path'/`anything'/01_Admin/01_Management/01_Design"
				mkdir "`path'/`anything'/01_Admin/01_Management/02_Project_log"
				mkdir "`path'/`anything'/01_Admin/01_Management/03_Gantt_Chart"
				mkdir "`path'/`anything'/01_Admin/01_Management/04_Hiring_and_Onboarding"
				
						
			mkdir "`path'/`anything'/01_Admin/02_Funding"
				mkdir "`path'/`anything'/01_Admin/02_Funding/01_Proposal"
				mkdir "`path'/`anything'/01_Admin/02_Funding/02_Agreement"
				mkdir "`path'/`anything'/01_Admin/02_Funding/03_Reporting"
				mkdir "`path'/`anything'/01_Admin/02_Funding/04_Invoice"
				mkdir "`path'/`anything'/01_Admin/02_Funding/05_Deliverables"
				
			mkdir "`path'/`anything'/01_Admin/03_Budget"
			
					
			mkdir "`path'/`anything'/01_Admin/04_IRB"
				mkdir "`path'/`anything'/01_Admin/04_IRB/01_Applications"
				mkdir "`path'/`anything'/01_Admin/04_IRB/02_Amendments"
				mkdir "`path'/`anything'/01_Admin/04_IRB/03_Approvals"
				mkdir "`path'/`anything'/01_Admin/04_IRB/04_Certificates"
			
						
			mkdir "`path'/`anything'/01_Admin/05_Communications"
				mkdir "`path'/`anything'/01_Admin/05_Communications/01_Letters_and_Permissions"
				mkdir "`path'/`anything'/01_Admin/05_Communications/02_Email"
				mkdir "`path'/`anything'/01_Admin/05_Communications/03_Reports_and_Presentations"
				mkdir "`path'/`anything'/01_Admin/05_Communications/04_Outreach"
				
						
			
			* 02_Dataflow
				
				if !mi("`rounds'") & !mi("`surveys'") {
					foreach round of loc rounds {
						* For each rounds 
						cap	mkdir "`path'/`anything'/02_DataFlow/`round'"
						if _rc {
							di as err "Could not create `round' folder in 02_DataFlow. Check if the `round' folder already exists."
							exit 693
						}
						
						* For each surveys 
						foreach survey of loc surveys {
							cap mkdir "`path'/`anything'/02_DataFlow/`round'/`survey'"
							if _rc {
								di as err "Could not create `survey' folder in 02_DataFlow. Check if the `survey' folder already exists."
								exit 693
							}
							create_dataflow, datapath("`path'/`anything'/02_DataFlow/`round'/`survey'")
						}
					}
				}
				
				
				if !mi("`rounds'") & mi("`surveys'") {
					foreach round of loc rounds {
						cap	mkdir "`path'/`anything'/02_DataFlow/`round'"
						if _rc {
							di as err "Could not create `round' folder in 02_DataFlow. Check if the `round' folder already exists."
							exit 693
						}
						create_dataflow, datapath("`path'/`anything'/02_DataFlow/`round'")
					}					
				}
				
				if mi("`rounds'") & !mi("`surveys'") {
					foreach survey of loc surveys {
						cap	mkdir "`path'/`anything'/02_DataFlow/`survey'"
						if _rc {
							di as err "Could not create `survey' folder in 02_DataFlow. Check if the `survey' folder already exists."
							exit 693
						}
						create_dataflow, datapath("`path'/`anything'/02_DataFlow/`survey'")
					}					
				}
				
				
			
			* 03_FieldWork

				if !mi("`rounds'") & !mi("`surveys'") {
					foreach round of loc rounds {
						* For each rounds 
						cap	mkdir "`path'/`anything'/03_FieldWork/`round'"
						if _rc {
							di as err "Could not create `round' folder in 03_FieldWork. Check if the `round' folder already exists."
							exit 693
						}
						
						* For each surveys 
						foreach survey of loc surveys {
							cap mkdir "`path'/`anything'/03_FieldWork/`round'/`survey'"
							if _rc {
								di as err "Could not create `survey' folder in 03_FieldWork. Check if the `survey' folder already exists."
								exit 693
							}
							create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`round'/`survey'")
						}
					}
				}
				
				
				if !mi("`rounds'") & mi("`surveys'") {
					foreach round of loc rounds {
						cap	mkdir "`path'/`anything'/03_FieldWork/`round'"
						if _rc {
							di as err "Could not create `round' folder in 03_FieldWork. Check if the `round' folder already exists."
							exit 693
						}
						create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`round'")
					}					
				}
				
				if mi("`rounds'") & !mi("`surveys'") {
					foreach survey of loc surveys {
						cap	mkdir "`path'/`anything'/03_FieldWork/`survey'"
						if _rc {
							di as err "Could not create `survey' folder in 03_FieldWork. Check if the `survey' folder already exists."
							exit 693
						}
						create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`survey'")
					}					
				}
				

		noi di `"All the folders are created. To browse click here: {browse "`path'/`anything'": `anything'}"'

	}




	else if ("`final'" != "") {
		qui snapshot save
		tempfile all_files
		dirlist, fromdir("`path'/`anything'") save("`all_files'") replace
		qui export excel "`path'/`anything'/All files_`=c(current_date)'.xlsx", replace firstrow(var)
		n di as input `"Save complete! The file list is saved here: {browse "`path'/`anything'/All files_`=c(current_date)'.xlsx":All files_`=c(current_date)'}"'
		qui snapshot restore `=r(snapshot)'
		qui snapshot erase `=r(snapshot)'
	}



end



**# arcedsubfold
*-------------------------------------------------------------------------------

cap prog drop arcedsubfold
program  arcedsubfold
	version 12
		

	**# Define syntax                                                            
	*-------------------------------------------------------------------------------
		
		#d ;
		syntax [anything],
		[ROUNDs(string)]
		[SURVEYs(string)]
		Path(string)
		;
		#d cr
	
	if mi("`rounds'") & mi("`surveys'") {
		di as err "Specify at least one round or survey."
		exit 198
	}
	
	* 02_Dataflow
				
				if !mi("`rounds'") & !mi("`surveys'") {
					foreach round of loc rounds {
						
						* For all rounds
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/02_Dataflow/`round'"))

						if scalar(Confirmed) == 0 {
							di as input "The `round' folder does not exist. Creating `round' folder."
							mkdir "`path'/`anything'/02_Dataflow/`round'"
						}	
						
						else {
							di as input "The `round' folder already exists. Not creating `round' folder."
						}
						
						* For each surveys 
						foreach survey of loc surveys {
							cap mkdir "`path'/`anything'/02_DataFlow/`round'/`survey'"
							if _rc {
								di as err "Could not create `survey' folder in 02_DataFlow/`round'. Check if the `survey' folder already exists."
								exit 693
							}
							create_dataflow, datapath("`path'/`anything'/02_DataFlow/`round'/`survey'")
						}
					}
				}
				
				
				if !mi("`rounds'") & mi("`surveys'") {
					foreach round of loc rounds {
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/02_Dataflow/`round'"))

						if scalar(Confirmed) == 0 {
							di as input "The `round' folder does not exist in 02_DataFlow. Creating `round' folder."
							mkdir "`path'/`anything'/02_Dataflow/`round'"
						}	
						
						else {
							di as input "The `round' folder already exists in 02_DataFlow. Not creating `round' folder."
						}
						create_dataflow, datapath("`path'/`anything'/02_DataFlow/`round'")
					}					
				}
				
				
				if mi("`rounds'") & !mi("`surveys'") {
					foreach survey of loc surveys {
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/02_Dataflow/`survey'"))

						if scalar(Confirmed) == 0 {
							di as input "The `survey' folder does not exist in 02_DataFlow. Creating `survey' folder."
							mkdir "`path'/`anything'/02_Dataflow/`survey'"
						}	
						
						else {
							di as input "The `survey' folder already exists in 02_DataFlow. Not creating `survey' folder."
						}
						create_dataflow, datapath("`path'/`anything'/02_DataFlow/`survey'")
					}					
				}
				
				
			
			* 03_FieldWork

				if !mi("`rounds'") & !mi("`surveys'") {
					foreach round of loc rounds {
						
						* For all rounds
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/03_FieldWork/`round'"))

						if scalar(Confirmed) == 0 {
							di as input "The `round' folder does not exist in 03_FieldWork. Creating `round' folder."
							mkdir "`path'/`anything'/03_FieldWork/`round'"
						}	
						
						else {
							di as input "The `round' folder already exists in 03_FieldWork. Not creating `round' folder."
						}
						
						* For each surveys 
						foreach survey of loc surveys {
							cap mkdir "`path'/`anything'/03_FieldWork/`round'/`survey'"
							if _rc {
								di as err "Could not create `survey' folder in 03_FieldWork/`round'. Check if the `survey' folder already exists."
								exit 693
							}
							create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`round'/`survey'")
						}
					}
				}
				
				
				if !mi("`rounds'") & mi("`surveys'") {
					foreach round of loc rounds {
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/03_FieldWork/`round'"))

						if scalar(Confirmed) == 0 {
							di as input "The `round' folder does not exist in 03_FieldWork. Creating `round' folder."
							mkdir "`path'/`anything'/03_FieldWork/`round'"
						}	
						
						else {
							di as input "The `round' folder already exists in 03_FieldWork. Not creating `round' folder."
						}
						create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`round'")
					}					
				}
				
				
				if mi("`rounds'") & !mi("`surveys'") {
					foreach survey of loc surveys {
						mata : st_numscalar("Confirmed", direxists("`path'/`anything'/03_FieldWork/`survey'"))

						if scalar(Confirmed) == 0 {
							di as input "The `survey' folder does not exist in 03_FieldWork. Creating `survey' folder."
							mkdir "`path'/`anything'/03_FieldWork/`survey'"
						}	
						
						else {
							di as input "The `survey' folder already exists in 03_FieldWork. Not creating `survey' folder."
						}
						create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/`survey'")
					}					
				}
				

		noi di `"All the folders are created. To browse click here: {browse "`path'/`anything'": `anything'}"'

	
	
end	
	
**# Program for dataflow
*-------------------------------------------------------------------------------

cap program drop create_dataflow			
prog create_dataflow
	syntax, datapath(string)


** Instrument

	mkdir "`datapath'/01_Instruments"
		mkdir "`datapath'/01_Instruments/01_Paper"
		mkdir "`datapath'/01_Instruments/02_XLSForm"
		mkdir "`datapath'/01_Instruments/02_XLSForm/01_Attachments"
		
	

** Codes

	mkdir "`datapath'/02_Codes"
		mkdir "`datapath'/02_Codes/01_Ado"
		
		
** Data
	
	mkdir "`datapath'/03_Data"
		mkdir "`datapath'/03_Data/01_Samples"
		mkdir "`datapath'/03_Data/02_Raw"
		mkdir "`datapath'/03_Data/03_Corrections"
		mkdir "`datapath'/03_Data/04_Intermediate"
		mkdir "`datapath'/03_Data/05_Clean"
	
	
** Output
	
	mkdir "`datapath'/04_Output"
		mkdir "`datapath'/04_Output/01_Logs"
		mkdir "`datapath'/04_Output/02_Checks"
		mkdir "`datapath'/04_Output/03_Analysis"
			mkdir "`datapath'/04_Output/03_Analysis/01_Table"
			mkdir "`datapath'/04_Output/03_Analysis/02_Figure"
			mkdir "`datapath'/04_Output/03_Analysis/03_Illustration"
			mkdir "`datapath'/04_Output/03_Analysis/04_Report"
			mkdir "`datapath'/04_Output/03_Analysis/05_Presenatation"
end 



**# Program for fieldwork
*-------------------------------------------------------------------------------

cap program drop create_fieldwork			
prog create_fieldwork
	syntax, fieldpath(string)

	
	mkdir "`fieldpath'/01_Protocol_and_Manual"
	mkdir "`fieldpath'/02_Field_Materials"
	mkdir "`fieldpath'/03_Training_Materials"
	mkdir "`fieldpath'/04_Field_Team_Hiring"


end 



**# Program for directory list
*-------------------------------------------------------------------------------


	/*----------------------------------------------------------------------------------------	
		Author: Morten Andersen, University of Southern Denmark
		Support: email mandersen@health.sdu.dk
		Distribution-Date: 20050404
		
		----------------------------------------------------------------------------
		(type -ssc install dirlist- to install)

		----------------------------------------------------------------------------
		Morten Andersen, MD, PhD               Research Unit for General Practice
		Senior Researcher                      University of Southern Denmark
		Phone   +45 6550 3791                  J.B. Winsloews Vej 9
		Fax     +45 6311 1642                  DK-5000 Odense C
		E-mail  mandersen@health.sdu.dk        Denmark
		----------------------------------------------------------------------------
		
	-----------------------------------------------------------------------------------------*/
	
cap program drop dirlist
program  dirlist

  syntax , fromdir(string) save(string) ///
    [pattern(string) replace append]

  // get files in "`fromdir'" using pattern
  if "`pattern'" == "" local pattern "*"
  local flist: dir "`fromdir'" files "`pattern'"

  qui {

    // initialize dataset to usep
    if "`append'" != "" use "`save'", clear
    else {
      clear
      gen fname = ""
	  gen directory = ""
    }

    // add files to the dataset
    local i = _N
    foreach f of local flist {
      set obs `++i'
      replace fname = "`f'" in `i'
	  replace directory = "`fromdir'" in `i'
    }
    save "`save'", `replace'

  }

  // recursively list directories in "`fromdir'"
  local dlist: dir "`fromdir'" dirs "*"
  foreach d of local dlist {
    dirlist , fromdir("`fromdir'/`d'") save(`save') ///
    pattern("`pattern'") append replace
  }

end	
