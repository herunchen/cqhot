package com.cqhot.app.entity;

import java.io.Serializable;

public class Menu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6244855302266218642L;
	
	private String id;
	private String name;
	private String parentId;
	private String nodePath;
	private String level;
	private String url;
	private String target;
	private String note;
	private String sort;
	private String iconName;
	private String iconOnly;
	private String valid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getNodePath() {
		return nodePath;
	}
	public void setNodePath(String nodePath) {
		this.nodePath = nodePath;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getIconName() {
		return iconName;
	}
	public void setIconName(String iconName) {
		this.iconName = iconName;
	}
	public String getIconOnly() {
		return iconOnly;
	}
	public void setIconOnly(String iconOnly) {
		this.iconOnly = iconOnly;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
}
