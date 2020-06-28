package com.gms.model;

public class Challan {
	
	private String challanName;
	
	public String getChallanName() {
		return challanName;
	}

	public void setChallanName(String challanName) {
		this.challanName = challanName;
	}

	public String getChallanAlias() {
		return challanAlias;
	}

	public void setChallanAlias(String challanAlias) {
		this.challanAlias = challanAlias;
	}

	public Challan(String challanName, String challanAlias) {
		super();
		this.challanName = challanName;
		this.challanAlias = challanAlias;
	}

	private String challanAlias;
	

}
