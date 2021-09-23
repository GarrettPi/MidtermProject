package com.skilldistillery.activepotato.data;

import com.skilldistillery.activepotato.entities.User;

public interface UserDAO {

	User findByUsername(String username);
}
