package com.zqrc.rs.until;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import com.zqrc.rs.pro.test.excel.IExcelService;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelUntil implements IExcelService{
	public InputStream getExcelInputStream(String[] name) {
        //将OutputStream转化为InputStream  
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        putDataOnOutputStream(out,name);  
        return new ByteArrayInputStream(out.toByteArray());  
    }  
  
//	生成excel
    private void putDataOnOutputStream(OutputStream os,String[] name) {
        jxl.write.Label label;  
        WritableWorkbook workbook;  
        try {  
            workbook = Workbook.createWorkbook(os);  
            WritableSheet sheet = workbook.createSheet("Sheet1", 0);  
  
            int i = 0;
            
            while(i < name.length){
            	label = new jxl.write.Label(i, 0, name[i]);  
            	sheet.addCell(label);  
            }
            
            workbook.write();  
            workbook.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
////    解析excel
//    public void readExcel(InputStream stream){  
//    	try{
//    		
//        //获取Excel文件对象  
//        Workbook  rwb = Workbook.getWorkbook(stream);  
//        //获取文件的指定工作表 默认的第一个  
//        Sheet sheet = rwb.getSheet(0);    
//        //行数(表头的目录不需要，从1开始)  
//        for(int i=0; i<sheet.getRows(); i++){  
//             //创建一个数组 用来存储每一列的值  
//            String[] str = new String[sheet.getColumns()];  
//            Cell cell = null;  
//            //列数  
//            for(int j=0; j<sheet.getColumns(); j++){  
//              //获取第i行，第j列的值  
//              cell = sheet.getCell(j,i);      
//              str[j] = cell.getContents();
//              System.out.println(str[j]);
//            }  
//        }  
//    	}catch(Exception e){
//    		e.printStackTrace();
//    	}
//    }  
}
