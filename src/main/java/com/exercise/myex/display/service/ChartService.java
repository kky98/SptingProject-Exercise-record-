package com.exercise.myex.display.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exercise.myex.display.dao.IChartDAO;
import com.exercise.myex.display.vo.GraphVO;
import com.exercise.myex.write.vo.WriteVO;



@Service
public class ChartService {
	@Autowired
	IChartDAO dao;
	
	public List<GraphVO> getChartItem(String userId){
		List<GraphVO> result= dao.getChartItem(userId);
		return result;
	}
	public List<GraphVO> getSbdChartItem(String userId){
		List<GraphVO> result= dao.getSbdChartItem(userId);
		return result;
	}
	public List<WriteVO> getCalItem(String userId){
		List<WriteVO> result= dao.getCalItem(userId);
		return result;
	}

}
