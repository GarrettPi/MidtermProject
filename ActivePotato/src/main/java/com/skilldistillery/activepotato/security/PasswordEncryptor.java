package com.skilldistillery.activepotato.security;

public class PasswordEncryptor {

	private PasswordUtilities pu = new PasswordUtilities();

	public String encryptPassword(String input) {
		String password = null;
		String salt = pu.getSalt(30);
		password = pu.generateSecurePassword(input, salt);
		return password;
	}

	public static void main(String[] args) {
		PasswordUtilities pu = new PasswordUtilities();

		for (int i = 0; i < 4; i++) {
			String salt = pu.getSalt(30);
			System.out.println(salt);
			String pass = pu.generateSecurePassword("123", salt);
			System.out.println(pass);
		}

//		System.out.println(pu.generateSecurePassword("123", salt));
	}
}
