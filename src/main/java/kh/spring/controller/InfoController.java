package kh.spring.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.google.gson.JsonObject;

import kh.spring.data.PublicData;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_memberDTO;
import kh.spring.dto.Camp_photoDTO;
import kh.spring.dto.Camp_wishlistDTO;
import kh.spring.service.Camp_infoService;



@Controller
@RequestMapping("/")
public class InfoController {
	
	@Autowired
	private Camp_infoService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String home() {
		return "login";
	}
	
	
	//파싱된 데이터를 DB에 저장
	@RequestMapping("dataupdate")
	public String practice(HttpServletRequest request) throws Exception {
		System.out.println("출력");
		PublicData data = new PublicData();
		List <Camp_infoDTO> list = data.ParsingData();
		
		for(Camp_infoDTO dto : list) {
			service.campinsert(dto);
		}
	    
	    return "redirect:/";
	}
	
	@RequestMapping("practice")
	public String dataupdate(HttpServletRequest request) {
			
	    HttpSession session = request.getSession();
	    
	    return "detail2";
	}
	
	
	//로그인
	@RequestMapping(value = "/loginProc", method = RequestMethod.POST)
	public String Login(
			@RequestParam(value = "cm_id") String cm_id
		, @RequestParam(value = "cm_pw") String cm_pw) throws Exception {
		
		Camp_memberDTO dto = new Camp_memberDTO();
		
		dto.setCm_id(cm_id);
		dto.setCm_pw(cm_pw);
		System.out.println(dto);
		
		int result = service.loginProc(dto);		
		
		if(result>0) {
			session.setAttribute("cm_id", cm_id);
		}
		
		return "redirect:/";
	}
	
	
	//로그아웃
	@RequestMapping("logout")
	public String memLogout(HttpServletRequest request) {
			
	    HttpSession session = request.getSession();
	    session.invalidate(); // ���� ����
	    
	    return "redirect:/";
	}
	
	
	//정보 리스트
	@RequestMapping("list")
	public String home(HttpServletRequest request, Model model) throws Exception {	
		List<Camp_infoDTO> list = service.selectAll();
		
		HttpSession session = request.getSession();
		String cm_id = (String)session.getAttribute("cm_id");
	
		model.addAttribute("list",list);
		return "campinglist";
	}
	
	//캠핑 디테일
	@RequestMapping("detail")
	public String detail(HttpServletRequest request, Model model, int contentId) throws Exception {
		//List<Camp_photoDTO> image = service.detailimagecontentId);
		List<Camp_infoDTO> list = service.detail(contentId);
		
		//Map<String,Object> resultMap = null;
			    
		HttpSession session = request.getSession();
		String cm_id = (String)session.getAttribute("cm_id");
		
		//contentId1
		String contentId1 = Integer.toString(contentId);
		List<Camp_wishlistDTO> wish = service.selectwish(contentId1, cm_id);
		
		model.addAttribute("wish",wish);
		model.addAttribute("list",list);
		//model.addAttribute("image",image);
		return "campingdetail";
	}
	
	//찜하기 인서트
	@RequestMapping(value = "wishinsert", method = RequestMethod.POST, produces = "application/json; charset=utf8")
 	@ResponseBody
	public String wishinsert(String contents, int ci_seq, HttpServletRequest request) throws Exception {
		System.out.println("확인");
		HttpSession session = request.getSession();
		String cm_id = (String)session.getAttribute("cm_id");
		
		Camp_wishlistDTO dto = new Camp_wishlistDTO();

		JsonObject obj = new JsonObject(); 
		obj.addProperty("contents", contents); 
		obj.addProperty("ci_seq", ci_seq); 
		
		dto.setContents(contents);
		System.out.println(contents + ":" + ci_seq);			

		//int result = service.wishinsert(dto);
		 
		return "redirect:detail";
	}
	
	
//	//ķ�� ���ϱ� ����(���� ���)
//	@RequestMapping(value ="wishdelete", method = RequestMethod.POST)
//	public String wishdelete(HttpServletRequest request, String ci_seq) throws Exception {
//		
//		HttpSession session = request.getSession();
//		String cm_id = (String)session.getAttribute("cm_id");
//		
//		Camp_wishlistDTO dto = new Camp_wishlistDTO();
//		
//		dto.setCm_id(cm_id);
//		dto.setCi_seq(ci_seq);
//		 
//		int result = service.wishdelete(dto);
//		 
//		return "redirect:detail";
//	}
	
//

	
}