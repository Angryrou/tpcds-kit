out=${PWD}/outs
rm -rf $out
mkdir -p $out

list_of_no_space_head=""
sqls=$(seq 101 1100 | tr '\n' ' ')

cd tools
for i in $sqls
do
  qfile="$out/q$i.sql"
  echo "--q$i.sql--" > $qfile
  echo "" >> $qfile

  if [[ " $list_of_no_space_head " =~ .*\ $i\ .* ]]; then
    ./dsqgen \
    -DIRECTORY ../query_templates_sparksql_extend \
    -TEMPLATE T$i.tpl \
    -SCALE 1 \
    -DIALECT spark \
    -FILTER Y \
    -VERBOSE N | sed 's/;//' | sed '/^[[:space:]]*$/d' >> $qfile
  else
    ./dsqgen \
    -DIRECTORY ../query_templates_sparksql_extend \
    -TEMPLATE T$i.tpl \
    -SCALE 1 \
    -DIALECT spark \
    -FILTER Y \
    -VERBOSE N | sed 's/;//' | sed '/^[[:space:]]*$/d' | sed 's/^\([^ ]\)/ \1/' >> $qfile
  fi


  echo "            " >> $qfile

#	diff ../groundtruth_spark_queries_adjusted/q${i}.sql $qfile
done
