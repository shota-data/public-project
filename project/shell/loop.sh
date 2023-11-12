-- ============================
-- source/list.txtを配置して年数を記載すると
-- template1,2として期日ごとにyamlファイルを作成すると
-- 年数ごとにtemplate1,2ファイルが実行されるLOOP処理
-- ============================
declare -x year
declare -x table_name=テーブル名



while ifs= read -r line || [[ -n "${line}" ]]
do  

  echo $year $table_name started.
  
  year=$line
  template_name1="$table_name"_template1.yml.liquid
  template_name2="$table_name"_template2.yml.liquid
  file_name1="$table_name"_"$year"_1.yml.liquid
  file_name2="$table_name"_"$year"_2.yml.liquid
  
  cat $template_name1 | envsubst > $file_name1
  embulk run -b ../../../../bundle $file_name1

  if [ $? -eq 0 ]; then
    mv $file_name1 source/old
  else
    echo "ERROR: $file_name1"
  fi  

  cat $template_name2 | envsubst > $file_name2
  embulk run -b ../../../../bundle $file_name2

  if [ $? -eq 0 ]; then
    mv $file_name2 source/old
  else
    echo "ERROR: $file_name2"
  fi

  echo $year $table_name finished.

  i=`expr $i + 1`

done < source/list.txt

exit 0