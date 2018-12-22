package com.cqhot.app.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.cqhot.app.entity.Project;

/** 
 * 工具类，Excel导入 
 * Function: TODO ADD FUNCTION. 
 * Reason: TODO ADD REASON(可选).  
 * date: 2018年12月22日 上午10:39:36  
 * 
 * @author herunchen
 * @version  1.0
 * @since JDK 1.8
 */

public class ExcelImportUtil<T> {
	
	
	/**
	 * Excel通过上传导入成集合
	 * @param multipartFile 实现文件上传
	 * @param cls 泛型对应的类
	 * @param fileds 导入对应的字段,必须按对应的顺序排列
	 * @return List<T> 泛型对应的集合
	 */
	
	public List<T> getAllData(MultipartFile multipartFile, Class<T> cls, String[] fileds)
			throws Exception {
		String fileName =multipartFile.getOriginalFilename();
		String prefix = "xls";
		if(fileName.toLowerCase().endsWith("xls")){    
			prefix = "xls";   
        }else if(fileName.toLowerCase().endsWith("xlsx")){  
        	prefix = "xlsx";
        }else{  
        	throw new RuntimeException("文档格式不正确!");
        } 
		return this.getAllData(multipartFile.getInputStream(), 0, 1, cls, fileds, prefix);
	}

	/**
	 * Excel通过文件导入成集合
	 * @param file 文件
	 * @param sheetIndex excel工作簿下标
	 * @param startRow 从第几行开始读取数据
	 * @param cls 泛型对应的类
	 * @param fileds 导入对应的字段,必须按对应的顺序排列
	 * @param prefix 文件后缀
	 * @return List<T> 泛型对应的集合
	 */
	
	public List<T> getAllData(File file, int sheetIndex, int startRow, Class<T> cls, String[] fileds, String prefix)
			throws Exception {
		InputStream is = new FileInputStream(file);
		return this.getAllData(is, sheetIndex, startRow, cls, fileds, prefix);
	}
	
	
	
	/**
	 * Excel通过流导入成集合
	 * @param is  从流中读取数据
	 * @param sheetIndex excel工作簿下标
	 * @param startRow 从第几行开始读取数据
	 * @param cls 泛型对应的类
	 * @param fileds 导入对应的字段,必须按对应的顺序排列
	 * @param prefix 文件后缀
	 * @return List<T> 泛型对应的集合
	 */
	
	public List<T> getAllData(InputStream is, int sheetIndex, int startRow, Class<T> cls, String[] fileds, String prefix)
			throws Exception {
		List<T> list = new ArrayList<T>();
		Workbook wb = null;
		Object value = null;
		if ("xls".equals(prefix)) {
			wb = new HSSFWorkbook(is);
		} else if ("xlsx".equals(prefix)) {
			wb = new XSSFWorkbook(is);
		} else {
			is.close();
			throw new Exception("您的文档格式不正确！");
		}
		Sheet sheet = wb.getSheetAt(sheetIndex);
		int columnNum = sheet.getRow(0).getLastCellNum() - sheet.getRow(0).getFirstCellNum();
		System.out.println(columnNum);
		// 得到所有字段
		Field filed[] = cls.getDeclaredFields();
		int endRow = sheet.getLastRowNum();

		for (int i = startRow; i <= endRow; i++) {
			Row row = sheet.getRow(i);

			if (isBlank(row)) {
				continue;
			}

			// 利用反射创建新对象
			T t = cls.newInstance();

			for (int j = 0; j < columnNum; j++) {

				Cell cell = row.getCell((short) j);

				value = getValue(cell);
				// 添加到需要导出的字段的方法
				String fieldname = fileds[j];
				if(fieldname==null||"".equals(fieldname)){
					continue;
				}
				Class<?> paramCls = null;
				for (int k = 0; k < filed.length; k++) {
					
					if (fieldname.equals(filed[k].getName())) {
						paramCls = filed[k].getType();
						break;
					}
				}
				// 利用反射得到值
				String setMethodName = "set" + fieldname.substring(0, 1).toUpperCase() + fieldname.substring(1);
				Method setMethod = cls.getDeclaredMethod(setMethodName, new Class[] { paramCls });
				// System.out.println(setMethodName);
				// 此处应对不同的类型分别处理
				try {
					// 判断获取的值是否为null，为null就不存储
					if (value == null || "".equals(value)) {
						continue;
					}
					if (paramCls.equals(Long.class) || paramCls.toString().equals("long")) {
						Long l = Long.parseLong(value.toString());
						setMethod.invoke(t, new Object[] { l });
					} else if (paramCls.equals(Boolean.class) || paramCls.toString().equals("boolean")) {
						if (!value.toString().toUpperCase().equals("TRUE")) {
							throw new Exception("第" + (i + 1) + "行" + (j + 1) + "列数据格式有错误！");
						}
						Boolean b = Boolean.parseBoolean(value.toString());
						setMethod.invoke(t, new Object[] { b });
					} else if (paramCls.equals(Date.class) || paramCls.toString().equals("date")) {
						if(value.toString().length()==6){
							Date date = parseDate(value.toString(), "yyyyMM");
							setMethod.invoke(t, new Object[] { date });
						}else{
							Date date = parseDate(value.toString(), "yyyyMMdd");
							setMethod.invoke(t, new Object[] { date });
						}						
						
					} else if (paramCls.equals(double.class) || paramCls.toString().equals("doulbe")) {
						Double d = Double.parseDouble(value.toString());
						setMethod.invoke(t, new Object[] { d });
					} else if (paramCls.equals(Double.class) || paramCls.toString().equals("Double")) {
						Double d = Double.parseDouble(value.toString());
						setMethod.invoke(t, new Object[] { d });
					} else if (paramCls.equals(Integer.class) || paramCls.toString().equals("int")) {
						Integer integer = Integer.parseInt(value.toString());
						setMethod.invoke(t, new Object[] {integer});
					}else {
						setMethod.invoke(t, new Object[] { value.toString() });
					}
				} catch (Exception e) {
					e.printStackTrace();
					is.close();
					throw new Exception("第" + (i + 1) + "行" + (j + 1) + "列数据格式有错误！");
				}

			}
			list.add(t);
		}
		is.close();
		return list;
	}

