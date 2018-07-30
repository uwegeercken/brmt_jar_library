# brmt_jar_library
Java classes used by the Business Rules Maintenance Tool.

Can be used to generate project zip files from code/scripts.

Pass following arguments to the RuleGroupFileCreator class:

    - the project name (argument: -n)
    - the environment (argument: -e) for which to generate the project file (dev or prod)
    - a backup folder to store backup copied of files (argument: -l)
    - a template folder where the Apache Velocity templates are located (argument: -p)
    - an output folder to store the generated project file(s) (argument: -o)
    - a temporary folder used by the program to store data (argument: -y)
    - a validity date to use with the project; groups of rules have a date (from-to) when they are valid (argument: -v)
    - the details of the database where the rules are stored: hostname/ip, server port, database name, userid and user password. (arguments: -s, -r, -b, -u, -w)

Project name, environment and backup folder are optional. If no project name is provided, project files for all projects are created. If no environment is specified, then the default "prod" is used. If no backfolder is specified, then the given output folder is used for backup copies of existing files.

Example:

java -cp .:"${lib_folder}/*" com.datamelt.util.RuleGroupFileCreator -n="Project 1" -p=/home/user/templates -o=/home/user/testoutput -y=/home/user/temp -v=2018-07-01 -s=localhost -r=3306 -b=ruleengine_rules -u=tom -w=mysecret -e=dev -l=/home/user/testoutput/backup

    Copyright (C) 2008-2018  Uwe Geercken

 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.


uwe geercken
uwe.geercken@web.de

last update: 2018-07-30

