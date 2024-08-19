#!/bin/bash

BRANCH_NAME=$(echo $GITHUB_REF | sed 's/refs\/heads\///')
# calculate and kubernetes namespace name from branch name
NAMESPACE_NAME=$(echo $BRANCH_NAME | tr '[:upper:]' '[:lower:]' | tr -d -c 'a-z0-9-')
# trim to 63 characters
NAMESPACE_NAME=$(echo $NAMESPACE_NAME | cut -c 1-63)

echo "NAMESPACE_NAME=$NAMESPACE_NAME"
echo "NAMESPACE_NAME=$NAMESPACE_NAME" >> $GITHUB_ENV
echo "NAMESPACE_NAME=$NAMESPACE_NAME" >> $GITHUB_OUTPUT