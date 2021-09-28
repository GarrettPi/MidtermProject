package com.skilldistillery.activepotato.controllers;

import java.time.LocalDate;
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
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Comment;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class CommentController {
	
	@Autowired
	private CommentDAO commentDao;
	@Autowired
	private ActivityDAO activityDao;
	
	@RequestMapping(path = "addComment.do", method=RequestMethod.POST)
	public ModelAndView addComment(HttpSession session, Comment comment, int activityId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		comment.setUser(user);
		Activity activity = activityDao.findActivityById(activityId);
		comment.setActivity(activity);
		comment.setCommentDate(LocalDate.now());
		commentDao.addComment(comment);
		
		if (activity.getActivityCategory().getId() == 1) {
			mv.addObject("activity", activity);
			mv.setViewName("couchPotatoPath/detailsPageIndoor");
			
		}
		else {
			mv.addObject("activity", activity);
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
		}
		List<Comment> comments = commentDao.findAll(activityId);
		mv.addObject("comments", comments);
		return mv;
	}
	
	@RequestMapping(path = "deleteComment.do", method=RequestMethod.POST)
	public ModelAndView deleteComment(HttpSession session, int commentId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		int activityId = commentDao.findSingleCommentById(commentId).getActivity().getId();
		Activity activity = commentDao.findSingleCommentById(commentId).getActivity();
		commentDao.deleteComment(commentId);
		
		if (activity.getActivityCategory().getId() == 1) {
			mv.addObject("activity", activity);
			mv.setViewName("couchPotatoPath/detailsPageIndoor");
			
		}
		else {
			mv.addObject("activity", activity);
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
		}
		List<Comment> comments = commentDao.findAll(activityId);
		mv.addObject("comments", comments);
		return mv;
		
	}

}
