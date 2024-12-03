#!/bin/bash


# One pre-requisite this file should be present in Springboot folder i.e maven build folder from where we want to run this script .. 

generate_artifact(){
    mvn package
}

upload_artificat_toLocal(){
    mvn install
}

static_code_analysis(){
  choice=$1
  case $choice in 
  checkstyle)
  mvn checkstyle:checkstyle
  ;;
  findbug)
  mvn findbug:check
  ;;
  pmd)
  mvn pmd:pmd
  ;;
  *)
  echo "invalid choice"
  ;;
  esac
}

test(){
    mvn test
}

deploy(){
    sudo cp Spring3HibernateApp.war /var/lib/tomcat9/webapps
}


while getopts ":ais:t:d" opt; do
  case ${opt} in
    a)
      generate_artifact 
      ;;
    i)
      upload_artificat_toLocal
      ;;
    s)
      static_code_analysis $OPSTARG
    ;;
    t)
      test $OPSTARG
    ;;
    d)
    deploy
    ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done
