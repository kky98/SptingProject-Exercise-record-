package com.exercise.myex.write.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exercise.myex.write.dao.IWriteDAO;
import com.exercise.myex.write.vo.UbWriteVO;
import com.exercise.myex.write.vo.WriteVO;


@Service
public class WriteService {
 @Autowired
 IWriteDAO dao;
 
public void writeSbd(WriteVO vo) throws Exception {
	int result =dao.wirteSbd(vo);
	if(result ==0) {
		throw new Exception();
	}
}
 
public void wirteUbody(UbWriteVO vo) throws Exception {
	int result =dao.wirteUbody(vo);
	if(result ==0) {
		throw new Exception();
	}
}

 
 public void AWrite(WriteVO write) throws Exception {
	
	 int result =dao.AWrite(write);
	 if (result ==0) {
			throw new Exception();
			
		}
	
}
 public void BWrite(WriteVO write) throws Exception {
	 
	 int result =dao.BWrite(write);
	 if (result ==0) {
		 throw new Exception();
		 
	 }
	 
 }
 public List<WriteVO> getExTypeList() {
	 List<WriteVO> result =dao.getExTypeList();
	
	System.out.println(result);
		return result;
}
 public List<WriteVO> getExTitleList(String exCode) {
	 List<WriteVO> result =dao.getExTitleList(exCode);
	 
	 System.out.println(result);
	 return result;
 }
 public List<WriteVO> getExNameList(String exCode) {
	 List<WriteVO> result =dao.getExNameList(exCode);
	 
	 System.out.println(result);
	 return result;
 }

}
