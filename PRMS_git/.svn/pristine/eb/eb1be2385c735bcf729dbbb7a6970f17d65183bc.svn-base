package kr.or.ddit.vo;

import java.text.DecimalFormat;

public class CommaUtils {

	public static String formatIntegerComma(Integer price) {

		if(price == null || price == 0) {
			return "0";
		}

		DecimalFormat formatter = new DecimalFormat("#,###");
		return formatter.format(price);
	}

	public static String formatIntComma(int price) {

		if(price == 0) {
			return "0";
		}

		DecimalFormat formatter = new DecimalFormat("#,###");
		return formatter.format(price);
	}

	public static String formatLongComma(long price) {

		if(price == 0) {
			return "0";
		}

		DecimalFormat formatter = new DecimalFormat("#,###");
		return formatter.format(price);
	}
}
