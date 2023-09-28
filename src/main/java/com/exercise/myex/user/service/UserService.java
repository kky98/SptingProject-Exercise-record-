package com.exercise.myex.user.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exercise.myex.user.dao.IUserDAO;
import com.exercise.myex.user.vo.UserVO;

@Service
public class UserService {
 @Autowired
 IUserDAO dao;
 public void registUser(UserVO user) throws Exception {
	int result =dao.registUser(user);
	if(result ==0) {
		throw new Exception();
	}
	
}
 public UserVO loginUser(UserVO user) {
	 UserVO result =dao.loginUser(user);
	 if(result ==null) {
		 return null;
	 }
	 return result;
 }
 
}
