package com.zqrc.rs.pro.action;

import java.io.InputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.States;
import com.zqrc.rs.pro.service.StatesService;
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
	
	/**
	 * 导出excal
	 * @return
	 */
	public String outExcel(){
		String[] name = null;
		List<Fields> list_field = fieldService.findAll();
		
//		list排序
		Collections.sort(list_field, new Comparator() {
            public int compare(Object a, Object b) {
                int one = ((Fields) a).getOrders();
                int two = ((Fields) b).getOrders();
                return one - two;
            }
        });
		
		int i = 0;
		while(i < list_field.size()){
			
			name[i] = list_field.get(i).getName();
			
			i++;
		}
		
        IExcelService es = new ExcelUntil();  
        excelStream = es.getExcelInputStream(name);  
        return "excel"; 
	}
}
