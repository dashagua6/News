package com.hisoft.biz;

import com.hisoft.util.PageBean;

public interface INewsBiz {
	//根据用户传的页码，获取一个翻页总数据PageBean
	public PageBean getNewsBean(int num);

}
