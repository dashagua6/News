package com.hisoft.DAO;

import java.util.List;

public interface INewsDao {
	//根据用户传的页码，查询到该页的数据
	
	public List getNewsData(int num);
	//算出总条数
	public int getTotalRow();
	
	
}
