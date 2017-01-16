package com.hisoft.util;

import java.util.List;

public class PageBean {
	private int showRow=5;
	private int totalPage;
	private int currentPage;//µ±Ç°Ò³
	private int totalRow;
	private List currentPageData;
	public int getShowRow() {
		return showRow;
	}
	public void setShowRow(int showRow) {
		this.showRow = showRow;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int list) {
		this.currentPage = list;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		totalPage=totalRow%5==0?totalRow/5:totalRow/5+1;
	}
	public List getCurrentPageData() {
		return currentPageData;
	}
	public void setCurrentPageData(List currentPageData) {
		this.currentPageData = currentPageData;
	} 
	
}
