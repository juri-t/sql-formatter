# sql-formatter
SQLを標準入力から受け取り、整形して標準出力に出力。

[SQL Code Style](https://www.sqlstyle.guide/)

# How to use
### test.sql
```
select col1 ,col2 ,count(*) as cnt from table1 where name = 'juri-t'
group by col1, col2 order by col1 desc
```

``` console
$ bin/sqlformatter.rb < test.sql
SELECT col1,
       col2,
       COUNT(*) AS cnt
  FROM table1
 WHERE NAME = 'juri-t'
 GROUP BY col1,
       col2
 ORDER BY col1 DESC
```

# まだ未実装
- [ ] サブクエリ
- [ ] JOIN句
- [ ] コメントアウト
- [ ] ほかにもたくさん
