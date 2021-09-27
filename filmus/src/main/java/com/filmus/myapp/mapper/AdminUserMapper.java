package com.filmus.myapp.mapper;

import java.util.List;

import com.filmus.myapp.domain.Criteria;
import com.filmus.myapp.domain.UserCountsVO;
import com.filmus.myapp.domain.UserVO;

public interface AdminUserMapper {

	public abstract List<UserVO> getList(Criteria cri);
	
	public abstract int getTotalCount(Criteria cri);

	public abstract int updateIsAdmin(Integer userId);
	
	public abstract UserCountsVO getUsersCount();
	
}//end interface
