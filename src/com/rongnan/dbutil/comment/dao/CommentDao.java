package com.rongnan.dbutil.comment.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;




import com.rongnan.dbutil.comment.service.CommentService;
import com.rongnan.dbutil.jdbc.JdbcUtil;

public class CommentDao implements CommentService {
	
	private JdbcUtil db;
	public CommentDao() {
		// TODO Auto-generated constructor stub
		db = new JdbcUtil();
	}

	@Override
	public List<Map<String, Object>> viewXML() {
		// TODO Auto-generated method stub
		List<Map<String,Object>> mlist = new ArrayList<Map<String,Object>>();
		String sql = "select * from comment";
		
		
		try {
			db.getConnetion();
			mlist = db.findMoreResult(sql, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.releaseConn();
		}
		
		
		return mlist;
	}

	@Override
	public boolean addNode(List<Object> param) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String sql = "insert into comment(user,comment,time) value(?,?,?);";
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

}
