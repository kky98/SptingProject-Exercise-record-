package com.exercise.myex.write.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.exercise.myex.write.vo.UbWriteVO;
import com.exercise.myex.write.vo.WriteVO;




@Mapper
public interface IWriteDAO {
	public List<WriteVO> getExTypeList();
	public List<WriteVO> getExTitleList(String exCode);
	public List<WriteVO> getExNameList(String exCode);
	
	public int AWrite(WriteVO write);
	public int BWrite(WriteVO write);
	
	public int wirteSbd(WriteVO vo);
	public int wirteUbody(UbWriteVO vo);
}
