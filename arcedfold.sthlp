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

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt p:ath}}path to create folders{p_end}
{synopt:{opt s:tart}}to start creating all the folders from fresh{p_end}
{synopt:{opt f:inal}}to create file list{p_end}
{synopt:{opt files}}to download do files and templates{p_end}
{synopt:{opt ipacheck}}to install ipacheck HFC package{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:arcedfold} creates all the folders for a project. This can be used at the very begining of a project, or to archieve files after completing a project.


				░░░░░░░░▄▄▄███░░░░░░░░░░░░░░░░░░░░
				░░░▄▄██████████░░░░░░░░░░░░░░░░░░░
				░███████████████░░░░░░░░░░░░░░░░░░
				░▀███████████████░░░░░▄▄▄░░░░░░░░░
				░░░███████████████▄███▀▀▀░░░░░░░░░
				░░░░███████████████▄▄░░░░░░░░░░░░░
				░░░░▄████████▀▀▄▄▄▄▄░▀░░░░░░░░░░░░
				▄███████▀█▄▀█▄░░█░▀▀▀░█░░▄▄░░░░░░░
				▀▀░░░██▄█▄░░▀█░░▄███████▄█▀░░░▄░░░
				░░░░░█░█▀▄▄▀▄▀░█▀▀▀█▀▄▄▀░░░░░░▄░▄█
				░░░░░█░█░░▀▀▄▄█▀░█▀▀░░█░░░░░░░▀██░
				░░░░░▀█▄░░░░░░░░░░░░░▄▀░░░░░░▄██░░
				░░░░░░▀█▄▄░░░░░░░░▄▄█░░░░░░▄▀░░█░░
				░░░░░░░░░▀███▀▀████▄██▄▄░░▄▀░░░░░░
				░░░░░░░░░░░█▄▀██▀██▀▄█▄░▀▀░░░░░░░░
				░░░░░░░░░░░██░▀█▄█░█▀░▀▄░░░░░░░░░░
				░░░░░░░░░░█░█▄░░▀█▄▄▄░░█░░░░░░░░░░
				░░░░░░░░░░█▀██▀▀▀▀░█▄░░░░░░░░░░░░░
				░░░░░░░░░░░░▀░░░░░░░░░░░▀░░░░░░░░░
                                           Like a sir!

{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt path} specifies the path where the folders should be created

{phang}
{opt start} specifies to create all the folders. If the folders already exist, this will ask whether to delete the existing folders and create new one. 
Pressing {cmd:q} will delete existing folders and create new folder. Entering {cmd:BREAK} will stop executing the command. {cmd:start} can be combined with {opt files} and {opt ipacheck}.

{phang}
{opt final} sepcifies that the folders already exist and to create the file list.

{phang}
{opt files} downloads do file templates in the Do files folder and the ipacheck HFC templates in the HFC folder. {cmd:files} can be combined with {cmd:start} and {cmd:ipacheck}.

{phang}
{opt ipacheck} downloads ipacheck command from IPA github url. {cmd:ipacheck} can be combined with {cmd:start} and {cmd:files}.



{marker description}{...}
{title:Folder tree}

Admin
  |-- Contracts
  |-- Emails
  |-- Finance
  |-- Grant
	|-- Grant application
	|-- Grant reports
  |-- IRB
  |-- Logistic
  |-- Pictures
  |-- Project Documents
  |-- Proposal
  
Analysis
  |-- Presentations
  |-- Report
    |-- Feedback
  |-- Tables and figures
  
Fieldwork
  |-- Data
	|-- BC
	|-- Data
	  |-- clean
	  |-- raw
	|-- Do files
	|-- HFC
	|-- Logs
  |-- Field documents
  |-- Tools
    |-- Questionnaires
	|-- SurveyCTO files


{marker examples}{...}
{title:Examples}

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2017) start}{p_end}

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2017) ipacheck start files}{p_end}

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2017) files}{p_end}

{phang}{cmd:. arcedfold project ABC, path(X:\Projects 2017) final}{p_end}

{marker author}{...}
{title:Author}

{pstd}Mehrab Ali{p_end}
{pstd}For questions or suggestions e-mail at mehrabbabu@gmail.com.{p_end}
