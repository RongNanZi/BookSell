package com.rongnan.dbutil;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




public class JdbcUtil  {
	
	private final String DBUSERNAME = "rongnan";
	private final String DBUSERPASSWORD = "rongnan";
	
	private final String  MYSQLDRIVER = "com.mysql.jdbc.Driver";
	private final String  MYSQLURL = "jdbc:mysql://localhost:3306/rongnan_db";
	
	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	private Statement stmt;
	
	//register the MYSQL driver 
	public JdbcUtil() {
		
		try {
			
			Class.forName(MYSQLDRIVER);
			System.out.print("mysql注册驱动成功");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	
	
	//get the SQL connection
	public Connection getConnetion() {
		
		try {
			connection = DriverManager.getConnection(MYSQLURL,
													DBUSERNAME,
													DBUSERPASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
	}
	//update the SQL database
	public boolean updateByPreparedStatment(String sql,
											List<Object> paraments) 
											throws SQLException {
		
		boolean flag = false;
		int result = -1;//it show the num of changed line in table
		
		pstmt = connection.prepareStatement(sql);
		
		int index = 1;
		if(paraments != null && !paraments.isEmpty()) {
			for(int i = 0;i < paraments.size();i++){
				pstmt.setObject(index++,paraments.get(i));
			}
		}
		
		result = pstmt.executeUpdate();
		flag = result > 0? true : false; 
		return flag;
		
	}
	
	//return the single record from table
	public Map<String, Object> findSimpleResult(String sql, 
												List<Object> params)
												throws SQLException  {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		
		if (params != null && !params.isEmpty()) {
			
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		
		resultSet = pstmt.executeQuery();// return the result 
		ResultSetMetaData metaData = resultSet.getMetaData();
		
		int col_len = metaData.getColumnCount();// 获得列的名称
		while (resultSet.next()) {
			for (int i = 0; i < col_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
		}
		return map;
	}

	//return multiple records from table
	public List<Map<String, Object>> findMoreResult(String sql,
			List<Object> params) throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
			list.add(map);
		}
		return list;
	}

	// jdbc的封装可以用反射机制来封装：
	public <T> T findSimpleRefResult(String sql, List<Object> params,
			Class<T> cls) throws Exception {
		T resultObject = null;
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			// 通过反射机制创建实例
			resultObject = cls.newInstance();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true);// 打开javabean的访问private权限
				field.set(resultObject, cols_value);
			}
		}
		return resultObject;
	}

	/**
	 * 通过反射机制访问数据库
	 * 
	 * @param <T>
	 * @param sql
	 * @param params
	 * @param cls
	 * @return
	 * @throws Exception
	 */
	public <T> List<T> findMoreRefResult(String sql, List<Object> params,
			Class<T> cls) throws Exception {
		List<T> list = new ArrayList<T>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			T resultObject = cls.newInstance();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				Field field = cls.getDeclaredField(cols_name);
				field.setAccessible(true);
				field.set(resultObject, cols_value);
			}
			list.add(resultObject);
		}
		return list;
	}

	public void releaseConn() {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	public static void main(String[] args) throws SQLException {
		
		JdbcUtil m = new JdbcUtil();
		Connection c = m.getConnetion();
		String sql = "insert into pro(pro_id,pro_price,pro_img) values(?,?,?)";
		List<Object> test = new ArrayList<Object>();
		
		test.add(new String("234"));
		test.add(new Double("12.5"));
		test.add(new String("c:/image/first.jpg"));
		
		m.updateByPreparedStatment(sql, test);
		
		m.releaseConn();
		
		
	}
	
	
	
	
	
	
	
	
	
}
