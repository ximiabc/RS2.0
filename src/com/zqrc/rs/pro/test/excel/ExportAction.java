package com.zqrc.rs.pro.test.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import sun.awt.AppContext;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import com.opensymphony.xwork2.ActionSupport;

public class ExportAction extends ActionSupport {
	InputStream excelStream;  
	
	 private String title; // 文件标题  
	    private File file; // 文件域  
	    private String fileContentType; // 文件类型  
	    private String fileFileName; // 文件名  
	    private String savePath; // 上传地址  
	  
	    public void setSavePath(String savePath) {  
	        this.savePath = savePath;  
	    }  
	  
	    public String getTitle() {  
	        return title;  
	    }  
	  
	    public void setTitle(String title) {  
	        this.title = title;  
	    }  
	  
	    public File getFile() {  
	        return file;  
	    }  
	  
	    public void setFile(File file) {  
	        this.file = file;  
	    }  
	  
	    public String getFileContentType() {  
	        return fileContentType;  
	    }  
	  
	    public void setFileContentType(String fileContentType) {  
	        this.fileContentType = fileContentType;  
	    }  
	  
	    public String getFileFileName() {  
	        return fileFileName;  
	    }  
	  
	    public void setFileFileName(String fileFileName) {  
	        this.fileFileName = fileFileName;  
	    }  
    

	public InputStream getExcelStream() {
		return excelStream;
	}


	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}


	public String a(){  
        IExcelService es = new ExcelServiceImpl();  
        excelStream = es.getExcelInputStream();  
        return "excel";  
    } 
	
	public String b(){
		try{
			
		// 以服务器的文件保存地址的原文件名建立上传文件输出流  
        FileOutputStream fos = new FileOutputStream(this.getSavePath() +"\\"+ this.getFileFileName());  
        // 以上传文件建立文件输入流  
        FileInputStream fis = new FileInputStream(this.getFile());  
		ExcelServiceImpl es = new ExcelServiceImpl();  
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "input";
	}

	private String getSavePath() {
		return savePath;
	}
}
