package com.ypy.shopping.model;

import java.util.List;

/**
 * “≥√Ê¿‡
 * @author ypy
 * @param <T>
 */
public class Page<T> {
	private int pageSize;
	private int currentPage;
	private int totalCount;
	private int pageCount;
	private int startIndex;
	private int endIndex;
	private List<T> list;
	public Page(int pageSize, int currentPage, int totalCount, int pageCount, int startIndex, int endIndex,
			List<T> list) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageCount = pageCount;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
		this.list = list;
	}
	public Page() {
		super();
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", currentPage=" + currentPage + ", totalCount=" + totalCount
				+ ", pageCount=" + pageCount + ", startIndex=" + startIndex + ", endIndex=" + endIndex + ", list="
				+ list + "]";
	}
	
}
