package com.skilldistillery.activepotato.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.activepotato.data.ActivityDAO;
import com.skilldistillery.activepotato.data.CommentDAO;
import com.skilldistillery.activepotato.data.ExperienceDAO;
import com.skilldistillery.activepotato.data.InterestDAO;
import com.skilldistillery.activepotato.data.UserDAO;
import com.skilldistillery.activepotato.entities.Activity;
import com.skilldistillery.activepotato.entities.Comment;
import com.skilldistillery.activepotato.entities.Experience;
import com.skilldistillery.activepotato.entities.Interest;
import com.skilldistillery.activepotato.entities.User;

@Controller
public class ActivityController {

	@Autowired
	private ActivityDAO activityDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private InterestDAO intDao;
	@Autowired
	private CommentDAO commentDao;
	@Autowired
	private ExperienceDAO expDao;

	// Submits active search form and directs to results page
	@RequestMapping(path = "searchActive.do", method = RequestMethod.GET)
	public ModelAndView searchActive(@RequestParam("keyword") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/activityListOutdoor");
		List<Activity> activities = activityDao.findActiveActivity(keyword);
		if (!activities.isEmpty()) {
			for (Activity activity : activities) {
				List<Experience> experiences = expDao.findExperiencesByActivityId(activity.getId());
				int sum = 0;
				int avg = 0;
				if (!experiences.isEmpty()) {
					for (Experience experience : experiences) {
						sum += experience.getRating();
					}
					avg = sum / experiences.size();
				}
				activity.setAvgRating(avg);
			}
		}
		mv.addObject("a", activities);
		return mv;
	}

	@RequestMapping(path = "createActivity.do")
	public ModelAndView newUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("createProfile");
		} else {
			mv.addObject("user", (User) session.getAttribute("user"));
			mv.setViewName("createActivity");
		}
		return mv;
	}

	// Submits couch search form and directs to results page
	@RequestMapping(path = "searchCouch.do")
	public ModelAndView searchCouch(String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("couchPotatoPath/activityListIndoor");
		List<Activity> activities = activityDao.findCouchActivity(keyword);
		if (!activities.isEmpty()) {
			for (Activity activity : activities) {
				List<Experience> experiences = expDao.findExperiencesByActivityId(activity.getId());
				int sum = 0;
				int avg = 0;
				if (!experiences.isEmpty()) {
					for (Experience experience : experiences) {
						sum += experience.getRating();
					}
					avg = sum / experiences.size();
				}
				activity.setAvgRating(avg);
			}
		}
		mv.addObject("a", activities);
		return mv;
	}

	// Submits selected active result form and directs to activity details page
	@RequestMapping(path = "selectActive.do")
	public ModelAndView selectActive(Integer actId, Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("activePotatoPath/detailsPageOutdoor");
		mv.addObject("activity", activityDao.findActivityById(actId));
		List<Comment> comments = commentDao.findAll(actId);
		List<Experience> exp = expDao.findExperiencesByActivityId(actId);
		mv.addObject("experiences", exp);
		mv.addObject("comments", comments);

		return mv;
	}

	// Submits selected couch result form and directs to activity details page
	@RequestMapping(path = "selectCouch.do")
	public ModelAndView selectCouch(Integer actId, Activity activity, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.addObject("user", (User) session.getAttribute("user"));
		}
		mv.setViewName("couchPotatoPath/detailsPageIndoor");
		mv.addObject("activity", activityDao.findActivityById(actId));
		List<Comment> comments = commentDao.findAll(actId);
		List<Experience> exp = expDao.findExperiencesByActivityId(actId);
		mv.addObject("experiences", exp);
		mv.addObject("comments", comments);
		return mv;
	}

	@RequestMapping(path = "selectActivity.do")
	public ModelAndView selectInterestActivity(int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Activity activity = activityDao.findActivityById(id);
		if (activity.getActivityCategory().getId() == 1) {
			mv.setViewName("couchPotatoPath/detailsPageIndoor");
			List<Experience> exp = expDao.findExperiencesByActivityId(id);
			mv.addObject("experiences", exp);
			mv.addObject("activity", activity);
		} else {
			mv.setViewName("activePotatoPath/detailsPageOutdoor");
			List<Experience> exp = expDao.findExperiencesByActivityId(id);
			mv.addObject("experiences", exp);
			mv.addObject("activity", activity);
		}
		return mv;
	}

	@RequestMapping(path = "addInterest.do", method = RequestMethod.POST)
	public ModelAndView addInterest(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mv.setViewName("userLogin");
			return mv;
		}
		Activity activity = activityDao.findActivityById(id);
		User user = (User) session.getAttribute("user");
		Interest newInterest = intDao.addActivityToUserInterest(activity, user);
		mv.addObject("acts", activityDao.findActivitiesByInterestUserId(user.getId()));
		mv.setViewName("userHome");
		return mv;
	}

	@RequestMapping(path = "removeInterest.do", method = RequestMethod.POST)
	public ModelAndView removeInterest(HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Activity activity = activityDao.findActivityById(id);
		intDao.removeActivityFromUserInterest(activity, user);
		mv.addObject("acts", activityDao.findActivitiesByInterestUserId(user.getId()));
		mv.setViewName("userHome");
		return mv;
	}

}
