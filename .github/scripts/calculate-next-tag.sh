#!/bin/bash

VERSION_MAJOR_MINOR="0.1"
git fetch --tags origin
VERSION_PATCH=$(git tag --list "${VERSION_MAJOR_MINOR}.*" --sort=-version:refname | head -n 1 | grep -oE '[0-9]+$')

echo "Current version patch: $VERSION_PATCH"

if [ -z "$VERSION_PATCH" ]; then
    VERSION_PATCH=0
else
    VERSION_PATCH=$((VERSION_PATCH + 1))
fi
NEW_TAG="${VERSION_MAJOR_MINOR}.${VERSION_PATCH}"

echo "Generated new tag: $NEW_TAG"
echo "NEW_TAG=$NEW_TAG" >> $GITHUB_ENV
echo "NEW_TAG=$NEW_TAG" >> $GITHUB_OUTPUT
