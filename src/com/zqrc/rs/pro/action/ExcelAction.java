package com.zqrc.rs.pro.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;

import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.Grade;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.States;
import com.zqrc.rs.pro.entity.Student;
import com.zqrc.rs.pro.entity.Type;
import com.zqrc.rs.until.DateUtil;
import com.zqrc.rs.until.ExcelUtil;

/**
 * excel 表功能
 * @author JiaQi
 *
 */
public class ExcelAction extends BaseAction<Fields>{
	private String grade_id;
	private String type_id;
	private String action_id;//区分上传文件1、模板的动作0
	public void setAction_id(String action_id) {
		this.action_id = action_id;
	}
	public String getAction_id() {
		return action_id;
	}
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

	/**
	 * 文件输出流
	 * @param title
	 * @param out
	 * @param grade
	 * @param type
	 * @param year
	 */
	private void getExcelByte(String title,ByteArrayOutputStream out,Integer grade,Integer type,Integer year){
		WritableWorkbook workbook;
		jxl.write.Label label;  
		try {
			workbook = Workbook.createWorkbook(out);  
			WritableSheet sheet = workbook.createSheet(title, 0);  
			List<Fields> list_fields = fieldService.getByComposite(1,2,year);
			int i=0;
			while(i < list_fields.size()){
				label = new jxl.write.Label(i, 0, list_fields.get(i).getName());  
				sheet.addCell(label);  
				i++;
			}
			workbook.write();  
			workbook.close();  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  
	}

	/**
	 * 导出小学辖区外的模板
	 * @return
	 */
	public String Out(){
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		getExcelByte("上街区小学范围外入学报名表",out,1,2,getNewDate());
		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel";  
	}

	/**
	 * 导出小学辖区内报名表
	 * @return
	 * @throws Exception
	 */
	public String In() throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		getExcelByte("上街区小学范围内入学报名表",out,1,1,getNewDate());
		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel";  
	}

