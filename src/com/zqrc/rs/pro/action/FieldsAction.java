package com.zqrc.rs.pro.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zqrc.rs.base.BaseAction;
import com.zqrc.rs.pro.entity.DueTime;
import com.zqrc.rs.pro.entity.Fields;
import com.zqrc.rs.pro.entity.SchoolYear;
import com.zqrc.rs.pro.entity.Student;

/**
 * 学生信息字段控制器
 * 
 * @author 李志飞
 *
 */
public class FieldsAction extends BaseAction<Fields>{
	private String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	private String itemList;
	public String getItemList() {
		return itemList;
	}
	public void setItemList(String itemList) {
		this.itemList = itemList;
	}
	/**
	 * 小学辖区内异步
	 * @return
	 */
	public String primaryInAdd(){
		saveFields(1, 1);
		setResult("true");
		return "types";
	}
	/**
	 * 小学辖区外异步
	 * @return
	 */
	public String primaryOutAdd(){
		saveFields(1, 2);
		setResult("true");
		return "types";
	}
	/**
	 * 中学辖区内异步
	 * @return
	 */
	public String middleInAdd(){
		saveFields(2, 1);
		setResult("true");
		return "types";
	}
	/**
	 * 中学辖区外异步
	 * @return
	 */
	public String middleOutAdd(){
		saveFields(2, 2);
		setResult("true");
		return "types";
	}
	
	/**
	 * 保存更新字段
	 */
	private void saveFields(Integer grade,Integer type){
		SchoolYear year=yearService.getNews();
		DueTime dueTime=dueTimeService.getByComposite(grade, type, year.getId());
		JSONArray array=new JSONArray(itemList);//接收到的数据解析
		
		if((new Date()).after(dueTime.getStartDate())){//报名日期前后判定(报名后)
			System.out.println("=================");
		}else{//报名前
			for(int i=0;i<array.length();i++){
				String str=((String)array.get(i)).split(":")[1];
				Fields entity=new Fields();
				entity.setGrade_id(grade);
				entity.setType_id(type);
				entity.setYear_id(year.getId());
				entity.setOrders(i+1);
				entity.setName(str);
				entity.setKeyName("item"+(i+1));
				fieldService.saveOrUpdate(entity);
			}
			for(int i=array.length()+1;i<40;i++){
				fieldService.delByComposite(grade, type, year.getId(), i);
			}
		}
	}
	
	/**
	 * 检验字段合法性
	 * @param sheet
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	public Boolean check(Sheet sheet,Integer grade,Integer type,Integer year){
		Boolean b = true;
		List<Fields> list_fields = fieldService.getByComposite(grade,type,year);
		for (int j = 0; j < sheet.getColumns(); j++) {//sheet.getColumns():获得表格文件列数
            Cell cell = sheet.getCell(j,1);
            System.out.print(cell.getContents());
            if(cell.getContents().equals(list_fields.get(j).getName())){
            }else{
            	b = false;
            }
        }
		return b;
	}
	
	/**
	 * 获取表头
	 * @return
	 */
	public String SheetTitles(){
		
		return "";
	}
	
//	写入数据库
	public void Demo(File files) {
        File file = files;
        try{
            if(file.exists()){//判断文件是否存在
                //创建工作簿
                Workbook workbook = Workbook.getWorkbook(file);
                //获得第一个工作表sheet1
                Sheet sheet = workbook.getSheet(0);
                
                List<Student> list_fields = new ArrayList<Student>();
                
                if(check(sheet,1,1,1)){
//                	获取排序表
                	List<Fields> list_orders = fieldService.getByComposite(1,1,1);//表头
                	int[] orders = new int[list_orders.size()];
                    //获得数据
                    for (int i = 0; i < sheet.getRows(); i++) {//sheet.getRows():获得表格文件行数
                        for (int j = 0; j < sheet.getColumns(); j++) {//sheet.getColumns():获得表格文件列数
                            Cell cell = sheet.getCell(j,i);
                        }
                    }
                }
                workbook.close();//关闭
            }else{
                System.out.println("文件不存在");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

	
	/**
	 * 小学辖区内
	 * @return
	 */
	public String primaryIn() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(1, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "primaryIn";
	}
	
	/**
	 * 小学辖区外
	 * @return
	 */
	public String primaryOut() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(1, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "primaryOut";
	}
	
	/**
	 * 中学辖区内
	 * @return
	 */
	public String middleIn() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(2, 1, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "middleIn";
	}
	
	/**
	 * 中学辖区外
	 * @return
	 */
	public String middleOut() {
		SchoolYear year=yearService.getNews();
		List<Fields> fields=getFields(2, 2, year.getId());
		ValueStack stack=ActionContext.getContext().getValueStack();
		stack.set("beans", fields);
		return "middleOut";
	}
	
	/**
	 * 通用代码
	 * @param grade
	 * @param type
	 * @param year
	 * @return
	 */
	private List<Fields> getFields(Integer grade, Integer type, Integer year){
		return fieldService.getByComposite(grade, type, year);
	}
	
}
