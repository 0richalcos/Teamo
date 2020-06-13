package com.teamo.test;

import java.security.NoSuchAlgorithmException;

import com.teamo.util.MD5Util;

public class MD5Test {
	public static void main(String[] args) throws NoSuchAlgorithmException {
		String str = "123456";
		System.out.println(MD5Util.encrypt(str));
	}
}
