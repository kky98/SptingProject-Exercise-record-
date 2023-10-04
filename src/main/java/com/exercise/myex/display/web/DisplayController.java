package com.exercise.myex.display.web;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exercise.myex.display.service.ChartService;
import com.exercise.myex.display.vo.GraphVO;
import com.exercise.myex.write.vo.WriteVO;


@Controller
public class DisplayController {
	
	@Autowired
	ChartService service;
	
	@RequestMapping("/display/cal")
	public String cal_display() {
		return "display/cal_display";
		
	}
	@PostMapping("/display/calDo")
	public @ResponseBody List<WriteVO> getCalItem(Model model, String userId) throws Exception {
		
		System.out.println("아이디"+userId);
		List<WriteVO> result = service.getCalItem(userId);
		System.out.println("list"+result);
		model.addAttribute("result", result);
		return result;
	}
	
	@PostMapping("/display/bodychart")
	public @ResponseBody List<GraphVO> getBodyChartItem(Model model, String userId) throws Exception {
		
		System.out.println("아이디"+userId);
		List<GraphVO> result = service.getChartItem(userId);
		System.out.println("list"+result);
		model.addAttribute("result", result);
		return result;
	}
	@PostMapping("/display/sbdchart")
	public @ResponseBody List<GraphVO> getSbdChartItem(Model model, String userId) throws Exception {
		
		System.out.println("아이디"+userId);
		List<GraphVO> result = service.getSbdChartItem(userId);
		System.out.println("list"+result);
		model.addAttribute("result", result);
		return result;
	}

	@RequestMapping("/display/chart")
	public String chart_display() {
		return "display/chart_display";
		
	}
	
}
