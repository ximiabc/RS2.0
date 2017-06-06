package com.zqrc.rs.pro.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.List;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.until.DateUtil;

/**
 * excel 表功能
 * @author JiaQi
 *
 */
public class ExcelAction extends BaseAction<Fields>{
	private String grade_id;
	private String type_id;
	
	public String getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}

	public String getType_id() {
		return type_id;
	}

	public void setType_id(String type_id) {
		this.type_id = type_id;
	}

	public File getFile() {
		return file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

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

//   导出小学辖区外的模板
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

	//	导出小学辖区内报名表
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
	
	// 对应表单：<input type="file" name="file">
		private File file;
		// 文件名
		private String fileFileName;
		// 文件的类型(MIME)
		private String fileContentType;
		public void setFile(File file) {
			this.file = file;
		}
		public void setFileFileName(String fileFileName) {
			this.fileFileName = fileFileName;
		}
		public void setFileContentType(String fileContentType) {
			this.fileContentType = fileContentType;
		}

		public String execute() throws Exception {
			/******拿到上传的文件，上传到upload目录******/
			File destFile = null;

			// 获取上传的目录路径
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			// 创建目标文件对象
			String types;
			String[] tempType=fileFileName.split("\\.");
			types=tempType[tempType.length-1];
			
			destFile = new File(path, DateUtil.getUUID()+"."+types);
			
			// 把上传的文件，拷贝到目标文件中
			FileUtils.copyFile(file, destFile);
			/**
			 * file解析
			 */
			//file
			return "primaryIn";
		}
}
