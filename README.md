# sql-formatter
SQLを標準入力から受け取り、整形して標準出力に出力。

[SQL Code Style](https://www.sqlstyle.guide/)

# How to use
### test.sql
```
select col1 ,col2 ,count(*) as cnt from table1 
inner join table2 t2 on t1.col1 = t2.col1
and t1.col2 = 'hoge'
left outer join table3 t3
on t2.col2 = t3.col2 where name = 'juri-t'
group by col1, col2 order by col1 desc
```

``` console
$ bin/sqlformatter.rb < test.sql

SELECT col1,
       col2,
       COUNT(*) AS cnt
  FROM table1 t1
       INNER JOIN table2 t2
          ON t1.col1 = t2.col1
         AND t1.col2 = 'hoge'
        LEFT OUTER JOIN table3 t3
          ON t2.col2 = t3.col2
 WHERE user_name = 'juri-t'
 GROUP BY col1,
       col2
 ORDER BY col1 DESC
 
 ```

# まだ未実装
- [ ] サブクエリ
- [ ] コメントアウト
- [ ] ほかにもたくさん
