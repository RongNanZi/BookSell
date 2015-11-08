package com.rongnan.dbutil.shopcart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rongnan.dbutil.jdbc.JdbcUtil;
import com.rongnan.dbutil.shopcart.service.ShopcartService;

public class ShopcartDao implements ShopcartService {

	private JdbcUtil db; 
	public ShopcartDao() {
		// TODO Auto-generated constructor stub
		db = new JdbcUtil();
	}

	@Override
	public boolean add(List<Object> param) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		String sql = "insert into shopcart(id,bookid) values(?,?);";
		try{
			db.getConnetion();
			flag = db.updateByPreparedStatment(sql, param);
			System.out.println("-flag-->>" + flag);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			// 关闭数据库的链接
			db.releaseConn();
		}
		
		return flag;
	}

	@Override
	public List<Map<String, Object>> view(String str) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String sql = "select * from book where id in (select bookid from shopcart where id='"+str+"');";
		
		try {
			db.getConnetion();
			list = db.findMoreResult(sql, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 关闭数据库的链接
			db.releaseConn();
		}
		return list;
	}

}
