sqls="q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14a q14b q15 q16 q17 q18 q19 q20 q21 q22 q23a q23b q24a q24b q25 q26 q27 q28 q29 q30 q31 q32 q33 q34 q35 q36 q37 q38 q39a q39b q40 q41 q42 q43 q44 q45 q46 q47 q48 q49 q50 q51 q52 q53 q54 q55 q56 q57 q58 q59 q60 q61 q62 q63 q64 q65 q66 q67 q68 q69 q70 q71 q72 q73 q74 q75 q76 q77 q78 q79 q80 q81 q82 q83 q84 q85 q86 q87 q88 q89 q90 q91 q92 q93 q94 q95 q96 q97 q98 q99 ss_max ss_maxb"

for q in $sqls
do
  cat $q.sql | sed 's/LIMIT/limit/' | sed 's/ AS/ as/' | sed 's/ AS / as /' | sed 's/WITH/with/' | sed 's/SELECT/select/' | sed 's/UNION ALL/union all/' \
  | sed 's/GROUP BY/group by/' | sed 's/FROM/from/' | sed 's/ORDER BY/order by/' | sed 's/WHERE/where/' | sed 's/AND/and/' | sed 's/AND/and/g' \
  | sed 's/INTERSECT/intersect/' | sed 's/ IN/ in/' | sed 's/LEFT/left/' | sed 's/OUTER/outer/' | sed 's/JOIN/join/' | sed 's/ON/on/' > ../groundtruth_spark_queries_adjusted/$q.sql
done