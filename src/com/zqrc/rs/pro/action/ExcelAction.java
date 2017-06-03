package com.zqrc.rs.pro.action;

import java.io.ByteArrayInputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.service.FieldService;
import com.zqrc.rs.pro.service.impl.FieldServiceImpl;

/**
 * excel 表功能
 * @author JiaQi
 *
 */
public class ExcelAction extends BaseAction<Fields>{
	private ByteArrayInputStream excelStream;
	
    public ByteArrayInputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(ByteArrayInputStream excelStream) {
		this.excelStream = excelStream;
	}
	
//	导出小学辖区外报名表
	public String Out() throws Exception {
    StringBuffer excelBuf = new StringBuffer();
    List<Fields> list_fields = fieldService.getByComposite(1,1,1);
    
    int i = 0;
    while(i < list_fields.size()){
    	excelBuf.append(list_fields.get(i).getName()).append("\t");
    	i++;
    }
    
    excelBuf.append("\n");
    
    String excelString = excelBuf.toString();
    excelStream = new ByteArrayInputStream(excelString.getBytes(), 0, excelString.getBytes().length);
    return "excel";
    }
	
//	导出小学辖区内报名表
	public String In() throws Exception {
    StringBuffer excelBuf = new StringBuffer();
    List<Fields> list_fields = fieldService.getByComposite(1,1,1);
    
    int i = 0;
    while(i < list_fields.size()){
    	excelBuf.append(list_fields.get(i).getName()).append("\t");
    	i++;
    }
    
    excelBuf.append("\n");
    
    String excelString = excelBuf.toString();
    excelStream = new ByteArrayInputStream(excelString.getBytes(), 0, excelString.getBytes().length);
    return "excel";
    }
	
//	导出中学学辖区外报名表
	public String middelOut() throws Exception {
    StringBuffer excelBuf = new StringBuffer();
    List<Fields> list_fields = fieldService.getByComposite(1,1,1);
    
    int i = 0;
    while(i < list_fields.size()){
    	excelBuf.append(list_fields.get(i).getName()).append("\t");
    	i++;
    }
    
    excelBuf.append("\n");
    
    String excelString = excelBuf.toString();
    excelStream = new ByteArrayInputStream(excelString.getBytes(), 0, excelString.getBytes().length);
    return "excel";
    }
	
//	导出中学学辖区内报名表
	public String middelIn() throws Exception {
    StringBuffer excelBuf = new StringBuffer();
    List<Fields> list_fields = fieldService.getByComposite(1,1,1);
    
    int i = 0;
    while(i < list_fields.size()){
    	excelBuf.append(list_fields.get(i).getName()).append("\t");
    	i++;
    }
    
    excelBuf.append("\n");
    
    String excelString = excelBuf.toString();
    excelStream = new ByteArrayInputStream(excelString.getBytes(), 0, excelString.getBytes().length);
    return "excel";
    }
	
}
