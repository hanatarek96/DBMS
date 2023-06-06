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
function tablesMenu {
  echo -e "\n+--------Tables Menu------------+"
  echo "| 1. Show Existing Tables       |"
  echo "| 2. Create New Table           |"
  echo "| 3. Insert Into Table          |"
  echo "| 4. Select From Table          |"
  echo "| 5. Update Table               |"
  echo "| 6. Delete From Table          |"
  echo "| 7. Drop Table                 |"
  echo "| 8. Back To Main Menu          |"
  echo "| 9. Exit                       |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  ls .; tablesMenu ;;
    2)  createTable ;;
    3)  insert;;
    4)  clear; selectMenu ;;
    5)  updateTable;;
    6)  deleteFromTable;;
    7)  dropTable;;
    8) clear; cd ../.. 2>>./.error.log; mainMenu ;;
    9) exit ;;
    *) echo " Wrong Choice " ; tablesMenu;
  esac

}

function selectMenu {
echo -e "\n\n+-----------------Select Menu-------------------+"
echo "| 1. Select All Columns of Table                  |"
echo "| 2. Select Specific Coloumn from Table           |"
echo "| 3. Select from Table under condition            |"
echo "| 4. Aggregate Function for a Specific Column     |"
echo "| 5. Back to Table Menu                           |"
echo "| 6. Back to Main Menu                            |"
echo "| 5. Exit                                         |"
echo "+-------------------------------------------------------+"
echo -e "Enter Your Choice:  \c"
read ch
case $ch in
1) selectAll ;;
2) selectCol ;;
3) clear; selectCon ;;
4) ;;
5) clear; tablesMenu ;;
6) clear; cd ../.. 2>>./.error.log; mainMenu ;;
7) exit ;;
*) echo 'Wrong Choice" ; selectMenu;
esac
}

function selectAll{
echo -e "Enter Table Name:  \c"
read tableName
column -t -s '|' $tableName 2>>./.error.log
if [[ $? != 0 ]]
then
echo "Error Displaying Table $tableName"
fi
selectMenu
}



