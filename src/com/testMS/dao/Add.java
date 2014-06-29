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
			//����JDBC_Connection���getConnection�����������ݿ�
			conn = Connector.getConnection();
			//������ݵ�sql���
			String sql = "insert into news(title,data,content) values(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, news.getTitle());//����ӵ�mnoֵ����pstm�����У�int���͵�ֵ��setInt��������
			//����ӵ�nameֵ����pstm������String���͵�ֵ��setString����

			//��õ�ǰʱ��
			Date currentTime = new Date();   
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   
			String dateString = formatter.format(currentTime); 

			pstm.setString(2,dateString);			
			pstm.setString(3,news.getContent());//����ӵ�addressֵ����pstm������

			pstm.executeUpdate();//�ύpstm����
			System.out.println("��ӳɹ���");

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
			//����JDBC_Connection���getConnection�����������ݿ�
			conn = Connector.getConnection();
			//������ݵ�sql���
			String sql = "insert into activity(title,data,images,content) values(?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, activity.getTitle());//����ӵ�mnoֵ����pstm�����У�int���͵�ֵ��setInt��������
			//����ӵ�nameֵ����pstm������String���͵�ֵ��setString����

			//��õ�ǰʱ��
			Date currentTime = new Date();   
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   
			String dateString = formatter.format(currentTime); 

			pstm.setString(2,dateString);
			pstm.setString(3,activity.getImages());
			pstm.setString(4,activity.getContent());

			pstm.executeUpdate();//�ύpstm����
			System.out.println("��ӳɹ���");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Connector.free(rs, conn, pstm);
		}
	}
}

