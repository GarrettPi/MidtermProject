package com.skilldistillery.activepotato.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.CommentDAO;
import com.skilldistillery.activepotato.data.ExperienceDAO;
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Comment;
import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class CommentController {

	@Autowired
	private CommentDAO commentDao;
	@Autowired
	private ActivityDAO activityDao;
	@Autowired
	private ExperienceDAO expDao;
	@Autowired
	private CommentDAO comDao;

	@RequestMapping(path = "addComment.do", method = RequestMethod.POST)
	public ModelAndView addComment(HttpSession session, Comment comment, int activityId) {
		ModelAndView mv = new ModelAndView();
		Activity activity = activityDao.findActivityById(activityId);
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			comment.setUser(user);
			comment.setActivity(activity);
			comment.setCommentDate(LocalDate.now());
			commentDao.addComment(comment);
		}

		if (activity.getActivityCategory().getId() == 1) {
			mv.addObject("activity", activity);
			mv.setViewName("couchPotatoPath/detailsPageIndoor");

		} else {
			mv.addObject("activity", activity);
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
		}
		List<Comment> comments = commentDao.findAll(activityId);
		List<Comment> replies = new ArrayList<>();
		for(Comment c : comments) {
			replies.addAll(comDao.findRepliesByCommentId(c.getId()));
		}
		List<Experience> exp = expDao.findExperiencesByActivityId(activityId);
		mv.addObject("replies", replies);
		mv.addObject("experiences", exp);
		mv.addObject("comments", comments);
		return mv;
	}

	@RequestMapping(path = "deleteComment.do", method = RequestMethod.POST)
	public ModelAndView deleteComment(HttpSession session, int commentId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		int activityId = commentDao.findSingleCommentById(commentId).getActivity().getId();
		Activity activity = commentDao.findSingleCommentById(commentId).getActivity();
		commentDao.deleteComment(commentId);

		if (activity.getActivityCategory().getId() == 1) {
			mv.addObject("activity", activity);
			mv.setViewName("couchPotatoPath/detailsPageIndoor");

		} else {
			mv.addObject("activity", activity);
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
		}
		List<Comment> comments = commentDao.findAll(activityId);
		List<Comment> replies = commentDao.findRepliesByBaseCommentUserId(user.getId());
		comments.addAll(replies);
		List<Experience> exp = expDao.findExperiencesByActivityId(activity.getId());
		mv.addObject("experiences", exp);
		mv.addObject("comments", comments);
		return mv;

	}
	//for adding replies to existing comments
	@RequestMapping(path="addReply")
	@RequestMapping(path="addReply.do")
	public ModelAndView addReply(HttpSession session, int commentId) {
		ModelAndView mv = new ModelAndView();
		Comment comment = commentDao.findSingleCommentById(commentId);
		mv.addObject("comment", comment);
		mv.setViewName("createReply");
		return mv;
	}
	
	@RequestMapping(path="createReply.do")
	public ModelAndView createReply(HttpSession session, String comment, int baseCommentId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Comment baseComment = comDao.findSingleCommentById(baseCommentId);
		Activity activity = baseComment.getActivity();
		Comment reply = new Comment();
		reply.setUser(user);
		reply.setActivity(activity);
		reply.setBaseComment(baseComment);
		reply.setComment(comment);
		comDao.addComment(reply);
		if (activity.getActivityCategory().getId() == 1) {
			mv.setViewName("couchPotatoPath/detailsPageIndoor");
			List<Comment> comments = commentDao.findAll(activity.getId());
			mv.addObject("comments", comments);
			List<Experience> exp = expDao.findExperiencesByActivityId(activity.getId());
			mv.addObject("experiences", exp);
			mv.addObject("activity", activity);
		} else {
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
			List<Comment> comments = commentDao.findAll(activity.getId());
			mv.addObject("comments", comments);
			List<Experience> exp = expDao.findExperiencesByActivityId(activity.getId());
			mv.addObject("experiences", exp);
			mv.addObject("activity", activity);
		}
		return mv;
	}

}
