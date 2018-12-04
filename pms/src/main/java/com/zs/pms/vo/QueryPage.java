package com.zs.pms.vo;

import com.zs.pms.util.Constants;

public class QueryPage {
	protected int start;
	protected int end;
	protected int page;//当前页
	/**计算起始数
	 * @return
	 */
	public int getStart() {
		//(当前页-1)*每页条数+1
		return (page-1)*Constants.PAGECOUNT+1;
	}
	public void setStart(int start) {
		this.start = start;
	}
	/**计算截止数
	 * @return
	 */
	public int getEnd() {
		//当前页*每页条数
		return page*Constants.PAGECOUNT;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
