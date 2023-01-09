#!/bin/sh
mod="Mktr_Tracker"
m=$(echo $mod | tr '[:upper:]' '[:lower:]')
rep=$(echo $mod | sed -e "s/_/\//g")
master=${mod%_*}

start ()
{
  echo "Please use sh mktr/mktr.sh install"
  echo "or sh mktr/mktr.sh uninstall"
}

install ()
{
    echo "Creating Directory for Mktr"
    mkdir -p ../app/code/community/${rep}
    echo "Copy Files Mktr"

    cp -rf mktr/app/etc/modules/${mod}.xml app/etc/modules/${mod}.xml
    cp -rf mktr/app/code/community/${rep} app/code/community/${master}
    cp -rf mktr/app/design/frontend/base/default/layout/${m}.xml app/design/frontend/base/default/layout/${m}.xml
    read -p "Almost Done, Press enter to continue " responce
}

uninstall ()
{
    read -r -p "Are you sure? [Y/n]" response
    response=$(echo $response | tr '[:upper:]' '[:lower:]')
    if [ "${response}" = "y" ]; then
        rm -rf app/code/community/${rep}
        rm -rf app/etc/modules/${mod}.xml
        rm -rf app/design/frontend/base/default/layout/${m}.xml
    fi    
}

if [ -z "$1" ]; then
    start
else
    $1
fi