	/**
	 * 导出中学学辖区外报名表
	 * @return
	 * @throws Exception
	 */
	public String middelOut() throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		getExcelByte("上街区中学范围外入学报名表",out,2,2,getNewDate());
		excelStream = new ByteArrayInputStream(out.toByteArray());  
		return "excel"; 
	}

	/**
	 * 导出中学学辖区内报名表
	 * @return
	 * @throws Exception
	 */
	public String middelIn() throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();  
		getExcelByte("上街区中学范围内入学报名表",out,2,2,getNewDate());
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
	
	/**
	 * 小学辖区内
	 * 模板excel导入
	 */
	public String InPrimaryIn(){
		try {
			updateExcel();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[]titles=ExcelUtil.getTitles(file);
		saveFieldsTitles(1,1,titles);
		return "primaryIn";
	}
	
	/**
	 * 小学辖区外
	 * 模板excel导入
	 */
	public String InPrimaryOut(){
		try {
			updateExcel();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[]titles=ExcelUtil.getTitles(file);
		saveFieldsTitles(1,2,titles);
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * 模板excel导入
	 */
	public String InMiddleIn(){
		try {
			updateExcel();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[]titles=ExcelUtil.getTitles(file);
		saveFieldsTitles(2,1,titles);
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * 模板excel导入
	 */
	public String InMiddleOut(){
		try {
			updateExcel();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[]titles=ExcelUtil.getTitles(file);
		saveFieldsTitles(2,2,titles);
		return "middleOut";
	}
	
	/**
	 * Excel上传文件备份
	 */
	private void updateExcel() throws Exception{
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
	}
	
	/**
	 * 默认解析方式
	 * 不可用
	 */
	@Deprecated
	public String execute() throws Exception {
		if("1".equals(action_id)){//解析数据
			Integer year=yearService.getNews().getId();
			List<String[]>list=null;
			List<Fields>fields=null;
			if(grade_id.equals("1")){//小学
				if(type_id.equals("1")){//范围内
					fields=fieldService.getByComposite(1, 1,year);
					list=ExcelUtil.sax(file, fields);
				}else if(type_id.equals("2")){//范围外
					fields=fieldService.getByComposite(1, 2,year);
					list=ExcelUtil.sax(file, fields);
				}else{
					System.out.println("请求参数有误！");
				}
			}else if(grade_id.equals("2")){//中学
				if(type_id.equals("1")){//范围内
					fields=fieldService.getByComposite(2, 1,year);
					list=ExcelUtil.sax(file, fields);
				}else if(type_id.equals("2")){//范围外
					fields=fieldService.getByComposite(2, 2,year);
					list=ExcelUtil.sax(file, fields);
				}else{
					System.out.println("请求参数有误！");
				}
			}
			//保存学生
			saveStudents(list, fields);

		}else if("0".equals(action_id)){//解析模板
			String[]titles=ExcelUtil.getTitles(file);
			if("1".equals(grade_id)){//小学
				if("1".equals(type_id)){//范围内
					saveFieldsTitles(1,1,titles);
				}else if("2".equals(type_id)){//范围外
					saveFieldsTitles(1,2,titles);
				}else{
					System.out.println("请求参数有误！");
				}
			}else if("2".equals(grade_id)){//中学
				if("1".equals(type_id)){//范围内
					saveFieldsTitles(2,1,titles);
				}else if("2".equals(type_id)){//范围外
					saveFieldsTitles(2,2,titles);
				}else{
					System.out.println("请求参数有误！");
				}
			}
		}
		System.out.println("grade_id="+grade_id+",type_id="+type_id);
		return "primaryIn";
	}
	
	/**
	 * 小学辖区内
	 * 数据解析
	 * @return
	 */
	public String DatePrimaryIn(){
		return "addExcel";
	}
	/**
	 * 小学辖区内
	 * 数据解析
	 * @return
	 */
	public String DatePrimaryOut(){
		return "addExcel";
	}
	/**
	 * 小学辖区内
	 * 数据解析
	 * @return
	 */
	public String DateMiddleIn(){
		return "addExcel";
	}
	/**
	 * 小学辖区内
	 * 数据解析
	 * @return
	 */
	public String DateMiddleOut(){
		return "addExcel";
	}

	/**
	 * 保存学生
	 */
	private void saveStudents(List<String[]>list,List<Fields>fields){
		Grade grade=gradeService.getById(Integer.parseInt(grade_id));
		Type type=typeService.getById(Integer.parseInt(type_id));
		SchoolYear year=yearService.getNews();
		States states=statesService.getById(1);
		
		for(int i=0;i<list.size();i++){//遍历学生集合
			String[]stu=list.get(i);//待封装学生对象
			Student student=new Student();//学生对象
			for(int j=0;j<stu.length;j++){//按顺序遍历字段
				Integer index=Integer.parseInt(fields.get(j).getKeyName().substring(4));
				switch (index) {
				case 1:student.setItem1(stu[j]);
					break;
				case 2:student.setItem2(stu[j]);
					break;
				case 3:student.setItem3(stu[j]);
					break;
				case 4:student.setItem4(stu[j]);
					break;
				case 5:student.setItem5(stu[j]);
					break;
				case 6:student.setItem6(stu[j]);
					break;
				case 7:student.setItem7(stu[j]);
					break;
				case 8:student.setItem8(stu[j]);
					break;
				case 9:student.setItem9(stu[j]);
					break;
				case 10:student.setItem10(stu[j]);
					break;
				case 11:student.setItem11(stu[j]);
					break;
				case 12:student.setItem12(stu[j]);
					break;
				case 13:student.setItem13(stu[j]);
					break;
				case 14:student.setItem14(stu[j]);
					break;
				case 15:student.setItem15(stu[j]);
					break;
				case 16:student.setItem16(stu[j]);
					break;
				case 17:student.setItem17(stu[j]);
					break;
				case 18:student.setItem18(stu[j]);
					break;
				case 19:student.setItem19(stu[j]);
					break;
				case 20:student.setItem20(stu[j]);
					break;
				case 21:student.setItem21(stu[j]);
					break;
				case 22:student.setItem22(stu[j]);
					break;
				case 23:student.setItem23(stu[j]);
					break;
				case 24:student.setItem24(stu[j]);
					break;
				case 25:student.setItem25(stu[j]);
					break;
				case 26:student.setItem26(stu[j]);
					break;
				case 27:student.setItem27(stu[j]);
					break;
				case 28:student.setItem28(stu[j]);
					break;
				case 29:student.setItem29(stu[j]);
					break;
				case 30:student.setItem30(stu[j]);
					break;
				case 31:student.setItem31(stu[j]);
					break;
				case 32:student.setItem32(stu[j]);
					break;
				case 33:student.setItem33(stu[j]);
					break;
				case 34:student.setItem34(stu[j]);
					break;
				case 35:student.setItem35(stu[j]);
					break;
				case 36:student.setItem36(stu[j]);
					break;
				case 37:student.setItem37(stu[j]);
					break;
				case 38:student.setItem38(stu[j]);
					break;
				case 39:student.setItem39(stu[j]);
					break;
				case 40:student.setItem40(stu[j]);
					break;
				default:
					break;
				}
			}
			student.setGrade(grade);
			student.setType(type);
			student.setYears(year);
			student.setStates(states);
			studentService.save(student);
		}
	}

	/**
	 * 保存更新字段头
	 */
	private void saveFieldsTitles(Integer grade,Integer type,String[]titles){
		SchoolYear year=yearService.getNews();
		DueTime dueTime=dueTimeService.getByComposite(grade, type, year.getId());

		if((new Date()).after(dueTime.getStartDate())){//报名日期前后判定(报名后)
			System.out.println("=================报名期间");
		}else{//报名前(模板导入式 表头操作)
			for(int i=0;i<titles.length;i++){
				String str=titles[i];
				Fields entity=new Fields();
				entity.setGrade_id(grade);
				entity.setType_id(type);
				entity.setYear_id(year.getId());
				entity.setOrders(i+1);
				entity.setName(str);
				entity.setKeyName("item"+(i+1));
				fieldService.saveOrUpdate(entity);
			}
			for(int i=titles.length+1;i<40;i++){
				fieldService.delByComposite(grade, type, year.getId(), i);
			}
		}
	}
}
