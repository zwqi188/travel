package com.yugii.utils;

public class PageUtil {
	private int recordCount;
	private int currentPage;
	private int prepPage;
	private int nextPage;
	private int pageSize;
	private String url;
	
	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPrepPage() {
		return prepPage;
	}

	public void setPrepPage(int prepPage) {
		this.prepPage = prepPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public PageUtil() {
		// TODO Auto-generated constructor stub
	}
	public PageUtil(int recordCount, int currentPage, int pageSize, String url) {
		super();
		this.recordCount = recordCount;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.url = url;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		//一共有多少页 recordcount记录数
		int pageCount=recordCount%pageSize==0?recordCount/pageSize:(recordCount/pageSize)+1;
		
		String pageShow = "每页显示<select id=\"pagesCounts\" name=\"pages\"><option value=\"5\">5</option><option value=\"10\">10</option></select>条";
		String pages = "　<span id=\"curentPages\">5</span>/<span id=\"allPages\">25</span>页　";
		String firstP="<a href=\""+url+"?page=1\">首页</a>";
		String lastP="<a href=\""+url+"?page="+pageCount+"\" style=\"border: none;\">尾页</a>";
		String nextp="";
		if(currentPage==pageCount)
		{
		   nextp="<a>下一页</a>";
		}
		else
		{
			 nextp="<a href=\""+url+"?page="+(currentPage+1)+"\">下一页</a>";
		}
		String preP="";
		if(currentPage==1)
		{
			preP="<a>上一页</a>";
		}
		else
		{
			preP="<a href=\""+url+"?page="+(currentPage-1)+"\">上一页</a>";
		}
		String gojs = "<script type=\"text/javascript\">"+"function go()"
				+"{var pageno=document.getElementById(\"pageno\").value;window.location.href=\""+
				url+"?page=\"+pageno;"+"}</script>";
		String gopage = "<input id=\"pageno\" type=\"text\" style=\"width: 30px;\"/><input value=\"go\" type=\"button\" onclick=\"go()\"/>";
        return  pageShow+pages+firstP+preP+nextp+lastP+gopage+gojs;
	}
}
