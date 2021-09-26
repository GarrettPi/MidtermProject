package com.skilldistillery.activepotato.security;

public class PasswordVerifier {

	private PasswordUtilities pu = new PasswordUtilities();

	public boolean checkPassword(String input, String salt, String password) {
		boolean value = false;
		String testPassword = pu.generateSecurePassword(input, salt);

		value = testPassword.equalsIgnoreCase(password) ? true : false;

		return value;
	}

}
