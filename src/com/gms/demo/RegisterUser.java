package com.gms.demo;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.gms.demo.GetCon;
public class RegisterUser {
static int status=0;
public static int register(String username,String firstName,String lastName,String adderess,String password,double amount,Long phone){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		System.out.println("inserting into newaccount");
		ps = con.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?,?,?,?)");
		int	nextvalue1=GetCon.getAccountNumber();
		Date date = new Date();
		String creationDt= new SimpleDateFormat("yyyy-MM-dd").format(date);
		ps.setInt(1,nextvalue1);
		ps.setString(2,username);
		ps.setString(3,firstName);
		ps.setString(4,lastName);
		ps.setString(5,adderess);
		ps.setString(6,password);
		ps.setDouble(7,amount);
		ps.setLong(8,phone);
		ps.setString(9, creationDt);
		ps.setString(10, "Active");
		status=ps.executeUpdate();
		/*
		 * ps = con.prepareStatement("Insert into accountinfo values(?,?,?)");
		 * ps.setInt(1,nextvalue1); ps.setString(2,username); ps.setDouble(3,amount);
		 * status=ps.executeUpdate(); ps =
		 * con.prepareStatement("Insert into transactionhistory values(?,?,?,?)");
		 * ps.setInt(1,nextvalue1); ps.setString(2, creationDt); ps.setString(3,
		 * "Credit"); ps.setDouble(4,amount); status=ps.executeUpdate();
		 */
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
	
}
public static int updateUser(String username,String firstName,String lastName,String adderess,String password,Long phone){
	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("update newaccount set fname=?,lname=?,address=?,password=?,phoneno=? where username=?");
		ps.setString(1,firstName);
		ps.setString(2,lastName);
		ps.setString(3,adderess);
		ps.setString(4,password);
		ps.setLong(5,phone);
		ps.setString(6,username);
		status=ps.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	return status;
}


public static int checkUserAvaiability(String username){
	Connection con=GetCon.getCon();
	int status = 0;
	PreparedStatement ps;
	try {
		System.out.println("inserting into newaccount");
		ps = con.prepareStatement("select * from newaccount where username=?");
		ps.setString(1,username);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			status = 1;
		}
		System.out.println(status);
	}catch(Exception e){
		e.printStackTrace();
	}
	return status;
}
}