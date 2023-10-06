package com.exercise.myex.write.web;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exercise.myex.user.vo.UserVO;
import com.exercise.myex.write.service.WriteService;
import com.exercise.myex.write.vo.UbWriteVO;
import com.exercise.myex.write.vo.WriteVO;


@Controller
public class WriteController {
    @Autowired
    WriteService writeService;
    
    @RequestMapping("/write/day")
	public String day_ex_write(Model model,HttpSession session) throws Exception {
		List<WriteVO> titleTypeList = writeService.getExTypeList();
		model.addAttribute("titleTypeList",titleTypeList);
		System.out.println(titleTypeList);
		
		if(session.getAttribute("login")==null) {
			return "redirect:/login";
		}
		return "write/day_ex_write";
		}
    @RequestMapping("/writeDo")
	public String writeDo(Model model,HttpSession session,HttpServletRequest req) throws Exception {
    	String exerciseTitleType =req.getParameter("exerciseTitleType"); 
    	System.out.println("do"+exerciseTitleType);
    	UserVO loginMemberVO =(UserVO)session.getAttribute("login");
    	
    	
    	
		if("A".equals(exerciseTitleType)) {
			String exerciseCode =req.getParameter("exerciseName"); 
			String exerciseDate =req.getParameter("exerciseDate"); 
			int exerciseWeight =Integer.parseInt(req.getParameter("exerciseWeight")); 
			int exerciseReps =Integer.parseInt(req.getParameter("exerciseReps")); 
			WriteVO dayWrite =new WriteVO(exerciseDate,exerciseCode,exerciseWeight,exerciseReps);
			
			dayWrite.setUserId(loginMemberVO.getUserId());
			writeService.AWrite(dayWrite);
			
			
		}else if("B".equals(exerciseTitleType)) {
			System.out.println(req);
			String exerciseCode =req.getParameter("exerciseTitle"); 
			String exerciseDate =req.getParameter("exerciseDate"); 
			Float exerciseKm =Float.parseFloat(req.getParameter("exerciseKm")); 
			int exercisHourTime =Integer.parseInt(req.getParameter("exercisHourTime")); 
			int exercisMinuteTime =Integer.parseInt(req.getParameter("exercisMinuteTime")); 
			WriteVO dayWrite =new WriteVO(exerciseDate,exerciseCode,exerciseKm,exercisHourTime,exercisMinuteTime);
			System.out.println(dayWrite);
			dayWrite.setUserId(loginMemberVO.getUserId());
			writeService.BWrite(dayWrite);
			
		}
		
		
		return "redirect:/write/day";
		
	}
    //타이틀
    @ResponseBody
    @RequestMapping("/getExerciseTitles")
    public List<WriteVO> getExTitleList(String exCode) {
        
    	
        List<WriteVO> ExNameList = writeService.getExTitleList(exCode);
        System.out.println(ExNameList);
        return ExNameList;
    }
    //이름
    @ResponseBody
    @RequestMapping("/getExNameList")
    public List<WriteVO> getExNameList(String exCode) {
    	
    	
    	List<WriteVO> getExNameList = writeService.getExNameList(exCode);
    	return getExNameList;
    }
	@RequestMapping("/write/sbd")
	public String sbd_write(HttpSession session) {
		if(session.getAttribute("login")==null) {
			return "redirect:/login";
		}
		return "write/sbd_write";
		
	}
	@RequestMapping("/sbdWriteDo")
	public String sbdWriteDo(HttpServletRequest req, HttpSession session) {
		int squat =Integer.parseInt(req.getParameter("squat"));    
		int benchpess=Integer.parseInt(req.getParameter("benchpress"));
		int deadlift=Integer.parseInt(req.getParameter("deadlift"));
		UserVO loginMemberVO =(UserVO)session.getAttribute("login");
		
		System.out.println(squat);
		WriteVO vo = new WriteVO(squat,benchpess,deadlift);
		vo.setUserId(loginMemberVO.getUserId());
		System.out.println(vo);
		
		
		try {
			writeService.writeSbd(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/write/sbd";
	}
	@RequestMapping("/write/ub")
	public String ub_write(HttpSession session) {
		if(session.getAttribute("login")==null) {
			return "redirect:/login";
		}
		return "write/ub_write"; 
		
	}
	@RequestMapping("/wirteUbodyDo")
	public String wirteUbodyDo(HttpServletRequest req, HttpSession session) {
		float uHeight =Float.parseFloat(req.getParameter("uHeight"));    
		String updateDt =req.getParameter("updateDt");    
		float uWeight=Float.parseFloat(req.getParameter("uWeight"));
		float uMus=Float.parseFloat(req.getParameter("uMus"));
		float uFat=Float.parseFloat(req.getParameter("uFat"));
		double a =uHeight*0.01;
		double uBmi=uWeight/(a*a);
		
		UserVO loginMemberVO =(UserVO)session.getAttribute("login");
		
		
		UbWriteVO vo = new UbWriteVO(uHeight,uWeight,uMus,uFat,uBmi,updateDt);
		vo.setUserId(loginMemberVO.getUserId());
		System.out.println(vo);
		
		try {
			writeService.wirteUbody(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/write/ub";
	}
	
}
