## Overview

<b>arcedfold</b> is a Stata command that creates specific folder structures for ARCED's projects.

## Versions
##### Current version
V3: April 2023 [GitHub repo](https://github.com/ARCED-Foundation/arcedfold/tree/V3)

##### Previous versions
V2: November 2022 [GitHub repo](https://github.com/ARCED-Foundation/arcedfold/tree/V2)
V1: April 2018


## Installation
```stata
* arcedfold can be installed from github

net install arcedfold, all replace ///
	from("https://raw.githubusercontent.com/ARCED-Foundation/arcedfold/V3")

help arcedfold
```

## Syntax
arcedfold <b><i>string</i></b>, [options]

Write desired folder name in place of **_string_**.

### Folder tree
```
01_Admin
  |-- 01_Management
	|-- 01_Design
	|-- 02_Project_log
	|-- 03_Gantt_Chart
	|-- 04_Hiring_and_Onboarding
  |-- 02_Funding
	|-- 01_Proposal
	|-- 02_Agreement
	|-- 03_Reporting
	|-- 04_Invoice
	|-- 05_Deliverables
  |-- 03_Budget
  |-- 04_IRB
	|-- 01_Applications
	|-- 02_Amendments
	|-- 03_Approvals
	|-- 04_Certificates
  |-- 05_Communications
	|-- 01_Letters_and_Permissions
	|-- 02_Email
	|-- 03_Reports_and_Presentations
	|-- 04_Outreach 
02_DataFlow
  |-- Round
	|-- Survey
		|-- 01_Instruments
			|-- 01_Paper
			|-- 02_XLSForm
				|-- 01_Attachments
		|-- 02_Codes
			|-- 01_Ado
		|-- 03_Data
			|-- 01_Samples
			|-- 02_Raw
			|-- 03_Corrections
			|-- 04_Intermediate
			|-- 05_Clean
		|-- 04_Output
			|-- 01_Logs
			|-- 02_Checks
			|-- 03_Analysis
				|-- 01_Table
				|-- 02_Figure
				|-- 03_Illustration
				|-- 04_Report
				|-- 05_Presenatation			
03_FieldWork
  |-- Round
	|-- Survey
		|-- 01_Protocol_and_Manual
		|-- 02_Field_Materials
		|-- 03_Training_Materials
		|-- 04_Field_Team_Hiring
```

## Options

<b>path</b> specifies the path where the folders should be created
<p>
    <b>rounds</b> sepcifies the list of folders to be created inside the 02_DataWork
        folder. If <b>surveys</b> not specified, the dataflow will be created inside each rounds.
<p>
    <b>surveys</b> sepcifies the list of folders to be created inside each of the
        rounds folder. If <b>rounds</b> not specified, the list of folders will be
        created inside 02_DataFlow folder and dataflow will be created inside
        each surveys.
<p>
    <b>final</b> sepcifies that the folders already exist and to create the file
        list.

## Example Syntax
```stata
arcedfold project ABC, path(X:\Projects 2023) rounds(01_Pilot 02_Baseline) surveys(Camp Host)
arcedsubfold project ABC, path(X:\Projects 2023) rounds(02_Baseline) surveys(Schools)
arcedsubfold project ABC, path(X:\Projects 2023) rounds(03_Endline) surveys(Camp Host Schools)

**# Generate a list of all files and export in an excel file
arcedfold project ABC, path(X:\Projects 2017) final
```

## Author
<a href="https://arced.foundation/mehrab-ali" target="_blank">Mehrab Ali</a>

<a href="https://arced.foundation" target="_blank">ARCED Foundation</a>

Please report all bugs/feature request to the <a href="https://github.com/ARCED-Foundation/arcedfold/issues" target="_blank"> github issues page</a>

