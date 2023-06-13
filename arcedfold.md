<style>
    * {
      font-family: "Gill Sans", sans-serif;
    }
</style>

<pre>
<b><u>Title</u></b>
<p>
    <b>arcedfold</b> -- Create all folders according to the folder structure for ARCED projects. <b>arcedfold</b> uses <a href="https://www.veracrypt.fr/en/Home.html"> veracrypt </a> for folder encryption. Download <a href="https://www.veracrypt.fr/en/Downloads.html"> veracrypt </a> and install in your computer if you want to use encryption as part of your dataflow. You also need to download and install <a href="https://docs.surveycto.com/05-exporting-and-publishing-data/02-exporting-data-with-surveycto-desktop/01.using-desktop.html"> SurveyCTO Desktop </a> for manual data download, if you opt for it.
<p>
<p>
<a name="syntax"></a><b><u>Syntax</u></b>
<p>
        <b>arcedfold</b> {Folder name} [<b>,</b> <i>options</i>]
<p>
        <b>arcedsubfold</b> {Folder name} [<b>,</b> <i>options</i>]
<p>
    <i>options</i>               Description
    -------------------------------------------------------------------------
    Main
      <b><u>p</u></b><b>ath</b>                path to create folders
      <b><u>round</u></b><b>s</b>              space seperated list of rounds, i.e., Baseline
                            Endline
      <b><u>survey</u></b><b>s</b>             space seperated list of surveys, i.e., Household
                            School
      <b><u>f</u></b><b>inal</b>               to create file list. Not valid for <b>arcedsubfold</b>
    -------------------------------------------------------------------------
<p>
<p>
<a name="description"></a><b><u>Description</u></b>
<p>
    <b>arcedfold</b> creates all the folders for a project. This can be used at the
    very begining of a project, or to archieve files after completing a
    project.
<p>
    <b>arcedsubfold</b> can be used to create the dataflow in an existing folder
    structure. The folder structure must have the same structure as generated
    by <b>arcedfold</b>.
<p>
<a name="options"></a><b><u>Options</u></b>

    <b>path</b> specifies the path where the folders should be created
<p>
    <b>rounds</b> sepcifies the list of folders to be created inside the 02_DataWork
        folder. If <b>surveys</b> not specified, the dataflow will be created inside
        each rounds.
<p>
    <b>surveys</b> sepcifies the list of folders to be created inside each of the
        rounds folder. If <b>rounds</b> not specified, the list of folders will be
        created inside 02_DataWork folder and dataflow will be created inside
        each surveys.
<p>
    <b>final</b> sepcifies that the folders already exist and to create the file
        list.
<p>
<p>
<a name="description"></a><b><u>Folder tree</u></b>
<p>
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
<p>
<p>
<a name="examples"></a><b><u>Examples</u></b>
<p>
    <b>. arcedfold project ABC, path(X:\Projects 2023) rounds(01_Pilot</b>
        <b>02_Baseline) surveys(Camp Host)</b>
<p>
    <b>. arcedsubfold project ABC, path(X:\Projects 2023) rounds(02_Baseline)</b>
        <b>surveys(Schools)</b>
<p>
    <b>. arcedsubfold project ABC, path(X:\Projects 2023) rounds(03_Endline)</b>
        <b>surveys(Camp Host Schools)</b>
<p>
<p>
    **# Generate a list of all files and export in an excel file
<p>
    <b>. arcedfold project ABC, path(X:\Projects 2017) final</b>
<p>
<a name="author"></a><b><u>Author</u></b>
<p>
    Mehrab Ali
    ARCED Foundation
    For questions or suggestions e-mail at mehrab.ali@arced.foundation.
</pre>