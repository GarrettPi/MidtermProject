package com.skilldistillery.activepotato.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.activepotato.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
}
