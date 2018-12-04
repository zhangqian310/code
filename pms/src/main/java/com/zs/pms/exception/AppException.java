package com.zs.pms.exception;


/**商业异常
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class AppException extends Exception {
	//异常码
	private int errCode;
	//异常信息
	private String errMsg;
	//带参构造函数
	public AppException(int errCode, String errMsg) {
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
	//全部属性的setter 和getter
	public int getErrCode() {
		return errCode;
	}
	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
}