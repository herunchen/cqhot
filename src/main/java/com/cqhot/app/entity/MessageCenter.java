package com.cqhot.app.entity;

import java.io.Serializable;
import java.util.Date;

public class MessageCenter implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4018159507354209757L;
	/*message_id       信息ID
	class_type         信息分类
	Send_user          发送人
	Accept_user    	        接收人
	Message_title 	        消息标题
	Message_content    消息内容
	Release_status	        发布状态
	Send_department    发送部门
	Release_time	        发布时间
	isvalid            是否有效
	Update_time        修改时间*/
 
	private int message_id;
	private int class_type;
	private String send_user;
	private String accept_user;
	private String message_title;
	private String message_content;
	private int release_status;
	private String send_department;
	private Date release_time;
	private int isvalid;
	private Date update_time;
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public int getClass_type() {
		return class_type;
	}
	public void setClass_type(int class_type) {
		this.class_type = class_type;
	}
	public String getSend_user() {
		return send_user;
	}
	public void setSend_user(String send_user) {
		this.send_user = send_user;
	}
	public String getAccept_user() {
		return accept_user;
	}
	public void setAccept_user(String accept_user) {
		this.accept_user = accept_user;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public int getRelease_status() {
		return release_status;
	}
	public void setRelease_status(int release_status) {
		this.release_status = release_status;
	}
	public String getSend_department() {
		return send_department;
	}
	public void setSend_department(String send_department) {
		this.send_department = send_department;
	}
	public Date getRelease_time() {
		return release_time;
	}
	public void setRelease_time(Date release_time) {
		this.release_time = release_time;
	}
	public int getIsvalid() {
		return isvalid;
	}
	public void setIsvalid(int isvalid) {
		this.isvalid = isvalid;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	@Override
	public String toString() {
		return "MessageCenter [message_id=" + message_id + ", class_type=" + class_type + ", send_user=" + send_user
				+ ", accept_user=" + accept_user + ", message_title=" + message_title + ", message_content="
				+ message_content + ", release_status=" + release_status + ", send_department=" + send_department
				+ ", release_time=" + release_time + ", isvalid=" + isvalid + ", update_time=" + update_time + "]";
	}
	
	
}
