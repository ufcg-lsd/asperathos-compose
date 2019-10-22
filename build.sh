#!/bin/bash

DIRECTORY="manager/asperathos-manager"

DEFAULT_BRANCH="stable"
BRANCH=-1
if [ -d "$DIRECTORY" ]; then
    cd manager/asperathos-manager
    CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
    cd ../..
    FOLDER_EXIST="true"
fi


while getopts brlh option
do
    case "${option}"
    in
        r) RESET="true" ;;
        l) LOCAL="true" ;;
        h) HELP="true" ;;
    esac
done
shift $((OPTIND-1))

helpFunction()
{
   echo ""
   echo "Usage: $0 -b BRANCH [-r] [-l] [-h]"
   echo -e "\t-b BRANCH   Select Branch - The branch you want to clone from (the same branch will be used for all projects). If you use -b with a branch different from the current one the files will be reseted and the new branch will be downloaded"
   echo -e "\t-r                  Reset - If you want to reset the current asperathos files"
   echo -e "\t-l          Local Rebuild - If you want to rebuild using the local files. If you use this flag the other's will be ignored."
   exit 1
}
echo "$@"
if [ $1 ] && [ $1 == '-b' ]
then
    echo "WOW"
fi

if [ "$HELP" ]
then
    helpFunction
fi


if [ "$BRANCH" -eq -1 ]
then
    BRANCH=$DEFAULT_BRANCH
fi


if [[ -z "$LOCAL"  &&  "$RESET" ]] || [[ -z "$LOCAL"  && "$CURRENT_BRANCH" != "$BRANCH" ]]
then
    if [[ "$FOLDER_EXIST" ]]
    then
        echo "Deleting existing files"
        rm -rf controller/asperathos-controller/
        rm -rf visualizer/asperathos-visualizer/
        rm -rf manager/asperathos-manager/
        rm -rf monitor/asperathos-monitor/
    else 
        echo "You tried to reset but there are no files"
fi
fi




if [ -z "$LOCAL" ]
then
    echo "Cloning the branch ${BRANCH}"
    # git clone https://github.com/ufcg-lsd/asperathos-controller ./controller/asperathos-controller -b $BRANCH
    # git clone https://github.com/ufcg-lsd/asperathos-monitor ./monitor/asperathos-monitor -b $BRANCH
    # git clone https://github.com/ufcg-lsd/asperathos-manager ./manager/asperathos-manager -b $BRANCH
    # git clone https://github.com/ufcg-lsd/asperathos-visualizer ./visualizer/asperathos-visualizer -b $BRANCH
fi

echo 'Building local images'
# docker build controller/ -t asperathos_controller
# docker build monitor/ -t asperathos_monitor
# docker build manager/ -t asperathos_manager
# docker build visualizer/ -t asperathos_visualizer
