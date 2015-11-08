package com.rongnan.dbutil.register.dao;


import java.util.List;

import com.rongnan.dbutil.jdbc.JdbcUtil;
import com.rongnan.dbutil.register.service.RegisterService;

public class Register implements RegisterService {

	private JdbcUtil utils = null;

	public Register() {
		utils = new JdbcUtil();
	}

	/*
	 * 完成了对用户注册的dao的编写
	 * 
	 * @see
	 * com.product.dbutil.register.service.RegisterService#registerUser(java
	 * .util.List)
	 */
	public boolean registerUser(List<Object> params) {
		// TODO Auto-generated method stub
		boolean flag = false;

		String sql = "insert into user(user_id,password) values(?,?)";
		try {
			// 先获得链接
			utils.getConnetion();
			flag = utils.updateByPreparedStatment(sql, params);
			System.out.println("-flag-->>" + flag);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			// 关闭数据库的链接
			utils.releaseConn();
		}
		return flag;
	}

}
