package com.yugii.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;

public class DBUtil {
	private static Connection connection = null;
	private static DBUtil util = null;
	
	static{
		try {
			Class.forName(ConfigUtil.getInstance().getDriver());
			connection = DriverManager.getConnection(
					ConfigUtil.getInstance().getUrl(), ConfigUtil.getInstance().getName(),
					ConfigUtil.getInstance().getPassword());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static DBUtil getInstance() {
		if (util == null) {
			util = new DBUtil();
		}
		return util;
	}
	
	public Connection getConnection() {
		return connection;
	}
	
	public void close() {
		if (connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void insert(String sql, Object...params){
		executeUpdate(sql, params);
	}
	
	public void delete(String sql, Object...params){
		executeUpdate(sql, params);
	}
	
	public void update(String sql, Object...params){
		executeUpdate(sql, params);
	}
	
	public CachedRowSet query(String sql, Object...params){
		return executeQuery(sql, params);
	}
	
	private CachedRowSet executeQuery(String sql, Object...params){
		CachedRowSet crs=null;
		try {
			crs=new CachedRowSetImpl();
			PreparedStatement pst=connection.prepareStatement(sql);
			setParams(pst, params);
			ResultSet rs=pst.executeQuery();
			crs.populate(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return crs;
		
	}
	
	private void executeUpdate(String sql, Object...params){
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(sql);
			setParams(pst, params);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void setParams(PreparedStatement pst, Object...params){
		if(params!=null){
			for(int i=0;i<params.length;i++){
				try {
					pst.setObject(i+1, params[i]);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}	
