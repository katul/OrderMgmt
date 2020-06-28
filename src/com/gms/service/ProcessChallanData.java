package com.gms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gms.demo.GetCon;

public class ProcessChallanData {
	static int status = 0;
	public int processData(String challanName,Map<Integer,List<String>> data) {
		
		

		for (Entry<Integer, List<String>> ee : data.entrySet()) {
		    Integer key = Integer.valueOf(ee.getKey());
		    List<String> values = ee.getValue();
		    status = setDB(challanName,values);
		}
		return status;
	}

	private int setDB(String challanName,List<String> values) {
		Connection con=GetCon.getCon();
		String alias = createAlias(challanName);
		String itemName = values.get(0);
		int itemQuantity = Integer.valueOf(values.get(1));
		String itemUnit = values.get(2);
		String itemid = String.valueOf(GetCon.getItemID());
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Insert into challan values(?,?,?,?,?,?)");
			ps.setString(1,challanName);
			ps.setString(2,alias);
			ps.setString(3,itemid);
			ps.setString(4,itemName);
			ps.setInt(5, itemQuantity);
			ps.setString(6,itemUnit);
			status=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

	private String createAlias(String challanName) {
		challanName=challanName.replaceAll("\\W", "");    //we can also use this regular expression  
		challanName=challanName.toLowerCase();
		return challanName;
	}
	
	public JSONObject getChallanList(){
		//Map<String,String> challanList = new HashMap<String,String>();
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		JSONObject challanList = new JSONObject();
	      //Creating a json array
	    JSONArray array = new JSONArray();
		try {
			ps = con.prepareStatement("select distinct challan_name, challan_alias from challan");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				JSONObject record = new JSONObject();
				record.put("challanAlias", rs.getString(2));//{challanAlias:test} =>{challanAlias:test,challanName:Test} 
				record.put("challanName", rs.getString(1));//{challanName:Test}
				array.add(record);
			}
			challanList.put("Challan_Data",array);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return challanList;
		
	}
	
	public JSONObject getChallanData(String challanName) {
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		JSONObject challanData = new JSONObject();
		String challan = "";
		JSONArray array = new JSONArray();
		try {
			ps = con.prepareStatement("select * from challan where challan_alias = ?");
			ps.setString(1, challanName);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				JSONObject record = new JSONObject();
				challan = rs.getString(1);
				record.put("itemid", rs.getString(3));
				record.put("itemname", rs.getString(4));
				record.put("quantity", rs.getInt(5));
				record.put("unit", rs.getString(6));
				array.add(record);
			}
			challanData.put("challan_name", challan);
			challanData.put("challan_data", array);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return challanData;
	}

}
