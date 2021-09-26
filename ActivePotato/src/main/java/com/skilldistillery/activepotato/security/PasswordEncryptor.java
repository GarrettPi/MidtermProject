package com.skilldistillery.activepotato.security;

public class PasswordEncryptor {

	private PasswordUtilities pu = new PasswordUtilities();
	
	public String encryptPassword(String input) {
		String password = null;
		String salt = pu.getSalt(30);
		password = pu.generateSecurePassword(input, salt);
		return password;
	}
}
