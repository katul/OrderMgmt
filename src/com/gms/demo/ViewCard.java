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

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewCard {
	public void ImageGenerete(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("username");
		long cardno = 0;
		String validity = null;
		String cardholdername = null;
		try{
	    	Connection con=GetCon.getCon();
			PreparedStatement ps1=con.prepareStatement("Select accountno from newaccount where username=?");
			ps1.setString(1, user);
	        ResultSet rs1=ps1.executeQuery();
	        if(rs1.next()){
	        	long accno = rs1.getLong(1);
	        	PreparedStatement ps2=con.prepareStatement("Select cardno,cardholdername,expiry from creditcard where accountno=?");
				ps2.setLong(1, accno);
		        ResultSet rs2=ps2.executeQuery();
		        if(rs2.next()){
		        	cardno = rs2.getLong(1);
		        	cardholdername = rs2.getString(2);
		        	validity = rs2.getString(3);
		        }
	        }
		}catch(Exception e){
        	e.printStackTrace();
        }
        String key = String.valueOf(cardno).trim();
        System.out.println(key);
        key = key.substring(0, 4)+" "+key.substring(4, 8)+" "+key.substring(8, 12)+" "+key.substring(12, 16);
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
        ImageIO.write(bufferedImage1, "jpg", new File("E:/image18.jpg"));
        RequestDispatcher rd = request.getRequestDispatcher("ImageTest.jsp");
        rd.forward(request, response);
    }
}
