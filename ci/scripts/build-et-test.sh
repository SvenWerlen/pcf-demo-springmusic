#!/bin/bash

set -e

ROOT_FOLDER=$(pwd)
APP_FOLDER=${ROOT_FOLDER}/springmusic
OUT_FOLDER=${ROOT_FOLDER}/springmusic-app
VERSION=$(date +"%Y%m%d%H%M%S")

# Debug
echo ROOT_FOLDER:${ROOT_FOLDER}
echo APP_FOLDER:${APP_FOLDER}
echo OUT_FOLDER:${OUT_FOLDER}
echo VERSION:${VERSION}

# Préparation
mkdir -p ${ROOT_FOLDER}/reports
mkdir -p ${ROOT_FOLDER}/test-results
mkdir -p ${ROOT_FOLDER}/archive

# Build
cd ${APP_FOLDER}
./gradlew build

# Création de l'archive
cp ${APP_FOLDER}/build/libs/spring-music.jar ${APP_FOLDER}/manifest.yml ${ROOT_FOLDER}/archive
tar -C ${ROOT_FOLDER}/archive -czvf ${OUT_FOLDER}/springmusic-app-${VERSION}.tar.gz spring-music.jar manifest.yml

# Nettoyage des fichiers temporaires
rm -rf ${ROOT_FOLDER}/{reports,test-results,archive}

# Afficher md5sum
md5sum ${OUT_FOLDER}/springmusic-app-${VERSION}.tar.gz
