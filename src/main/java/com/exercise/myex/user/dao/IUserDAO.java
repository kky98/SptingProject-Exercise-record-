package com.exercise.myex.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.exercise.myex.user.vo.UserVO;

@Mapper
public interface IUserDAO {
	public int registUser(UserVO user);
	public UserVO loginUser(UserVO user);
}
