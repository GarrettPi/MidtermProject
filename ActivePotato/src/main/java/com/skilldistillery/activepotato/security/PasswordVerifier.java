package com.skilldistillery.activepotato.security;

public class PasswordVerifier {


	public static boolean checkPassword(String input, String salt, String password) {
		boolean value = false;
		String testPassword = PasswordUtilities.generateSecurePassword(input, salt);

		value = testPassword.equalsIgnoreCase(password) ? true : false;

		return value;
	}

}
