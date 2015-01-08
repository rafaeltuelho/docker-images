#!/bin/bash

JBOSS_HOME="/opt/jboss-eap-6.3"
PATCH_DIR="/tmp/software/patch"
PATCH_NAME_PATTERN="jboss-eap-*patch*.zip"

if [ -d "$PATCH_DIR" ]; then 

   #ensure get the most recent
   PATCH_FILE=$(find $PATCH_DIR -type f -name $PATCH_NAME_PATTERN | sort -nr | head -1)

   if [ -f "$PATCH_FILE" ] && [ -s "$PATCH_FILE" ] && [ -r "$PATCH_FILE" ]; then
       echo "the $PATCH_FILE will be applied to this installation" 
       $JBOSS_HOME/bin/jboss-cli.sh --user=admin --password=jboss@eap6! --controller=localhost "patch apply $PATCH_FILE" 
   else
      echo "no valid JBoss EAP patch found!"
   fi
  
fi

