package edu.college.models;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Address {
	
	@Column(name="Address_no", length=5)
	private String anumber;
	
	@Column(name="Street", length=40)
	private String street;
	
	@Column(name="City", length=25)
	private String city;
	
	@Column(name="State", length=20)
	private String state;
	
	@Column(name="Pin_code", length=6)
	private String pinCode;
	
	public Address() {
		super();
	}

	public String getAnumber() {
		return anumber;
	}

	public void setAnumber(String anumber) {
		this.anumber = anumber;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

}
