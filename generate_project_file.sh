#!/bin/bash

# script to run the RuleGroupFileCreator java program
#
# the program will read the business rules and actions from the given database
# for the given project and validity date and create a project zip file. This zip
# file can then be used with the business rules engine to execute the business
# logic against a set of data.
#
#
# last update: uwe.geercken@web.de - 2018-06-30

# check if all required arguments have been specified by the user
# or check if the first argument was "--help" and give out the
# list of arguments to help the user.
#
if [[ "$#" -ne 3 || "$1" == "--help" ]]; then
        echo "Run RuleGroupFileCreator java program to generate a project ZIP file from the Business Rules Maintenance Tool database"
        echo "Usage: $0 [argument 1] [argument 2] [argument 3]"
        echo
        echo "   [argument 1]: specify the name of the project from the Business Rules Maintenance Tool."
        echo "   [argument 2]: specify the output folder where to generate the project zip file.."
        echo "   [argument 2]: specify the validity date for which to generate the project file."
        echo
        exit 1
fi

# folder from where the script is started
current_folder=$(pwd)

# folder in which the script is located
script_folder=$(dirname $0)

# log folder
log_folder=${script_folder}/logs

# logfile name
logfile_name="generate_project_files.log"

# jar libraries folder
lib_folder=${script_folder}/lib

# folder for temporary files for the program
tempfolder=${script_folder}/temp

# folder for backup of project files
backupfolder=${script_folder}/backup

# folder where the velocity templates are located
templatefolder=${script_folder}/templates

# details for the database of the Business Rules Maintenance Tool
databaseserver=<hostname or IP)
databaseport=<port>
databasename=<database name>
databaseuser=<userid>
databaseuserpassword=<user password>

# environment that the data is generated from
# possible: dev or prod
environment=prod

# arguments passed to the program
projectname="${1}"
outputfolder="${2}"
validitydate="${3}"


echo "$(date '+%Y%m%d%k%M%S')"
echo "$(date '+%Y%m%d%k%M%S') - generating project zip file for project: ${projectname}, with validity date: ${validitydate}"
echo "$(date '+%Y%m%d%k%M%S') - output to folder: ${outputfolder}"

echo "" >> ${log_folder}/${logfile_name}

# run the program to generate the project zip file
java -Dname=RuleGroupFileCreator -cp .:"${lib_folder}/*" com.datamelt.util.RuleGroupFileCreator -n="${projectname}" -p="${templatefolder}" -o="${outputfolder}" -y="${tempfolder}" -v="${validitydate}" -s="${databaseserver}" -r="${databaseport}" -b="${databasename}" -u="${databaseuser}" -w="${databaseuserpassword}" -e="${environment}" -l="${backupfolder}" >> ${log_folder}/${logfile_name}


