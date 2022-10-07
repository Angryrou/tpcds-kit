out=${PWD}/outs
rm -rf $out
mkdir -p $out

list_of_no_space_head=""
sqls="1 2 3 4 5 6 7 8 9 10 11 12 13 14a 14b 15 16 17 18 19 20 21 22 23a 23b 24a 24b 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39a 39b 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99"

cd tools
for i in $sqls
do
  qfile="$out/q$i.sql"
  echo "--q$i.sql--" > $qfile
  echo "" >> $qfile

  if [[ " $list_of_no_space_head " =~ .*\ $i\ .* ]]; then
    ./dsqgen \
    -DIRECTORY ../query_templates_sparksql \
    -TEMPLATE query$i.tpl \
    -SCALE 1 \
    -DIALECT spark \
    -FILTER Y \
    -VERBOSE N | sed 's/;//' | sed '/^[[:space:]]*$/d' >> $qfile
  else
    ./dsqgen \
    -DIRECTORY ../query_templates_sparksql \
    -TEMPLATE query$i.tpl \
    -SCALE 1 \
    -DIALECT spark \
    -FILTER Y \
    -VERBOSE N | sed 's/;//' | sed '/^[[:space:]]*$/d' | sed 's/^\([^ ]\)/ \1/' >> $qfile
  fi


  echo "            " >> $qfile

	diff ../groundtruth_spark_queries_adjusted/q${i}.sql $qfile
done

