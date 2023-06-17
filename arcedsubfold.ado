*! version 3.0.0 Mehrab Ali 20april2023

cap prog drop arcedsubfold
program  arcedsubfold
	version 9
		

	**# Define syntax                                                            
	*-------------------------------------------------------------------------------
		
		#d ;
		syntax [anything],
		[ROUNDs(string)]
		[SURVEYs(string)]
		Path(string)
		;
		#d cr

**# Check if arceddataflow installed
*-------------------------------------------------------------------------------

	cap which arceddataflow
	if _rc net install arceddataflow, all replace ///
			from("https://raw.githubusercontent.com/ARCED-Foundation/arceddataflow/master")
			
**# Check options                                                            
*-------------------------------------------------------------------------------
		
	if mi("`rounds'") & mi("`surveys'") {
		di as err "Specify at least one round or survey."
		exit 198
	}
	
	* 02_Dataflow
		
		if mi("`rounds'") & mi("`surveys'") {
			create_dataflow, datapath("`path'/`anything'/02_DataFlow/")
		}
				
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
		
		if mi("`rounds'") & mi("`surveys'") {
			create_fieldwork, fieldpath("`path'/`anything'/03_FieldWork/")
		}
				
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
			
			
** Do files 
	n arceddataflow, do("`datapath'/02_Codes") correction("`datapath'/03_Data/03_Corrections")
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



