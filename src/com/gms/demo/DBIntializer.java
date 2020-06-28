package com.gms.demo;

public interface DBIntializer {
	//for ORACLE DB
/*String DRIVER="oracle.jdbc.driver.OracleDriver";
String CON_STRING="jdbc:oracle:thin:@localhost:1521:xe";
String USERNAME="System";
String PASSWORD="System";*/
	
	
	//for mySQL DB
	String DRIVER="com.mysql.jdbc.Driver";
	String CON_STRING="jdbc:mysql://localhost:3307/gms";
	String USERNAME="root";
	String PASSWORD="admin";
	
	
}
