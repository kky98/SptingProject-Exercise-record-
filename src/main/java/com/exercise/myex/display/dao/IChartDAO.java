package com.exercise.myex.display.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exercise.myex.display.vo.GraphVO;
import com.exercise.myex.write.vo.WriteVO;

@Mapper
public interface IChartDAO {
	public List<GraphVO> getChartItem(String userId);
	public List<GraphVO> getSbdChartItem(String userId);
	public List<WriteVO> getCalItem(String userId);
}
