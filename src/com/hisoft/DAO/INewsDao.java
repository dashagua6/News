package com.hisoft.DAO;

import java.util.List;

import com.hisoft.entity.NewsInfo;

public interface INewsDao {
	//�����û�����ҳ�룬��ѯ����ҳ������
	public List getNewsData(int num);
	//���������
	public int getTotalRow();
	public boolean doCreate(NewsInfo news);
	
	
}
