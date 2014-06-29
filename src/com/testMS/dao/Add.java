package com.testMS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.testMS.pojo.*;
import com.testMS.util.Connector;

public class Add {

	public void addNews(News news){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			//调用JDBC_Connection类的getConnection方法连接数据库
			conn = Connector.getConnection();
			//添加数据的sql语句
			String sql = "insert into news(title,data,content) values(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, news.getTitle());//把添加的mno值存入pstm对象中，int类型的值用setInt（）方法
			//把添加的name值存入pstm对象中String类型的值用setString方法

			//获得当前时间
			Date currentTime = new Date();   
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   
			String dateString = formatter.format(currentTime); 

			pstm.setString(2,dateString);			
			pstm.setString(3,news.getContent());//把添加的address值存入pstm对象中

			pstm.executeUpdate();//提交pstm对象
			System.out.println("添加成功！");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connector.free(rs, conn, pstm);
		}
	}
	
	public void addActivity(Activity activity){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			//调用JDBC_Connection类的getConnection方法连接数据库
			conn = Connector.getConnection();
			//添加数据的sql语句
			String sql = "insert into activity(title,data,images,content) values(?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, activity.getTitle());//把添加的mno值存入pstm对象中，int类型的值用setInt（）方法
			//把添加的name值存入pstm对象中String类型的值用setString方法

			//获得当前时间
			Date currentTime = new Date();   
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   
			String dateString = formatter.format(currentTime); 

			pstm.setString(2,dateString);
			pstm.setString(3,activity.getImages());
			pstm.setString(4,activity.getContent());

			pstm.executeUpdate();//提交pstm对象
			System.out.println("添加成功！");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connector.free(rs, conn, pstm);
		}
	}
}

