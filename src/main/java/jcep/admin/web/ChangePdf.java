package jcep.admin.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.itextpdf.text.Document;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class ChangePdf {
	public static void main(String[] args) throws Exception {
		FileInputStream input_document = new FileInputStream(new File("C:\\change_pdf.xls"));
		
		HSSFWorkbook my_xls_workbook = new HSSFWorkbook(input_document);
		
		HSSFSheet my_worksheet = my_xls_workbook.getSheetAt(0);
		
		Iterator<Row> rowIterator = my_worksheet.iterator();
		
		Document iText_xls_2_pdf = new Document();
		PdfWriter.getInstance(iText_xls_2_pdf, new FileOutputStream("Excel2PDF_Output.pdf"));
		iText_xls_2_pdf.open();
		
		PdfPTable my_table = new PdfPTable(2);
		
		PdfPCell table_cell;
		
		while (rowIterator.hasNext()) { 
			Row row = rowIterator.next(); 
			Iterator<Cell> cellIterator = row.cellIterator(); 
			while (cellIterator.hasNext()) { 
				Cell cell = cellIterator.next(); 
				switch (cell.getCellType()){
				case Cell.CELL_TYPE_STRING:
				table_cell = new PdfPCell(new Phrase(cell.getStringCellValue()));
				my_table.addCell(table_cell);
				break;
				}
			}
		}
		iText_xls_2_pdf.add(my_table);
		iText_xls_2_pdf.close();
		
		input_document.close();
		
		
	}
}
