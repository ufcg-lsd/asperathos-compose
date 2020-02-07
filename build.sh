#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -b BRANCH [-r] [-l] [-h]"
   echo -e "\t-b BRANCH      Select Branch        The branch you want to clone from (the same branch will be used for all projects). If you use -b with a branch different from the current one the files will be deleted and the new branch will be downloaded"
   echo -e "\t-r             Reset                If you want to reset all of the current asperathos files (both code and config files)"
   echo -e "\t-l             Local Rebuild        If you want to rebuild using the local files. If you use this flag the others will be ignored."
   exit 1
}

DIRECTORY="asperathos-manager"

DEFAULT_BRANCH="stable"

if [ -d "$DIRECTORY" ]; then
    cd asperathos-manager
    CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
    cd ..
fi


while getopts b:rlh option
do
    case "${option}"
    in
        b) BRANCH="$OPTARG" ;;
        r) RESET="true" ;;
        l) LOCAL="true" ;;
        h) HELP="true" ;;
        ?) exit 1
    esac
done


if [ "$HELP" ]
then
    helpFunction
fi


if [ -z "$BRANCH" ]
then
    BRANCH=$DEFAULT_BRANCH
fi


if [[ -z "$LOCAL"  &&  "$RESET" ]] || [[ -z "$LOCAL"  && "$CURRENT_BRANCH" != "$BRANCH" ]]
then
    echo "Deleting existing files"
    rm -rf asperathos-controller/
    rm -rf asperathos-visualizer/
    rm -rf asperathos-manager/
    rm -rf asperathos-monitor/
fi


if [ -z "$LOCAL" ]
then
    echo "Cloning the branch ${BRANCH}..."
    git clone https://github.com/ufcg-lsd/asperathos-controller ./asperathos-controller -b $BRANCH
    git clone https://github.com/ufcg-lsd/asperathos-monitor ./asperathos-monitor -b $BRANCH
    git clone https://github.com/ufcg-lsd/asperathos-manager ./asperathos-manager -b $BRANCH
    git clone https://github.com/ufcg-lsd/asperathos-visualizer ./asperathos-visualizer -b $BRANCH
fi


echo 'Building local images...'
docker build asperathos-controller/ -t asperathos_controller
docker build asperathos-monitor/ -t asperathos_monitor
docker build asperathos-manager/ -t asperathos_manager
docker build asperathos-visualizer/ -t asperathos_visualizer
