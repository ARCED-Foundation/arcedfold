*! version 1.0.1 Mehrab Ali 22april2018

program  arcedfold
	/* This creates folder structure for arced */
	version 12
	

*  ----------------------------------------------------------------------------
*  1. Define syntax                                                            
*  ----------------------------------------------------------------------------
	
	#d ;
	syntax [anything],
	[Start] [files] [ipacheck]
	[Final]
	Path(string)
	;
	#d cr

	

	
if ("`final'"=="`start'") | ("`final'"!="" & "`start'"!="")  {
	di as error "Please specificy option"
	di as text "start - Specify start if you want to start creating all the folders from the begining. Can be combined with files and ipacheck."
	di as text "final - Specify final if you already created all the folders and placed necessary files insdie, and now want to create the instruction files. Cannot be combined with any other options."
	di as text "files - Specify files if you want to copy the dofiles"
	di as text "ipacheck - Specify ipacheck if you want to download ipacheck package from IPA github."
	}


	
else if ("`start'" != "") {

pause on

//qui ssc install confirmdir, replace 

mata : st_numscalar("Confirmed", direxists("`path'\\`anything'"))

if  scalar(Confirmed) == 0 {
	mkdir "`path'\\`anything'"
	}
	else {
	di as input "The `anything' folder already exists at `path'. Press q to overwrite and start from begining. Write and Enter BREAK to discontinue."
	pause
	
	! rmdir "`path'\\`anything'" /s /q
	mkdir "`path'\\`anything'"
	
	}
	


*** Layer 1
	mkdir "`path'\\`anything'\01_Admin"
	mkdir "`path'\\`anything'\02_Resources"
	mkdir "`path'\\`anything'\03_Consolidation"
	mkdir "`path'\\`anything'\04_Execution"
	mkdir "`path'\\`anything'\05_Documentation"	
	
		
*** Layer 2
	mkdir "`path'\\`anything'\01_Admin\01_Agreement"
		mkdir "`path'\\`anything'\01_Admin\01_Agreement\01_Client"
	mkdir "`path'\\`anything'\01_Admin\02_Contract"
	mkdir "`path'\\`anything'\01_Admin\03_Finance"
		mkdir "`path'\\`anything'\01_Admin\03_Finance\01_Invoice"
		mkdir "`path'\\`anything'\01_Admin\03_Finance\02_Requisition"
		mkdir "`path'\\`anything'\01_Admin\03_Finance\03_Bill"
	mkdir "`path'\\`anything'\01_Admin\04_Budget"	
		mkdir "`path'\\`anything'\01_Admin\04_Budget\01_Proposed"
		mkdir "`path'\\`anything'\01_Admin\04_Budget\02_Report"


	mkdir "`path'\\`anything'\02_Resources\01_Instruments"
		mkdir "`path'\\`anything'\02_Resources\01_Instruments\01_Paper"
		mkdir "`path'\\`anything'\02_Resources\01_Instruments\02_XLSForm"
			mkdir "`path'\\`anything'\02_Resources\01_Instruments\02_XLSForm\01_Attachments"
		mkdir "`path'\\`anything'\02_Resources\01_Instruments\03_Print"
	mkdir "`path'\\`anything'\02_Resources\02_Program"
		mkdir "`path'\\`anything'\02_Resources\02_Program\01_Ado"
		mkdir "`path'\\`anything'\02_Resources\02_Program\02_Codes"
	mkdir "`path'\\`anything'\02_Resources\03_Data"
		mkdir "`path'\\`anything'\02_Resources\03_Data\01_Pilot"
		mkdir "`path'\\`anything'\02_Resources\03_Data\02_Sample"
		mkdir "`path'\\`anything'\02_Resources\03_Data\03_Raw"
		mkdir "`path'\\`anything'\02_Resources\03_Data\04_Checks"	
			mkdir "`path'\\`anything'\02_Resources\03_Data\04_Checks\01_Inputs"
			mkdir "`path'\\`anything'\02_Resources\03_Data\04_Checks\02_Outputs"
		mkdir "`path'\\`anything'\02_Resources\03_Data\05_Corrections"
		mkdir "`path'\\`anything'\02_Resources\03_Data\06_Clean"
		mkdir "`path'\\`anything'\02_Resources\03_Data\07_Media"
		mkdir "`path'\\`anything'\02_Resources\03_Data\08_Log"


	mkdir "`path'\\`anything'\03_Consolidation\01_Working Data"
		mkdir "`path'\\`anything'\03_Consolidation\01_Working Data\01_Log"
		mkdir "`path'\\`anything'\03_Consolidation\01_Working Data\02_PI data"
	mkdir "`path'\\`anything'\03_Consolidation\02_Program"
		mkdir "`path'\\`anything'\03_Consolidation\02_Program\01_Ado File"
		mkdir "`path'\\`anything'\03_Consolidation\02_Program\02_Do File"
	mkdir "`path'\\`anything'\03_Consolidation\03_Analysis"	
		mkdir "`path'\\`anything'\03_Consolidation\03_Analysis\01_Table"
		mkdir "`path'\\`anything'\03_Consolidation\03_Analysis\02_Figure"
		mkdir "`path'\\`anything'\03_Consolidation\03_Analysis\03_Illustration"
		mkdir "`path'\\`anything'\03_Consolidation\03_Analysis\04_Report"
		mkdir "`path'\\`anything'\03_Consolidation\03_Analysis\05_Presenatation"

		
	mkdir "`path'\\`anything'\04_Execution\01_Gantt Chart"
	mkdir "`path'\\`anything'\04_Execution\02_Meeting Minutes"
	mkdir "`path'\\`anything'\04_Execution\03_Project Log"
	mkdir "`path'\\`anything'\04_Execution\04_Hiring and Onboarding"
	mkdir "`path'\\`anything'\04_Execution\05_Protocol and Manual"
	mkdir "`path'\\`anything'\04_Execution\06_Field Materials"
	mkdir "`path'\\`anything'\04_Execution\07_Training Materials"


	mkdir "`path'\\`anything'\05_Documentation\01_Proposal"
	mkdir "`path'\\`anything'\05_Documentation\02_Onboarding documents"
	mkdir "`path'\\`anything'\05_Documentation\03_Inception"
	mkdir "`path'\\`anything'\05_Documentation\04_Design"
	mkdir "`path'\\`anything'\05_Documentation\05_IRB"
		mkdir "`path'\\`anything'\05_Documentation\05_IRB\01_Applications"
		mkdir "`path'\\`anything'\05_Documentation\05_IRB\02_Amendments"
		mkdir "`path'\\`anything'\05_Documentation\05_IRB\03_Approvals"
		mkdir "`path'\\`anything'\05_Documentation\05_IRB\04_Certificates"
	mkdir "`path'\\`anything'\05_Documentation\06_Letters and Permissions"
	mkdir "`path'\\`anything'\05_Documentation\07_Reports"
	mkdir "`path'\\`anything'\05_Documentation\08_Email"
	mkdir "`path'\\`anything'\05_Documentation\09_Outreach"
	mkdir "`path'\\`anything'\05_Documentation\10_Deliverables"
		

noi di `"All the folders are created. To browse click here: {browse "`path'\\`anything'": `anything'}"'


}

