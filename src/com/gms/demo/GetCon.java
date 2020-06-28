package com.gms.demo;
import java.sql.*;
public class GetCon {
private GetCon(){}

public static Connection con;
static{
	try {
		Class.forName(DBIntializer.DRIVER);
		con=DriverManager.getConnection(DBIntializer.CON_STRING,DBIntializer.USERNAME,DBIntializer.PASSWORD);
	} catch (ClassNotFoundException e) {
		System.out.println("Error Occured in GetCon");
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
public static Connection getCon(){
	return con;
}



public static int getAccountNumber(){
	int nextvalue=0;
	Connection con=GetCon.getCon();
	PreparedStatement ps2;
	try {
	
	ps2=con.prepareStatement("select MAX(accountno) from NEWACCOUNT");
	
	ResultSet rs=ps2.executeQuery();
	rs.next();
	nextvalue=rs.getInt(1)+1;
} catch (SQLException e) {
		
		e.printStackTrace();
	}
return nextvalue;

}


	public static int getItemID(){
		int nextvalue=0;
		Connection con=GetCon.getCon();
		PreparedStatement ps2;
		try {
		
		ps2=con.prepareStatement("select MAX(itemid) from challan");
		
		ResultSet rs=ps2.executeQuery();
		rs.next();
		nextvalue=rs.getInt(1)+1;
	} catch (SQLException e) {
			
			e.printStackTrace();
		}
	return nextvalue;
	
	}
}

