{smcl}
{* *! version 1.0.1  25feb2018}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "arcedfold##syntax"}{...}
{viewerjumpto "Description" "arcedfold##description"}{...}
{viewerjumpto "Options" "arcedfold##options"}{...}
{viewerjumpto "Remarks" "arcedfold##remarks"}{...}
{viewerjumpto "Examples" "arcedfold##examples"}{...}
{title:Title}

{phang}
{bf:arcedfold} {hline 2} Create all folders according to the folder structure for ARCED projects.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:arcedfold}
{Folder name}
[{cmd:,} {it:options}]

{p 8 17 2}
{cmdab:arcedsubfold}
{Folder name}
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt p:ath}}path to create folders{p_end}
{synopt:{opt round:s}}space seperated list of rounds, i.e., Baseline Endline{p_end}
{synopt:{opt survey:s}}space seperated list of surveys, i.e., Household School{p_end}
{synopt:{opt f:inal}}to create file list. Not valid for {cmd:arcedsubfold}{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:arcedfold} creates all the folders for a project. This can be used at the very begining of a project, or to archieve files after completing a project.

{pstd}
{cmd:arcedsubfold} can be used to create the dataflow in an existing folder structure. The folder structure must have the same structure as generated by {cmd:arcedfold}.

{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt path} specifies the path where the folders should be created

{phang}
{opt rounds} sepcifies the list of folders to be created inside the 02_DataFlow folder. If {opt surveys} not specified, the dataflow will be created inside each rounds.

{phang}
{opt surveys} sepcifies the list of folders to be created inside each of the rounds folder. If {opt rounds} not specified, the list of folders will be created inside 02_DataWork folder and dataflow will be created inside each surveys.

{phang}
{opt final} sepcifies that the folders already exist and to create the file list.



{phang}
If no round as well as no surveys specified, dataflow will be created inside 02_DataWork folder.

{marker description}{...}
{title:Folder tree}

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


{marker examples}{...}
{title:Examples}

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2023) rounds(01_Pilot 02_Baseline) surveys(Camp Host)}{p_end}

{phang}{cmd:. arcedsubfold project ABC, path(X:\Projects 2023) rounds(02_Baseline) surveys(Schools)}{p_end}

{phang}{cmd:. arcedsubfold project ABC, path(X:\Projects 2023) rounds(03_Endline) surveys(Camp Host Schools)}{p_end}


{phang}**# Generate a list of all files and export in an excel file

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2017) final}{p_end}

{marker author}{...}
{title:Author}

{pstd}{browse "https://arced.foundation/mehrab-ali": Mehrab Ali}{p_end}
{pstd}{browse "http://www.arced.foundation": ARCED Foundation}{p_end}
{pstd}For questions or suggestions e-mail at mehrab.ali@arced.foundation.{p_end}
