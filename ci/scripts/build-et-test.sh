#!/bin/bash

set -e

ROOT_FOLDER=$(pwd)
VERSION=$(date +"%Y%m%d%H%M%S")

# Préparation
mkdir -p ${ROOT_FOLDER}/reports
mkdir -p ${ROOT_FOLDER}/test-results
mkdir -p ${ROOT_FOLDER}/archive

# Build
./gradlew build

# Création de l'archive
cp ${ROOT_FOLDER}/build/libs/spring-music.jar ${ROOT_FOLDER}/manifest.yml ${ROOT_FOLDER}/archive
tar -C ${ROOT_FOLDER}/archive -czvf ${ROOT_FOLDER}/springmusic-app-${VERSION}.tar.gz spring-music.jar manifest.yml

# Nettoyage des fichiers temporaires
rm -rf ${ROOT_FOLDER}/{reports,test-results,archive}
