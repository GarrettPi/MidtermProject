package com.skilldistillery.activepotato.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.CommentDAO;
import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.Comment;
import com.skilldistillery.activepotato.entities.User;
import com.skilldistillery.activepotato.security.PasswordUtilities;
import com.skilldistillery.activepotato.security.PasswordVerifier;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private ActivityDAO actDao;
	@Autowired
	private CommentDAO comDao;

	// Submits login form and directs to user home page
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String userName, String userPassword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = userDao.findByUsername(userName);
		if (user == null) {
			mv.setViewName("userLogin");
		} else {
			String salt = user.getSalt();
			String pass = user.getPassword();
			if (PasswordVerifier.checkPassword(userPassword, salt, pass)) {
				mv.addObject("acts", actDao.findActivitiesByInterestUserId(user.getId()));
				List<Comment> commentList = comDao.findCommentByUserId(user.getId());
				mv.addObject("comments", commentList);
				mv.setViewName("userHome");
				session.setAttribute("user", user);
			} else {
				mv.setViewName("userLogin");
			}
		}
		return mv;
	}

	// Directs to user registration page
	@RequestMapping(path = "registerpage.do")
	public ModelAndView newUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("createProfile");
		} else {
			User user = (User) session.getAttribute("user");
			mv.addObject("acts", actDao.findActivitiesByInterestUserId(user.getId()));
			mv.setViewName("userHome");
		}
		return mv;
	}

	// Submits registration form and directs to user home page
	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public ModelAndView register(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String salt = PasswordUtilities.getSalt(30);
		if (user.getProfileUrl().length() < 10)
			user.setProfileUrl(
					"https://ih1.redbubble.net/image.939692630.5711/st,small,845x845-pad,1000x1000,f8f8f8.jpg");
		user.setEnabled(true);
		user.setRole("user");
		user.setSalt(salt);
		user.setPassword(PasswordUtilities.generateSecurePassword(user.getPassword(), salt));
		User u = userDao.createUser(user);
		session.setAttribute("user", u);
		mv.addObject("acts", actDao.findActivitiesByInterestUserId(u.getId()));
		mv.setViewName("userHome");
		return mv;
	}

	// Directs to edit profile page
	@RequestMapping(path = "editProfile.do")
	public ModelAndView editProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.setViewName("editProfile");
			User user = (User) session.getAttribute("user");
			mv.addObject("user", user);
		} else {
			mv.setViewName("userLogin");
		}
		return mv;
	}

	// Submits edit details form and directs to user home page
	@RequestMapping(path = "edit.do", method = RequestMethod.POST)
	public ModelAndView submitEdits(String password1, String password2, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (password1.equals(password2)) {
			User sessionUser = (User) session.getAttribute("user");
			user.setPassword(password1);
			User updatedUser = userDao.updateUser(sessionUser.getId(), user);
			session.setAttribute("user", updatedUser);
			mv.addObject("acts", actDao.findActivitiesByInterestUserId(updatedUser.getId()));
			mv.setViewName("userHome");
		} else {
			mv.setViewName("editProfile");
			System.err.println("password mismatch");
		}
		return mv;
	}

	// removes active user from session and directs to home page
	@RequestMapping(path = "logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user");
		mv.setViewName("home");
		return mv;

	}

	// pulls user from session, deletes it through DAO and then directs to home page
	@RequestMapping(path = "deleteUser.do")
	public ModelAndView deleteUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		userDao.deleteUser(user);
		session.removeAttribute("user");
		mv.setViewName("home");
		return mv;
	}

}
