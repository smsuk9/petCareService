package com.pet.care;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDAO;
import vo.ProductVO;

@Controller
public class ProductController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/product/";
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("product_list")
	public String product_list(Model model) {
		
		List<ProductVO> list = product_dao.selectList();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH + "product_list.jsp"; 
	}

}
