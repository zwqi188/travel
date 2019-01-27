package com.yugii.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {
	private static ConfigUtil util = null;
	private static String driver;
	private static String url;
	private static String name;
	private static String password;
	
	static{
		Properties  props= new Properties();
		InputStream inStream = ConfigUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			props.load(inStream);
			driver = props.getProperty("jdbc.driver");
			url = props.getProperty("jdbc.url");
			name = props.getProperty("jdbc.name");
			password = props.getProperty("jdbc.password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static ConfigUtil getInstance() {
		if (util==null) {
			util = new ConfigUtil();
		}
		return util;
	}
	
	public String getDriver() {
		return driver;
	}

	public String getUrl() {
		return url;
	}
	
	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

}
