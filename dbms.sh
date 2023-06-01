mkdir DBMS 2>> ./.error.log
clear
echo "Welcome To DBMS"
echo -e "\nAUTHOR\n\tWritten by: Habiba Ahmed & Hana Tarek & Nada Karim & Moatasem Ashmawy.\n"
function mainMenu {
  echo -e "\n+---------Main Menu-------------+"
  echo "| 1. Select DB                  |"
  echo "| 2. Create DB                  |"
  echo "| 3. Rename DB                  |"
  echo "| 4. Drop DB                    |"
  echo "| 5. Show DBs                   |"
  echo "| 6. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  selectDB ;;
    2)  createDB ;;
    3)  renameDB ;;
    4)  dropDB ;;
    5)  ls ./DBMS ; mainMenu;;
    6) exit ;;
    *) echo " Wrong Choice " ; mainMenu;
  esac
}
function selectDB {
  echo -e "Enter Database Name: \c"
  read dbName
  cd ./DBMS/$dbName 2>>./.error.log
  if [[ $? == 0 ]]; then
    echo "Database $dbName was Successfully Selected"
    # insert tablesMenu
  else
    echo "Database $dbName wasn't found"
    mainMenu
  fi
}

function createDB {
  echo -e "Enter Database Name: \c"
  read dbName
  mkdir ./DBMS/$dbName
  if [[ $? == 0 ]]
  then
    echo "Database Created Successfully"
  else
    echo "Error Creating Database $dbName"
  fi
  mainMenu
}
function renameDB {
  echo -e "Enter Current Database Name: \c"
  read dbName
  echo -e "Enter New Database Name: \c"
  read newName
  mv ./DBMS/$dbName ./DBMS/$newName 2>>./.error.log
  if [[ $? == 0 ]]; then
    echo "Database Renamed Successfully"
  else
    echo "Error Renaming Database"
  fi
  mainMenu
}

function dropDB {
  echo -e "Enter Database Name: \c"
  read dbName
  rm -r ./DBMS/$dbName 2>>./.error.log
  if [[ $? == 0 ]]; then
    echo "Database Dropped Successfully"
  else
    echo "Database Not found"
  fi
  mainMenu
}
