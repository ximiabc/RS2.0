package com.zqrc.rs.pro.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;

/**
 * excel 表功能
 * @author JiaQi
 *
 */
public class ExcelAction extends BaseAction<Fields>{
	InputStream excelStream;  

	public InputStream getExcelStream() {
		return excelStream;
	}


	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}
	
	
	public Integer getNewDate(){
		
		SchoolYear year = yearService.getNews();
		
		return year.getId();
	}


	public String Out(){  
		ByteArrayOutputStream out = new ByteArrayOutputStream();  

		jxl.write.Label label;  
		WritableWorkbook workbook;  
		try {  
			workbook = Workbook.createWorkbook(out);  
			WritableSheet sheet = workbook.createSheet("Sheet1", 0);  


			List<Fields> list_fields = fieldService.getByComposite(1,2,getNewDate());

			label = new jxl.write.Label(0, 0, "序号");  
			int i = 0;
			sheet.addCell(label);
			while(i < list_fields.size()){
				label = new jxl.write.Label(i+1, 0, list_fields.get(i).getName());  
				sheet.addCell(label);  
				i++;
			}

			workbook.write();  
			workbook.close();  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel";  
	}  






	//	导出小学辖区外报名表
	public String In() throws Exception {


		ByteArrayOutputStream out = new ByteArrayOutputStream();  

		jxl.write.Label label;  
		WritableWorkbook workbook;  
		try {  
			workbook = Workbook.createWorkbook(out);  
			WritableSheet sheet = workbook.createSheet("Sheet1", 0);  


			List<Fields> list_fields = fieldService.getByComposite(1,1,getNewDate());

			label = new jxl.write.Label(0, 0, "序号");  
			int i = 0;
			sheet.addCell(label);
			while(i < list_fields.size()){
				label = new jxl.write.Label(i+1, 0, list_fields.get(i).getName());  
				sheet.addCell(label);  
				i++;
			}

			workbook.write();  
			workbook.close();  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel";  
	}

	//	导出中学学辖区外报名表
	public String middelOut() throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();  

		jxl.write.Label label;  
		WritableWorkbook workbook;  
		try {  
			workbook = Workbook.createWorkbook(out);  
			WritableSheet sheet = workbook.createSheet("Sheet1", 0);  


			List<Fields> list_fields = fieldService.getByComposite(2,2,getNewDate());

			label = new jxl.write.Label(0, 0, "序号");  
			int i = 0;
			sheet.addCell(label);
			while(i < list_fields.size()){
				label = new jxl.write.Label(i+1, 0, list_fields.get(i).getName());  
				sheet.addCell(label);  
				i++;
			}

			workbook.write();  
			workbook.close();  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel"; 
	}

	//	导出中学学辖区内报名表
	public String middelIn() throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();  

		jxl.write.Label label;  
		WritableWorkbook workbook;  
		try {  
			workbook = Workbook.createWorkbook(out);  
			WritableSheet sheet = workbook.createSheet("Sheet1", 0);  


			List<Fields> list_fields = fieldService.getByComposite(2,1,getNewDate());

			label = new jxl.write.Label(0, 0, "序号");  
			int i = 0;
			sheet.addCell(label);
			while(i < list_fields.size()){
				label = new jxl.write.Label(i+1, 0, list_fields.get(i).getName());  
				sheet.addCell(label);  
				i++;
			}

			workbook.write();  
			workbook.close();  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel"; 
	}
}
