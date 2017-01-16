package com.hisoft.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hisoft.entity.NewsInfo;

public class NewsDaoImpl extends BaseDao implements INewsDao {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 根据用户传的页码，查询到该页的数据
	@Override
	public List getNewsData(int num) {
		con = this.getConnection();
		String sql = "select * from newsinfo limit ?,5";
		try {
			PreparedStatement psmt = con.prepareStatement(sql);
			int startRow = (num - 1) * 5;
			psmt.setInt(1, startRow);
			rs = psmt.executeQuery();
			ArrayList<NewsInfo> arrayList = new ArrayList<>();
			while (rs.next()) {
				NewsInfo newsInfo = new NewsInfo();
				newsInfo.setId(rs.getInt(1));
				newsInfo.setType(rs.getString(2));
				newsInfo.setTitle(rs.getString(3));
				newsInfo.setContent(rs.getString(4));
				newsInfo.setAuthor(rs.getString(5));
				newsInfo.setCreattime(rs.getString(6));
				newsInfo.setImg(rs.getString(7));
				arrayList.add(newsInfo);
			}
			return arrayList;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	// 算出总条数
	@Override
	public int getTotalRow() {
		con = this.getConnection();
		String sql = "SELECT COUNT(id) from newsinfo";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			int num = 0;
			if (rs.next()) {
				num = rs.getInt(1);
			}
			return num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean doCreate(NewsInfo news) {
		// TODO Auto-generated method stub
		return false;
	}

}
