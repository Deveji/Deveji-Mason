# !bin/bash
if [[ $CONFIGURATION =~ ^([^\[]*) ]]; then
environment=$(echo ${BASH_REMATCH[1]} | sed 's/ *$//')
fi

# Replace spaces and brackets in the path
CORRECT_DWARF_DSYM_FOLDER_PATH=$(echo $DWARF_DSYM_FOLDER_PATH | sed -e 's/ /\ /g' -e 's/\[/\[/g' -e 's/\]/\]/g')

echo "Environment: $environment"
echo "DWARF DSYM Folder Path: $DWARF_DSYM_FOLDER_PATH"
echo "Correct DWARF DSYM Folder Path: $CORRECT_DWARF_DSYM_FOLDER_PATH"
echo "DWARF DSYM File Name: $DWARF_DSYM_FILE_NAME"

# Name and path of the resource we're copying
GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist
GOOGLESERVICE_INFO_FILE=${PROJECT_DIR}/Config/${environment}/${GOOGLESERVICE_INFO_PLIST}

echo "Google Service Plist location: $GOOGLESERVICE_INFO_FILE"

$PODS_ROOT/FirebaseCrashlytics/upload-symbols -gsp $GOOGLESERVICE_INFO_FILE -p ios "${CORRECT_DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"