if ("`ipacheck'" != "") {
	* Check and install ipacheck
		/*qui capture which ipacheck
 		if _rc==111 {
		di "ipacheck is not installed in your machine. Installing ipacheck..."
		*/
		qui capture net install ipacheck, ///
		from("https://raw.githubusercontent.com/PovertyAction/high-frequency-checks/master/ado") ///
		replace 
		
		if _rc==601 {
		di "Please check your internet. ipacheck cannot be installed."
		}
		else {
		di "ipacheck installation finished."
		}
	
}	

if ("`files'" != "") {
	* Copy the dofiles
	qui copy "https://raw.githubusercontent.com/PovertyAction/high-frequency-checks/master/master_check.do" "`path'\\`anything'\Fieldwork\Data\Do files\4_hfc.do", replace
	qui copy "https://raw.githubusercontent.com/PovertyAction/high-frequency-checks/master/xlsx/hfc_inputs.xlsm" "`path'\\`anything'\Fieldwork\Data\HFC\hfc_inputs.xlsm", replace
	qui copy "https://raw.githubusercontent.com/PovertyAction/high-frequency-checks/master/xlsx/hfc_replacements.xlsm" "`path'\\`anything'\Fieldwork\Data\HFC\hfc_replacements.xlsm", replace
	
	cd "`path'\\`anything'\Fieldwork\Data\Do files"
	net get ipafolder, from("http://codes.mehrabali.info") replace
	copy "`path'\\`anything'\Fieldwork\Data\Do files\bc.dta" "`path'\\`anything'\Fieldwork\Data\BC\bc.dta", replace
	rm "`path'\\`anything'\Fieldwork\Data\Do files\bc.dta"

	* Updating HFC do file
cap file close myfile
file open myfile using "`path'\\`anything'\Fieldwork\Data\Do files\4_hfc.do", write read
file seek myfile 699
file write myfile "ipacheckimport using "_char(34)_char(36)"HFC/hfc_inputs.xlsm"_char(34) _skip(20)
file close myfile

	
	* Updating Main do file
cap file close myfile
file open myfile using "`path'\\`anything'\Fieldwork\Data\Do files\1_main.do", write read


file write myfile "/* Name: Master do file" _n
file write myfile "Description: This do file has been created using -ipafolder- command. This do file merges and prepares the data files." _n
file write myfile "Project: `anything'" _n
file write myfile "Date created: `c(current_date)'" _n
file write myfile "Author: Mehrab Ali" _n
file write myfile "Contact: mali@poverty-action.org " _n
file write myfile "*/" _n(2)

file write myfile "clear all" _n
file write myfile "set more off" _n
file write myfile "cap log close" _n
file write myfile "set maxvar 12000" _n(3)


file write myfile "* SETUPS" _n

file write myfile "gl user " _char(34) "`path'\\`anything'" _char(34) " // User folder path"  _n 

file write myfile "gl identity " _char(34) _char(36) "user\Fieldwork" _char(34)  _n
file write myfile "gl rawdata "_char(34)"rawdata.dta"_char(34) "  // Change the data file name to the dta file that SurveyCTO do file generates" _n
file write myfile "gl newdata "_char(34)"newdata.dta"_char(34) "  // Change the data file name to the file name you want to save as" _n
file write myfile "gl startdate "_char(34)"20jan2018"_char(34) "  // Start day of survey before which all data should be deleted " _n
file write myfile "local surveydo "_char(34)"surveydo.do"_char(34)"  // Do file name downloaded from SurveyCTO for the data" _n
file write myfile "local bcdo "_char(34)"bcdo.do"_char(34)"  // Do file name downloaded from SurveyCTO for the backcheck data" _n(2)

file write myfile "local data=0   // Change this to 1 if new data downloaded" _n(4)



file write myfile "* Other globals" _n
file write myfile "gl user "  _char(34)  _char(36) "identity\Data" _char(34) _n
file write myfile "gl raw "  _char(34) _char(36) "user\Data\raw" _char(34) _n
file write myfile "gl clean "  _char(34) _char(36) "user\Data\clean" _char(34)  _n
file write myfile "gl dofiles "  _char(34) _char(36) "user\Do files" _char(34)  _n
file write myfile "gl logs "  _char(34) _char(36) "user\Logs" _char(34)  _n
file write myfile "gl HFC "  _char(34) _char(36) "user\HFC" _char(34)  _n
file write myfile "local date: dis %td_NN_DD_CCYY date(c(current_date), " _char(34) "DMY" _char(34) ")" _n
file write myfile "gl date_string = subinstr(trim( "_char(34) _char(96) "date"_char(39)  _char(34) "), "  _char(34) _char(32) _char(34)   " , " _char(34) "_" _char(34) ", .)" _n(2)

file write myfile "log using " _char(34) _char(36) "logs\master_" _char(36) "date_string" _char(34) ", replace" _n


file write myfile "if " _char(96) "data" _char(39) "==1 {" _n
	file write myfile "	cd " _char(34) _char(36) "raw" _char(34)  _n
	file write myfile "	do " _char(34) _char(36) "dofiles\" _char(96) "surveydo" _char(39) ".do" _char(34) _n
	file write myfile "	do " _char(34) _char(36) "dofiles\" _char(96) "bcdo" _char(36) ".do" _char(34) _n
	file write myfile "}" _n(2)

file write myfile "do " _char(34) _char(36) "dofiles\2_data.do" _char(34) "  // Prepare data" _n(2)

file write myfile "do " _char(34) _char(36) "dofiles\3_backcheck_assignement.do" _char(34) "  // Assign backcheck" _n(2)

file write myfile "do " _char(34) _char(36) "dofiles\4_hfc.do" _char(34) "   // Run HFC" _n(2)

file write myfile "do " _char(34) _char(36) "dofiles\5_additional_hfc.do" _char(34) "  // Additional HFC and Backcheck report" _n(2)



file close myfile


	
}	


else if ("`final'" != "") {
	dirlist, fromdir("`path'\\`anything'") save("`path'\\`anything'\temp.dta") replace
	export excel "`path'\\`anything'\All files.xlsx", replace firstrow(var)
	erase "`path'\\`anything'\temp.dta"
	display `"Save complete! The file list is saved here:  {browse "`path'\\`anything'\All files.xlsx": All files}"'
	clear
}



end


//cap program drop dirlist
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
    dirlist , fromdir("`fromdir'\\`d'") save(`save') ///
    pattern("`pattern'") append replace
  }

end	
