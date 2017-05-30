package com.zqrc.rs.pro.action;

import java.io.InputStream;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.service.UserService;
import com.zqrc.rs.pro.test.excel.IExcelService;
import com.zqrc.rs.until.ExcelUntil;

/**
 * 报表相关控制器
 * @author 李志飞
 *
 */
public class ExcelAction<T> extends BaseAction<T>{
	InputStream excelStream;
	
	public InputStream getExcelStream() {
		return excelStream;
	}
	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}
//	导出excel
	public String outExcel(){
		String[] name = null;
        IExcelService es = new ExcelUntil();  
        excelStream = es.getExcelInputStream(name);  
        return "excel"; 
	}
}
