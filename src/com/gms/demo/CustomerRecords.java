package com.gms.demo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class CustomerRecords {
	
	public void generatePDF(String stmt, int checkVal){
		
		if(checkVal == 1 || checkVal == 3){
			getAllCustomerDataPdf(stmt,checkVal);
		}else if(checkVal == 4){
			getCreditCardData(stmt);
		}
	}
	
	public void generateUniqueCustomerViewPDF(String stmt,long accountno){

    	Document document = new Document();
    	OutputStream file = null;
        try {
        	  String pdfName = "Cust_Records_"+accountno+".pdf";
        	  String location = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\"+pdfName;
              file = new FileOutputStream(new File(location));
	          
	          PdfWriter.getInstance(document, file);
 
			  PdfPTable table=new PdfPTable(9);
 
              PdfPCell cell = new PdfPCell (new Paragraph ("Customer Data"));
	 
		      cell.setColspan (9);
		      cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		      cell.setPadding (10.0f);
		      cell.setBackgroundColor (new BaseColor (140, 221, 8));					               
 
		      table.addCell(cell);						               
		      table.addCell("Account Number");
		      table.addCell("Username");
		      table.addCell("First Name");
		      table.addCell("Last Name");
		      table.addCell("Address");
		      table.addCell("Opening Balance");
		      table.addCell("Phone Number");
		      table.addCell("Date Created");
		      table.addCell("Account Status");
		      Connection con= GetCon.getCon();
		      PreparedStatement ps1=con.prepareStatement(stmt);
			  ResultSet rs1=ps1.executeQuery();
			  while(rs1.next()){
				  table.addCell(String.valueOf(rs1.getLong(1)));
                  table.addCell(rs1.getString(2));
			      table.addCell(rs1.getString(3));
			      table.addCell(rs1.getString(4));
			      table.addCell(rs1.getString(5));
			      table.addCell(String.valueOf(rs1.getDouble(6)));
			      table.addCell(String.valueOf(rs1.getLong(7)));
			      table.addCell(rs1.getDate(8).toString());
			      table.addCell(rs1.getString(9));				      
			  }
		      table.setSpacingBefore(30.0f);       
		      table.setSpacingAfter(30.0f);        								          
 
              Chunk chunk=new Chunk("This Document is for internal circulation only.");
			  chunk.setUnderline(+1f,-2f);
 
			  document.open();//PDF document opened........			       
 
			  document.add(Chunk.NEWLINE);   
 
              document.add(new Paragraph("Records dated On - "+new Date().toString()));	
 
			  document.add(table);
			  document.add(chunk);
 
			  document.add(Chunk.NEWLINE);  					    
			  document.close();
	          file.close();
	          System.out.println("Pdf created successfully..");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void getAllCustomerDataPdf(String stmt, int checkVal){
		Document document = new Document();
    	OutputStream file = null;
    	String pdfName = null;
        try {
        	  if(checkVal == 1){
        		   pdfName = "AllCust_Records.pdf";
        	  }else if(checkVal == 3){
        		   pdfName = "ActiveCust_Records.pdf";
        	  }
        	  String location = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\"+pdfName;
              file = new FileOutputStream(new File(location));
	          
	          PdfWriter.getInstance(document, file);
 
			  PdfPTable table=new PdfPTable(9);
 
              PdfPCell cell = new PdfPCell (new Paragraph ("Customer Data"));
	 
		      cell.setColspan (9);
		      cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		      cell.setPadding (10.0f);
		      cell.setBackgroundColor (new BaseColor (140, 221, 8));					               
 
		      table.addCell(cell);						               
 
		      table.addCell("Account Number");
		      table.addCell("Username");
		      table.addCell("First Name");
		      table.addCell("Last Name");
		      table.addCell("Address");
		      table.addCell("Opening Balance");
		      table.addCell("Phone Number");
		      table.addCell("Date Created");
		      table.addCell("Account Status");
		      Connection con= GetCon.getCon();
		      PreparedStatement ps1=con.prepareStatement(stmt);
			  ResultSet rs1=ps1.executeQuery();
			  while(rs1.next()){
				  table.addCell(String.valueOf(rs1.getLong(1)));
                  table.addCell(rs1.getString(2));
			      table.addCell(rs1.getString(3));
			      table.addCell(rs1.getString(4));
			      table.addCell(rs1.getString(5));
			      table.addCell(String.valueOf(rs1.getDouble(6)));
			      table.addCell(String.valueOf(rs1.getLong(7)));
			      table.addCell(rs1.getDate(8).toString());
			      table.addCell(rs1.getString(9));				      
			  }
		      table.setSpacingBefore(30.0f);       
		      table.setSpacingAfter(30.0f);        								          
 
              Chunk chunk=new Chunk("This Document is for internal circulation only.");
			  chunk.setUnderline(+1f,-2f);
 
			  document.open();//PDF document opened........			       
 
			  document.add(Chunk.NEWLINE);   
 
              document.add(new Paragraph("Records dated On - "+new Date().toString()));	
 
			  document.add(table);
 
			  document.add(chunk);
 
			  document.add(Chunk.NEWLINE);  					    
			  document.close();
	          file.close();
	          System.out.println("Pdf created successfully..");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void getCreditCardData(String stmt){

		Document document = new Document();
    	OutputStream file = null;
        try {
        	  String pdfName = "CreditCard_Report.pdf";
        	  String location = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\"+pdfName;
              file = new FileOutputStream(new File(location));
	          
	          PdfWriter.getInstance(document, file);
 
			  PdfPTable table=new PdfPTable(9);
 
              PdfPCell cell = new PdfPCell (new Paragraph ("Customer Data"));
	 
		      cell.setColspan (9);
		      cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		      cell.setPadding (10.0f);
		      cell.setBackgroundColor (new BaseColor (140, 221, 8));					               
 
		      table.addCell(cell);						               
 
		      table.addCell("Cardholder Name");
		      table.addCell("Credit Card Number");
		      table.addCell("Expiry Date");
		      table.addCell("CVV");
		      table.addCell("Account Number");
		      table.addCell("Opening Balance");
		      table.addCell("Billing Cycle Date");
		      table.addCell("Account Limit");
		      table.addCell("Card Status");
		      Connection con= GetCon.getCon();
		      PreparedStatement ps1=con.prepareStatement(stmt);
			  ResultSet rs1=ps1.executeQuery();
			  while(rs1.next()){
				  table.addCell(rs1.getString(1));
				  table.addCell(String.valueOf(rs1.getLong(2)));
                  table.addCell(rs1.getString(3));
			      table.addCell(String.valueOf(rs1.getInt(4)));
			      table.addCell(String.valueOf(rs1.getLong(5)));
			      table.addCell(String.valueOf(rs1.getDouble(6)));
			      table.addCell(String.valueOf(rs1.getInt(7)));
			      table.addCell(String.valueOf(rs1.getDouble(8)));
			      table.addCell(rs1.getString(9));				      
			  }
		      table.setSpacingBefore(30.0f);       
		      table.setSpacingAfter(30.0f);        								          
 
              Chunk chunk=new Chunk("This Document is for internal circulation only.");
			  chunk.setUnderline(+1f,-2f);
 
			  document.open();//PDF document opened........			       
 
			  document.add(Chunk.NEWLINE);   
 
              document.add(new Paragraph("Records dated On - "+new Date().toString()));	
 
			  document.add(table);
 
			  document.add(chunk);
 
			  document.add(Chunk.NEWLINE);  					    
			  document.close();
	          file.close();
	          System.out.println("Pdf created successfully..");
        } catch (Exception e) {
            e.printStackTrace();
        }
	
		
	}
}
