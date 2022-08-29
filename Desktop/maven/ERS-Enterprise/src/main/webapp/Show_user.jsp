<%@tagliburl.-"http://java.sun.com/jsp/jstl/core prefix= “c"%)
<%@tagliburl-http://java.sun.com/jsp/jstl/functions” prefix = “fn”y>
<%@tagliburl = “http://java.sun.com/jsp/jstl/sql” prefix sql"%>
<%@page contentType = “text/html” page Encoding = UTF - 8”%>

<!DOCTYPE html >
<html>
< head>
<metahttp-equiv="Contest-Type"
content-'text/html; charset=UTF-8”>
<title> JSP Page </ title>
<body>
<hi> All users are: </ h1>

<sql : set Datasource driver=“Com.mysql.jdbc.Driver”
Url=“jdbc: mysql: //localhast: 3306 /ERS Enterprice"User= “root” password = “Priyapal12_” var = “OS”></sql:set.Datasorcedata Source="${2s}" var = “rs”
<sql:query> select * from table name;</sql:query>