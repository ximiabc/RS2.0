package com.zqrc.rs.pro.test.excel;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public interface IExcelService {
	
	InputStream getExcelInputStream(String[] name);  
    
}
