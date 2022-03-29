## Overview

arcedfold is a Stata command that creates specific folder structures for ARCED's projects.


## Installation
```stata
* arcedfold can be installed from github

net install arcedfold, all replace ///
	from("https://raw.githubusercontent.com/ARCED-Foundation/arcedfold/path")
```


## Syntax
<pre>
arcedfold <b><i>string</i></b>, [options]
</pre>

Write desired folder name in place of **_string_**.

### Folder tree
```
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

```

## Options
<pre>
<b>path</b> specifies the path where the folders should be created

<b>start</b> specifies to create all the folders. If the folders already exist, this will ask whether to delete the existing folders and create new one. 
Pressing q will delete existing folders and create new folder. Entering BREAK will stop executing the command. 
start can be combined with files and ipacheck.

<b>final</b> sepcifies that the folders already exist and to create the file list.

<b>files</b> downloads do file templates in the Do files folder and the ipacheck HFC templates in the HFC folder. files can be combined with start and ipacheck.

<b>ipacheck</b> downloads ipacheck command from IPA github url. ipacheck can be combined with start and files.
</pre>
 
## Example Syntax
```stata
arcedfold project ABC, path(X:\Projects 2017) start

arcedfold project ABC, path(X:\Projects 2017) ipacheck start files

arcedfold project ABC, path(X:\Projects 2017) files

arcedfold project ABC, path(X:\Projects 2017) final
```
## Author
Mehrab Ali


Please report all bugs/feature request to the <a href="https://github.com/ARCED-Foundation/arcedfold/issues" target="_blank"> github issues page</a>

