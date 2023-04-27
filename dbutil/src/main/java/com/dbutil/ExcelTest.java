package com.dbutil;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.entity.User;
import com.model.Model;

public class ExcelTest {

//    public static void main(String[] args) throws Exception {
//        String fileName = "C:\\Users\\ARHM\\Desktop\\11.xlsx";
//        readExcel(fileName);
//    }
	public static ArrayList<User> readExcel2(String fileName)
	{
		System.out.println(fileName);
		ArrayList<User> us = new ArrayList<>();
		Model m = new Model();

        Workbook workbook = null;
        Row row = null;
        //获取Excel文档
        workbook = getWorkbook(fileName);
        //获取Excel文档的第一个sheet页
        Sheet sheet = workbook.getSheetAt(0);
        //获取文档中已保存数据的行数
        int rowNum = sheet.getPhysicalNumberOfRows();
        //获取第一行
        row = sheet.getRow(0);
        //获取当前行已保存数据的最大列数
        int colnum = row.getPhysicalNumberOfCells();
        for (int i = 1; i < rowNum; i++) {
            row = sheet.getRow(i);//System.out.println("row--> "+row);
            if (null != row)
            {
                for (int j = 0; j < colnum;) {
                	User u = new User();
                    Cell id = row.getCell(j);
                    Cell name = row.getCell(j+1);
                    Cell password = row.getCell(j+2);
                	u.setId((int)id.getNumericCellValue());
                	u.setName((String)name.getRichStringCellValue().getString());
                	u.setPassword((String)password.getRichStringCellValue().getString());
                	int s = m.insert(u.getId(), u.getName(), u.getPassword());
                	if(s==1)
                		u.setZt("导入成功");
                	else
                		u.setZt("导入失败，id重复");
                	us.add(u);
//                    
                    j=j+3;System.out.println();
                }
            }
        }
    
		return us;
		
	
	}


    private static Workbook getWorkbook(String fileName) {//根据后缀获取Excel表格
        Workbook workbook = null;
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        InputStream in = null;
        try {
            in = new FileInputStream(fileName);
            if ("xls".equals(suffix))
            {
                workbook = new HSSFWorkbook(in);
            }
            else if ("xlsx".equals(suffix))
            {
                workbook = new XSSFWorkbook(in);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return workbook;
    }
}