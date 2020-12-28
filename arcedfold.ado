*! version 1.0.1 Mehrab Ali 22april2018

program  arcedfold
	/* This creates folder structure for arced */
	version 13
	

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
mkdir "`path'\\`anything'\Admin"
mkdir "`path'\\`anything'\Fieldwork"
mkdir "`path'\\`anything'\Analysis"


*** Layer 2
* Admin folder
mkdir "`path'\\`anything'\Admin\Proposal"
mkdir "`path'\\`anything'\Admin\Grant"
	mkdir "`path'\\`anything'\Admin\Grant\Grant application"
	mkdir "`path'\\`anything'\Admin\Grant\Grant reports"
mkdir "`path'\\`anything'\Admin\Logistic"
mkdir "`path'\\`anything'\Admin\Project Documents"
mkdir "`path'\\`anything'\Admin\IRB"
mkdir "`path'\\`anything'\Admin\Contracts"
mkdir "`path'\\`anything'\Admin\Finance"
mkdir "`path'\\`anything'\Admin\Pictures"
mkdir "`path'\\`anything'\Admin\Emails"

* Fieldwork
mkdir "`path'\\`anything'\Fieldwork\Data"
	mkdir "`path'\\`anything'\Fieldwork\Data\Data"
		mkdir "`path'\\`anything'\Fieldwork\Data\Data\clean"
		mkdir "`path'\\`anything'\Fieldwork\Data\Data\raw"
		
	mkdir "`path'\\`anything'\Fieldwork\Data\BC"
	mkdir "`path'\\`anything'\Fieldwork\Data\Do files"
	mkdir "`path'\\`anything'\Fieldwork\Data\HFC"
	mkdir "`path'\\`anything'\Fieldwork\Data\Logs"

mkdir "`path'\\`anything'\Fieldwork\Field documents"
mkdir "`path'\\`anything'\Fieldwork\Tools"
	mkdir "`path'\\`anything'\Fieldwork\Tools\Questionnaires"
	mkdir "`path'\\`anything'\Fieldwork\Tools\SurveyCTO files"


* Analysis
mkdir "`path'\\`anything'\Analysis\Report"	
	mkdir "`path'\\`anything'\Analysis\Report\Feedback"
mkdir "`path'\\`anything'\Analysis\Presentations"
mkdir "`path'\\`anything'\Analysis\Tables and figures"	

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
