package com.gms.demo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
 
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
public class PdfGen {
 
    public void generteStatement(Long accountno) throws IOException {
    	Document document = new Document();
    	OutputStream file = null;
        try {
        	  Long acc = accountno;
        	  String pdfName = "Statement_"+acc+".pdf";
        	  String location = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\"+pdfName;
              file = new FileOutputStream(new File(location));
	          
	          PdfWriter.getInstance(document, file);
 
			     PdfPTable table=new PdfPTable(3);
 
	                  PdfPCell cell = new PdfPCell (new Paragraph ("Statement"));
 
				      cell.setColspan (3);
				      cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				      cell.setPadding (10.0f);
				      cell.setBackgroundColor (new BaseColor (140, 221, 8));					               
 
				      table.addCell(cell);						               
 
				      table.addCell("Transaction Date");
				      table.addCell("Transaction Type");
				      table.addCell("Amount");
				      Connection con= GetCon.getCon();
				      PreparedStatement ps1=con.prepareStatement("Select * from transactionhistory where accountno=?");
					  ps1.setLong(1,accountno);
					  ResultSet rs1=ps1.executeQuery();
					  while(rs1.next()){
	                      table.addCell(rs1.getDate(2).toString());
					      table.addCell(rs1.getString(3));
					      table.addCell(String.valueOf(rs1.getDouble(4)));
					  }
				      table.setSpacingBefore(30.0f);       // Space Before table starts, like margin-top in CSS
				      table.setSpacingAfter(30.0f);        // Space After table starts, like margin-Bottom in CSS								          
 
	                Chunk chunk=new Chunk("Thanks!!");
					chunk.setUnderline(+1f,-2f);//1st co-ordinate is for line width,2nd is space between
 
					document.open();//PDF document opened........			       
 
					document.add(Chunk.NEWLINE);   
 
                    document.add(new Paragraph("Dear Accountholder"));
	                document.add(new Paragraph("Your Account Statement On - "+new Date().toString()));	
 
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
