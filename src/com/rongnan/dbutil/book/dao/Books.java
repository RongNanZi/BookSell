package com.rongnan.dbutil.book.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rongnan.dbutil.book.service.BookService;
import com.rongnan.dbutil.jdbc.JdbcUtil;

public class Books implements BookService {

	private JdbcUtil utils = null;
	public Books() {
		// TODO Auto-generated constructor stub
		utils = new JdbcUtil();
	}

	@Override
	public List<Map<String, Object>> findBooks(String params) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();

		String sql = "select * from book where (1=1) ";
		StringBuffer temp = new StringBuffer(sql);
		if(!params.isEmpty()&params!="")
		temp.append("and name='"+params+"';");
		System.out.println(temp.toString());
		
		try {
			// �Ȼ������
			utils.getConnetion();
			result = utils.findMoreResult(temp.toString(), null);
			if(result.isEmpty())
				System.out.println("����ǿյ�");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			// �ر����ݿ������
			utils.releaseConn();
		}
		return result;
	}

}
