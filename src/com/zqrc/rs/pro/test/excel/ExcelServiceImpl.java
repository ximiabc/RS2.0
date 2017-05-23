package com.zqrc.rs.pro.test.excel;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelServiceImpl implements IExcelService{
	public InputStream getExcelInputStream() {  
        //将OutputStream转化为InputStream  
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        putDataOnOutputStream(out);  
        return new ByteArrayInputStream(out.toByteArray());  
    }  
  
//	生成excel
    private void putDataOnOutputStream(OutputStream os) {  
        jxl.write.Label label;  
        jxl.write.Label label1;
        WritableWorkbook workbook;  
        try {  
            workbook = Workbook.createWorkbook(os);  
            WritableSheet sheet = workbook.createSheet("Sheet1", 0);  
  
            label = new jxl.write.Label(0, 0, "struts2导出excel");  
            sheet.addCell(label);  
            
            workbook.write();  
            workbook.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
//    解析excel
    public void readExcel(InputStream stream){  
    	try{
    		
        //获取Excel文件对象  
        Workbook  rwb = Workbook.getWorkbook(stream);  
        //获取文件的指定工作表 默认的第一个  
        Sheet sheet = rwb.getSheet(0);    
        //行数(表头的目录不需要，从1开始)  
        for(int i=0; i<sheet.getRows(); i++){  
             //创建一个数组 用来存储每一列的值  
            String[] str = new String[sheet.getColumns()];  
            Cell cell = null;  
            //列数  
            for(int j=0; j<sheet.getColumns(); j++){  
              //获取第i行，第j列的值  
              cell = sheet.getCell(j,i);      
              str[j] = cell.getContents();
              System.out.println(str[j]);
            }  
        }  
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }  
}
