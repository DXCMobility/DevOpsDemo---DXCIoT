#!/bin/bash

cd C:\

DATE=$(date +%m%d%y)
TIMESTAMP=$(date +%s)

DATE_TIMESTAMP=${DATE}_${TIMESTAMP}

PROJECT_NAME="DXCIoT"

PROJECT_DIR=${PROJECT_NAME}"_"${DATE_TIMESTAMP}

cd ${TOMCAT_BUILD_DIR}/${PROJECT_NAME}
mkdir -v -- ${PROJECT_DIR}

cd ${JENKINS_WORKSPACE}/${PROJECT_NAME}/app/build/outputs/apk

for f in *.apk
do 
   cp -v "$f" ${TOMCAT_BUILD_DIR}/${PROJECT_NAME}/${PROJECT_DIR}/"${f%.apk}"_${DATE_TIMESTAMP}.apk
done

read -t300 -n1 -r -p "Press any key to exit..."
