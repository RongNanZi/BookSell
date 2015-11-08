package com.rongnan.dbutil.login.dao;

import java.util.List;
import java.util.Map;

import com.rongnan.dbutil.jdbc.JdbcUtil;
import com.rongnan.dbutil.login.service.LoginService;

public class Login implements LoginService {

	private JdbcUtil mJdbcUtil = null;
	 
	public Login()	{
		
		mJdbcUtil = new JdbcUtil();
	}
	
	
	@Override
	public boolean loginService(List<Object> paraments) {
		// TODO Auto-generated method stub
		
		
		boolean flag = false;
		
		String sql = "select * from user where user_id=? and password=?";
		try{
			
			mJdbcUtil.getConnetion();
			Map<String,Object> map= mJdbcUtil.findSimpleResult(sql, paraments);
			flag = map.isEmpty()?false:true;
			System.out.println("-flag-->>" + flag);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			mJdbcUtil.releaseConn();
		}
		
		
		return flag;
	}

	
}
