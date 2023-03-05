

<%@ page errorPage="error.jsp" %>
<%@ page contentType="text/plain" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jasypt.StandardPBEStringEncryptor" %>
<%
	try{
		String seed = "This is my password Exncyrption key";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc");
		
		String rtype = request.getMethod();
		String req = request.getParameter("do");
		String ad = request.getParamter("admin");
		String us = request.getParameter("user");
		if(rtype != "POST" || req == ""){
			out.print("{}");
		}
		else{
			if(ad == "admin"){
				switch(req){
					case "":
					
					break;
					default:
						//do nothing
				}
			}
			else if(us != "" && us!= NULL){
				
			}
			else{
				switch(req){
				case "register":
					String un = request.getParamter("un");
					String pw = request.getParamter("pw");
					StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
					encryptor.setPassword(seed);
					String encrypted= encryptor.encrypt(pw);
					PreparedStatement ur1 = Con.prepareStatememt("SELECT * FROM users WHERE username = ?");
					PreparedStatement ur2 = Con.prepareStatememt("INSERT INTO users (username,password) VALUES (?,?)");
					ur1.setString(1,un);
					ResultSet urRS = ur1.executeQuery();
					if(urRS.next()){
						out.print("{\"err\":1,\"message\":\"Username already taken.\"}");
					}
					else{
						ur1.setString(1,un);
						ur1.setString(2,encrypted);
						int urU = ur2.executeUpdate();
						if(urU == 1){
							out.print("{\"succ\":1,\"message\":\"Regsitration Successful.\"}");
						}
						else{
							out.print("{\"err\":1,\"message\":\"Registration failed! Please try again.\"}");
						}
					}
				break;
				case "login":
					
				break;
				default:
					//do nothing
				}
			}
		}
	}
	catch(Exception e){
		System.out.println(e);
		out.print("{\"err\":1,\"message\":\"A server error was encountered.\"}");
	}
%>