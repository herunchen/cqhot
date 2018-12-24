package com.cqhot.app.entity;

import java.io.Serializable;
import java.util.Date;

public class Team implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1290830211557539916L;
	
	private Integer id;
	private String tName;
	private Integer prjId;
	private Integer managerId;
	private Integer valid;
	private String note;
	private String createdUser;
	private Date createdTime;
	private String modifiedUser;
	private Date modifiedTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public Integer getPrjId() {
		return prjId;
	}
	public void setPrjId(Integer prjId) {
		this.prjId = prjId;
	}
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	public Integer getValid() {
		return valid;
	}
	public void setValid(Integer valid) {
		this.valid = valid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCreatedUser() {
		return createdUser;
	}
	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
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
