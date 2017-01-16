package com.hisoft.biz;

import java.util.List;

import com.hisoft.DAO.INewsDao;
import com.hisoft.DAO.NewsDaoImpl;
import com.hisoft.entity.NewsInfo;
import com.hisoft.util.PageBean;

public class NewsBizImpl implements INewsBiz {
	 INewsDao dao=  new NewsDaoImpl();
	@Override
	public PageBean getNewsBean(int num) {
		//根据用户传的页码，获取一个翻页总数据PageBean
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(num);
		//总条数
		int totalRow =dao.getTotalRow();
		pageBean.setTotalRow(totalRow);
		
		//总页数
		
		//当前页数据
		List list = dao.getNewsData(num);
		pageBean.setCurrentPageData(list);
		
		return pageBean;
	}
	public static void main(String[] args) {
		NewsBizImpl news = new NewsBizImpl();
		int num=2;
		PageBean newsBean = news.getNewsBean(num);
		List currentPageData = newsBean.getCurrentPageData();
		for (int i = 0; i < currentPageData.size(); i++) {
			NewsInfo news1 =(NewsInfo) currentPageData.get(i);
			System.out.println(news1.getContent());
			System.out.println(news1.getAuthor());
			System.out.println("::::"+news1.getId());
			System.out.println(news1.getTitle());
			
		}
		
	}

}
