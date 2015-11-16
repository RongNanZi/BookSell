/**
 * 
 */
package com.rongnan.dbutil.shopcart.dao;

import java.util.List;

import com.rongnan.dbutil.jdbc.JdbcUtil;

/**
 * @author Administrator
 *
 */
public class DelCartDao {

	private JdbcUtil db; 
	/**
	 * 
	 */
	public DelCartDao() {
		// TODO Auto-generated constructor stub
		db = new JdbcUtil();
	}
	public boolean del(String[] param,String user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			db.getConnetion();
			String[] sql = new String[param.length];
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					sql[i] = "delete from shopcart where bookid='" + param[i] + "' and id = '"+user+"'" ;
				}
			}
			flag = db.deleteByBatch(sql);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			db.releaseConn();
		}
		return flag;
	}
}
