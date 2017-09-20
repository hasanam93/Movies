package com.movies.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.security.MessageDigest;
import java.util.Date;
import java.util.Map;

import com.movies.dao.LogindaoImpl;
import com.movies.model.Candidate;

public class LoginAction extends ActionSupport {

	private String flashMessage, candidatePassWord,userName;
	
	Candidate candidate;
	public void validateLogInCandidate() {
        if (getUserName().length() == 0) {
            addFieldError("userName", "\r\n" + "Please enter your username");
        }
        if (getCandidatePassWord().length() == 0) {
            addFieldError("candidatePassWord", "\r\n" + "Please enter the password");
        }
    }
    public String logInCandidate() throws Exception {
        LogindaoImpl loginDAO = new LogindaoImpl();
        Map session = ActionContext.getContext().getSession();
        candidate = loginDAO.findCandidate(getUserName(), MD5Hashing(getCandidatePassWord()));
        if (candidate == null) {
            addFieldError("userName", "\r\n" + "Invalid username or password");
            addFieldError("candidatePassWord", "\r\n" + "Please enter the data again");
            setFlashMessage("Error login");
            setUserName(getUserName()); 
            return ERROR;
        } else {
            setFlashMessage("\r\n" +"you are welcome " + candidate.getUserName());
            session.put("context", new Date());
            session.put("logged_in", true);
            session.put("role", "candidate");
            session.put("id", candidate.getId());
            session.put("userName", candidate.getUserName());
            candidate.setLastLogin(new Date());
            loginDAO.updateLastLogin(candidate);
            return SUCCESS;
        }
    }
    public String logOut() throws Exception {
        Map session = ActionContext.getContext().getSession();
        session.remove("context");
        session.remove("logged_in");
        session.remove("role");
        session.remove("userName");
        session.clear();
        setFlashMessage("Ok, \r\n" + "You've closed the session");
        return SUCCESS;
    }
	public String getFlashMessage() {
		return flashMessage;
	}
	public void setFlashMessage(String flashMessage) {
		this.flashMessage = flashMessage;
	}
	public String getCandidatePassWord() {
		return candidatePassWord;
	}
	public void setCandidatePassWord(String candidatePassWord) {
		this.candidatePassWord = candidatePassWord;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Candidate getCandidate() {
		return candidate;
	}
	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}
	 private String MD5Hashing(String passWord) throws Exception {
	        //String password = "123456";

	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(passWord.getBytes());

	        byte byteData[] = md.digest();

	        //convert the byte to hex format method 1
	        /*StringBuilder sb = new StringBuilder();
	         for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	         }

	         System.out.println("Digest(in hex format):: " + sb.toString());*/
	        //convert the byte to hex format method 2
	        StringBuilder hexString = new StringBuilder();
	        for (int i = 0; i < byteData.length; i++) {
	            String hex = Integer.toHexString(0xff & byteData[i]);
	            if (hex.length() == 1) {
	                hexString.append('0');
	            }
	            hexString.append(hex);
	        }
	        //System.out.println("Digest(in hex format):: " + hexString.toString());
	        return hexString.toString();
	    }
}
