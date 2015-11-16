package com.rongnan.dbutil.shopcart.dao;

import com.rongnan.dbutil.jdbc.JdbcUtil;

public class DelallDao {

	private JdbcUtil db; 
	public DelallDao() {
		// TODO Auto-generated constructor stub
		db = new JdbcUtil();
	}

	
	
	public boolean del(String user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			db.getConnetion();
			String[] sql =new String[] { "delete from shopcart where  id = '"+user+"'" };
			
			flag = db.deleteByBatch(sql);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			db.releaseConn();
		}
		return flag;
	}
}
