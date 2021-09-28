package com.skilldistillery.activepotato.data;

import java.util.List;

import com.skilldistillery.activepotato.entities.Comment;

public interface CommentDAO {

	public List<Comment> findCommentById(int commentId);
	public List<Comment> findCommentByUserId(int userId);
	public Comment addComment(Comment comment);
	public boolean deleteComment(int id);
	public Comment updateComment(Comment comment);
	List<Comment> findCommentByActivityId(int activityId);
	
}
