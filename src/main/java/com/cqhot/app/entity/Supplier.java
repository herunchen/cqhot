package com.cqhot.app.entity;

import java.io.Serializable;
import java.util.Date;

public class Supplier implements Serializable{
	
	private static final long serialVersionUID = -3219846222406756379L;
	
	private Integer id;
	private String compId;
	private String indCatg;
	private String type;
	private String name;
	private String country;
	private String province;
	private String valid;
	private String city;
	private String modifiedUser;
	private Date modifiedTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getIndCatg() {
		return indCatg;
	}
	public void setIndCatg(String indCatg) {
		this.indCatg = indCatg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getModifiedUser() {
		return modifiedUser;
	}
	public void setModifiedUser(String modifiedUser) {
		this.modifiedUser = modifiedUser;
	}
	public Date getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	
	
}
