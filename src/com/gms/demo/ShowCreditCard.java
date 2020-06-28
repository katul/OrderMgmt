package com.gms.demo;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.io.GetBufferedRandomAccessSource;

public class ShowCreditCard {
    
	public void ImageGenerete(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        String key = getCardNumber();
        String validity = getValidity();
        String name[] = getName(request,response).split("/");
        String cardholdername = name[0].toUpperCase();
        long account = Long.parseLong(name[1]);
        File file = new File("C:/Users/LENOVO/Desktop/projects/onlinebanking/WebContent/images/cc.jpg");
        BufferedImage bufferedImage1 = ImageIO.read(file);
        Graphics graphics = bufferedImage1.getGraphics();
        graphics.setColor(graphics.getColor());
        graphics.drawRect(250, 400, 400, 50);
        graphics.setColor(Color.WHITE);
        graphics.setFont(new Font("Helvetica", Font.BOLD, 14));
        graphics.drawString(key, 25, 96);
        graphics.setFont(new Font("Ariel", Font.BOLD, 9));
        graphics.drawString(validity, 170, 120);
        graphics.setFont(new Font("Helvetica", Font.BOLD, 9));
        graphics.drawString(cardholdername, 25, 145);
        ImageIO.write(bufferedImage1, "jpg", new File("E:/image17.jpg"));
        int cvv = getCVV();
        setDataIntoTable(cardholdername,key,validity,cvv,account);
        RequestDispatcher rd = request.getRequestDispatcher("ImageTest.jsp");
        rd.forward(request, response);
    }
    private String getValidity() {
    	SimpleDateFormat sdf = new SimpleDateFormat("MM/YY");
    	Date date = new Date();
    	String today = sdf.format(date);
    	String monthYear[] = today.split("/");
    	String month = monthYear[0];
    	int year = Integer.parseInt(monthYear[1])+3;
		return month+"/"+year;
	}
	public String getName(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("username");
		String cardholdername = getCardholderName(user);
		return cardholdername;
    }
    
    public static String getCardNumber() throws SQLException{
    	String cardnumber = null;
    	try{
    		Connection con=GetCon.getCon();
    		PreparedStatement ps1=con.prepareStatement("Select max(cardno) from creditcard");
            ResultSet rs1=ps1.executeQuery();
            if(rs1.next()){
            	Long card = rs1.getLong(1)+1;
            	String cardnumberString = card.toString().trim();
            	cardnumber = cardnumberString.substring(0, 4)+" "+cardnumberString.substring(4, 8)+" "+cardnumberString.substring(8, 12)+" "+cardnumberString.substring(12, 16);
            }
    		System.out.println(cardnumber);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return cardnumber;
    }
    
    public static int getCVV(){
    	Random rand = new Random();
    	int cvv = 100 + rand.nextInt(900);
    	return cvv;
    }
    
    public static String getCardholderName(String username){
    	String name=null;
    	String fname =null;
    	String lname =null;
    	long accno = 0;
    	try{
	    	Connection con=GetCon.getCon();
			PreparedStatement ps1=con.prepareStatement("Select accountno,fname,lname from newaccount where username=?");
			ps1.setString(1, username);
	        ResultSet rs1=ps1.executeQuery();
	        while(rs1.next()){
	        	accno = rs1.getLong(1);
	        	fname = rs1.getString(2);
	        	lname = rs1.getString(3);
	        }
	        name = fname+" "+lname;
    	}catch(Exception e){
    		e.printStackTrace();
    	}
        return name+"/"+accno;
    }
    
	public static void setDataIntoTable(String cardholdername,String key,String validity,int cvv,long account){
			String keytokans[] = key.split(" ");
			key = keytokans[0]+keytokans[1]+keytokans[2]+keytokans[3];
			long cardno = Long.parseLong(key);
			double balance = 200000.00;
			int billingdate = 24;
			double limit = 200000.00;
			String status = "Active";
		try{
	    	Connection con=GetCon.getCon();
			PreparedStatement ps1=con.prepareStatement("insert into creditcard values(?,?,?,?,?,?,?,?,?)");
			ps1.setString(1, cardholdername);
			ps1.setLong(2, cardno);
			ps1.setString(3	, validity);
			ps1.setInt(4, cvv);
			ps1.setLong(5, account);
			ps1.setDouble(6, balance);
			ps1.setInt(7, billingdate);
			ps1.setDouble(8, limit);
			ps1.setString(9, status);
	        ps1.executeUpdate();
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	}
}