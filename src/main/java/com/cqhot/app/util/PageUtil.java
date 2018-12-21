package com.cqhot.app.util;

import java.io.Serializable;

public class PageUtil implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1088959355080893059L;
	
	/**
     * 当前页
     */
	private int pageCurrent = 1;

    /**
     * 每页记录数（默认每页10条）
     */
    private int pageSize = 5;

    /**
     * 总的记录数
     */
    private int rowCount;
    
    /**
     * 开始显示记录
     */
	@SuppressWarnings("unused")
	private int startIndex;
    
    //总页数
	@SuppressWarnings("unused")
	private int pageCount;


    public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getPageCount() {
    	int pages = rowCount/pageSize;
    	if(0 != rowCount%pageSize) {
    		pages +=1;
    	}
        return pages;
    }

	
	 public int getPageCurrent() {
	        return pageCurrent;
	    }

    public void setPageCurrent(int pageCurrent) {
        this.pageCurrent = pageCurrent;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    
    public void setStartIndex(int startIndex) {
    	this.startIndex = startIndex;
    }

    public int getStartIndex() {
    	return (this.getPageCurrent()-1)*pageSize;
    }

}
