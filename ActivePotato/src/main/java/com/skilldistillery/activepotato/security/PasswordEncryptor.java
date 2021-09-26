package com.skilldistillery.activepotato.security;

public class PasswordEncryptor {

	private PasswordUtilities pu = new PasswordUtilities();
	
	public String encryptPassword(String input) {
		String password = null;
		String salt = pu.getSalt(30);
		password = pu.generateSecurePassword(input, salt);
		return password;
	}
	
//	public static void main(String[] args) {
//		PasswordUtilities pu = new PasswordUtilities();
//
//		String salt = pu.getSalt(30);
//		System.out.println(salt);
//		
//		System.out.println(pu.generateSecurePassword("123", salt));
//	}
}
