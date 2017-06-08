package com.zqrc.rs.until;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.Student;

/**
 * excel工具
 * @author 李志飞
 *
 */
public class ExcelUtil{

	/**
	 * 获取表头
	 */
	public static String[] getTitles(File file){
		Workbook workbook = null;
		String[] str=null;
		try{
			workbook = Workbook.getWorkbook(file);
			Sheet sheet = workbook.getSheet(0);//获得第一个工作表sheet1
			str=new String[sheet.getColumns()];
			for (int j = 0; j < sheet.getColumns(); j++) {//sheet.getColumns():获得表格文件列数
				str[j]=sheet.getCell(j,1).getContents();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			workbook.close();//关闭
		}
		return str;
	}

	/**
	 * 检验字段合法性
	 */
	public static Boolean check(List<Fields> list,String[] titles){
		Boolean b = true;
		if(titles.length>=list.size()){
			for(int i=0;i<list.size();i++){
				if(!list.get(i).getName().equals(titles[i])){
					b=false;
				}
			}
		}else{
			for(int i=0;i<titles.length;i++){
				if(!list.get(i).getName().equals(titles[i])){
					b=false;
				}
			}
		}
		return b;
	}

	/**
	 * 解析数据返回数组
	 * @param files
	 * @param list
	 * @return
	 */
	public static List<String[]> sax(File files,List<Fields> list){
		String[]titles=getTitles(files);
		List<String[]>students=new ArrayList<String[]>();
		try{
			if(files.exists()){//判断文件是否存在
				Workbook workbook = Workbook.getWorkbook(files);
				Sheet sheet = workbook.getSheet(0);
				if(check(list,titles)){//检查合法性
					//获得数据
					for (int i = 0; i < sheet.getRows(); i++) {//sheet.getRows():获得表格文件行数
						String[]str=new String[sheet.getColumns()];
						for (int j = 0; j < sheet.getColumns(); j++) {//sheet.getColumns():获得表格文件列数
							str[j]= sheet.getCell(j,i).getContents();
						}
						students.add(str);
					}
				}else{
					System.out.println("数据字段不一致！");
				}
				workbook.close();//关闭
			}else{
				System.out.println("文件不存在");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}
}
