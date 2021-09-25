package com.skilldistillery.activepotato.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class ActivityController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "searchActive.do")
	public ModelAndView searchActive() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "searchCouch.do")
	public ModelAndView searchCouch() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "selectActive.do")
	public ModelAndView selectActive() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping(path = "selectCouch.do")
	public ModelAndView selectCouch() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

}
