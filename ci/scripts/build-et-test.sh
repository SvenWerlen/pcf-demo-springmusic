#!/bin/bash

set -e

ROOT_FOLDER=$(pwd)/pcf-demo-springmusic
VERSION=$(date +"%Y%m%d%H%M%S")
echo ROOT_FOLDER:${ROOT_FOLDER}
echo VERSION:${VERSION}

# Préparation
mkdir -p ${ROOT_FOLDER}/reports
mkdir -p ${ROOT_FOLDER}/test-results
mkdir -p ${ROOT_FOLDER}/archive

# Build
cd ${ROOT_FOLDER}
./gradlew build

# Création de l'archive
cp ${ROOT_FOLDER}/build/libs/spring-music.jar ${ROOT_FOLDER}/manifest.yml ${ROOT_FOLDER}/archive
tar -C ${ROOT_FOLDER}/archive -czvf ${ROOT_FOLDER}/springmusic-app-${VERSION}.tar.gz spring-music.jar manifest.yml

# Nettoyage des fichiers temporaires
rm -rf ${ROOT_FOLDER}/{reports,test-results,archive}
