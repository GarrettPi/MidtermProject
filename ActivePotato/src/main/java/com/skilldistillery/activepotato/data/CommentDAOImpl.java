package com.skilldistillery.activepotato.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.activepotato.entities.Comment;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Comment> findCommentById(int commentId) {
		List<Comment> commentList = null;
		try {
			
		String query = "SELECT c FROM Comment c WHERE c.id = :cid";
		commentList = em.createQuery(query, Comment.class)
					.setParameter("cid", commentId)
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + commentId);
		
		}	
		
		return commentList;
	}
	
	@Override
	public Comment findSingleCommentById(int commentId) {
		Comment comment= null;
		try {
			
		String query = "SELECT c FROM Comment c WHERE c.id = :cid";
		comment = em.createQuery(query, Comment.class)
					.setParameter("cid", commentId)
					.getSingleResult();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + commentId);
		
		}	
		
		return comment;
	}

	@Override
	public List<Comment> findCommentByUserId(int userId) {
		List<Comment> userCommentList = null;
		try {
			
			String query = "SELECT c FROM Comment c WHERE c.user.id = :uid";
			userCommentList = em.createQuery(query, Comment.class)
					.setParameter("uid", userId)
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + userCommentList);
			
		}	
		
		return userCommentList;
	}
	

	@Override
	public List<Comment> findAll(int actId) {
		List<Comment> commentList = null;
		try {	
			String query = "SELECT c FROM Comment c WHERE activity_id = :aid";
			commentList = em.createQuery(query, Comment.class)
					.setParameter("aid", actId)
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + commentList);
			
		}		
		return commentList;
	}

	@Override
	public List<Comment> findCommentByActivityId(int activityId) {
		List<Comment> activityCommentList = null;
		try {
			
			String query = "SELECT c FROM Comment c WHERE c.id = :aid";
			activityCommentList = em.createQuery(query, Comment.class)
					.setParameter("aid", activityId)
					.getResultList();
		} catch (Exception e) {
			System.out.println("No activity found matching: " + activityCommentList);
			
		}	
		
		return activityCommentList;
	}
	
	@Override
	public Comment addComment(Comment comment) {
		
		em.persist(comment);
		em.flush();		
		return comment;
	}

	@Override
	public boolean deleteComment(int id) {
		boolean result = false;
		Comment comment = em.find(Comment.class, id);
		em.remove(comment);
		
		result = ! em.contains(comment);
		
		return result;
	}

	@Override
	public Comment updateComment(Comment comment) {
		
		em.persist(comment);
		em.flush();
		
		return comment;
	}

	@Override
	public List<Comment> findRepliesByCommentId(int commentId) {
		List<Comment> replies = new ArrayList<Comment>();
		String query = "select c from Comment c where c.baseComment.id = :commentId";
		replies = em.createQuery(query, Comment.class).setParameter("commentId", commentId).getResultList();
		return replies;
	}

	@Override
	public List<Comment> findRepliesByBaseCommentUserId(int userId) {
		List<Comment> replies = new ArrayList<>();
		String query = "select c from Comment c where c.baseComment.user.id = :userId";
		replies = em.createQuery(query, Comment.class).setParameter("userId", userId).getResultList();
		return replies;
	}
	
}
