package mucms;

public class Sec {
	public String encrypt(String plain) {
		String b64encoded = Base64.getEncoder().encodeToString(plain.getBytes());
		String reverse = new StringBuffer(b64encoded).reverse().toString();
		StringBuilder tmp = new StringBuilder();
		final int OFFSET = 4;
		for (int i = 0; i < reverse.length(); i++) {
			tmp.append((char)(reverse.charAt(i) + OFFSET));
		}
		return tmp.toString();
	}
	public String decrypt(String secret) {
		StringBuilder tmp = new StringBuilder();
		final int OFFSET = 4;
		for (int i = 0; i < secret.length(); i++) {
			tmp.append((char)(secret.charAt(i) - OFFSET));
		}
		String reversed = new StringBuffer(tmp.toString()).reverse().toString();
		return new String(Base64.getDecoder().decode(reversed));
	}
}