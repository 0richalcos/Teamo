package com.teamo.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {

	public static String encrypt(String str) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("md5");
		byte[] buf = md.digest(str.getBytes());
		BASE64Encoder be = new BASE64Encoder();
		return be.encode(buf);
	}

	/**
	 * @param args
	 * @throws NoSuchAlgorithmException
	 */
	public static void main(String[] args) throws NoSuchAlgorithmException {
		String str = "I love you, also I hate you.";

		MessageDigest md = MessageDigest.getInstance("md5");

		byte[] buf = md.digest(str.getBytes());

		BASE64Encoder be = new BASE64Encoder();
		String str2 = be.encode(buf);
		System.out.println(str2);
	}

}
