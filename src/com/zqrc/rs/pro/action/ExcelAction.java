package com.zqrc.rs.pro.action;

import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;
import com.zqrc.rs.pro.test.excel.IExcelService;
import com.zqrc.rs.until.ExcelUntil;

/**
 * 报表相关控制器
 * @author 李志飞
 *
 */
public class ExcelAction extends ActionSupport{
	InputStream excelStream;
	
	public InputStream getExcelStream() {
		return excelStream;
	}
	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}
	
	/**
	 * 导出excal
	 * @return
	 */
	public String outExcel(){
        IExcelService es = new ExcelUntil();  
        excelStream = es.getExcelInputStream();  
        return "excel"; 
	}
}