	/**
	 * 从excle中获取正确格式的值
	 * @param cell 表示列
	 * @return Object Java顶级父类
	 */
	public static Object getValue(Cell cell) {
		Object value = null;
		if (cell != null) {
			int type=cell.getCellType();
			if(3 == type){
				value = "";
			}else if(4 ==type){
				value = cell.getBooleanCellValue();
			}else if(0 == type){
				if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式  	               
					SimpleDateFormat sdf = null;  
	                if (cell.getCellStyle().getDataFormat() == HSSFDataFormat  
	                        .getBuiltinFormat("h:mm")) {  
	                    sdf = new SimpleDateFormat("HH:mm");  
	                } else {// 日期  
	                    sdf = new SimpleDateFormat("yyyy-MM-dd");  
	                }  
	                Date date = cell.getDateCellValue();  
	                value = sdf.format(date);  
	            } else if (cell.getCellStyle().getDataFormat() == 58) {  
	                // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)  
	                //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	                value= cell.getNumericCellValue();  
	            } else {  
	            	DecimalFormat df = new DecimalFormat("0.############################");    
	            	value = df.format(cell.getNumericCellValue());    
	            	//value = cell.getNumericCellValue();  
	             /*   CellStyle style = cell.getCellStyle();  
	                DecimalFormat format = new DecimalFormat();  
	                String temp = style.getDataFormatString();  
	                // 单元格设置成常规  
	                if (temp.equals("General")) {  
	                    format.applyPattern("#");  
	                }  
	                value = format.format(value); */ 
	            }  
				//value = cell.getNumericCellValue();
				//去除多余的.0
				if(value.toString().endsWith(".0")){
					value = value.toString().split("\\.")[0];
				}
			}else if(1 == type){
				value = cell.getRichStringCellValue().getString();
			}else if(5 == type){
				value = cell.getErrorCellValue();
			}else if(2 == type){
				value = cell.getRichStringCellValue().getString();
			}else{
				value = "";
			}			
		}
		return value;
	}

	/**
	 * 检查空行
	 * @param row 表示行
	 * @return boolean 判断结果
	 */
	public boolean isBlank(Row row) {
		if(row == null){
			return true;
		};
		int column = row.getLastCellNum();
		String str = "";
		for (int i = 0; i <= column; i++) {
			Cell cell = row.getCell(i);
			Object value = getValue(cell);
			if (value != null) {
				str += value.toString();
			}
		}
		if ("".equals(str)) {
			return true;
		}
		return false;
	}

	/**
	 * 将String格式化为Date
	 * @param date 目标字符串
	 * @param pattern 转换日期的格式
	 * @return Date 设置系统日期和时间
	 * @throws ParseException 解析异常，时间格式错误
	 */
	public static Date parseDate(String date, String pattern) throws ParseException {
		try {
			return new SimpleDateFormat(pattern).parse(date);
		} catch (ParseException e) {
			throw new IllegalArgumentException("don't format type");
		}
	}
	
	public List<Map<String,Object>> getAllDataToMap(MultipartFile multipartFile, int sheetIndex, int startRow,String[] fileds)
			throws Exception {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Workbook wb = null;
		Object value = null;
		String fileName =multipartFile.getOriginalFilename();
		String prefix = "xls";
		if(fileName.toLowerCase().endsWith("xls")){    
			prefix = "xls";   
        }else if(fileName.toLowerCase().endsWith("xlsx")){  
        	prefix = "xlsx";
        }else{  
        	multipartFile.getInputStream().close();
        	throw new RuntimeException("文档格式不正确!");
        }
		if ("xls".equals(prefix)) {
			wb = new HSSFWorkbook(multipartFile.getInputStream());
		} else if ("xlsx".equals(prefix)) {
			wb = new XSSFWorkbook(multipartFile.getInputStream());
		} 
		
		Sheet sheet = wb.getSheetAt(sheetIndex);
		int columnNum = sheet.getRow(0).getLastCellNum() - sheet.getRow(0).getFirstCellNum();
		int endRow = sheet.getLastRowNum();
		for (int i = startRow; i <= endRow; i++) {
			Row row = sheet.getRow(i);
			Map<String,Object> map = new HashMap<String,Object>();
			for (int j = 0; j < columnNum; j++) {
				Cell cell = row.getCell((short) j);
				value = getValue(cell);
				map.put(fileds[j], value);
			}
			list.add(map);
		}
		multipartFile.getInputStream().close();
		return list;
	}

	
	public static void main(String[] args) {
//		File f = new File("C:\\Users\\Administrator\\Desktop\\a.xlsx");
//		String[] field = new String[]{"prjId","prjName","deptId","beginDate","endDate","valid","note"};
//		ExcelImportUtil<Project> util = new ExcelImportUtil<Project>();
//		try {
//			List<Project> list = util.getAllData(f,0,1,Project.class, field,"xlsx");
//			for(int i = 0;i<list.size();i++) {
//				System.out.println(list.get(i).getPrjName());
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		try {
//			List<XxontBlJpfxsxsjPo> list = util.getAllData(f,0,1,XxontBlJpfxsxsjPo.class, field,"xlsx");
//			for(int i = 0;i<list.size();i++) {
//				System.out.println(list.get(i).getENTERPRICE_ABB());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
