package com.movies.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;



public class Candidate implements Serializable {
	
	private Integer id;
	
    private String userName;
	
    private String passWord;
	
    private String email;
	
    private Date lastLogin;
	
    private Date created;
	
    private Date modified;
	 public Candidate() {
	    }
	public Candidate(Integer id, String userName, String passWord, String email, Date lastLogin, Date created,
			Date modified) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.lastLogin = lastLogin;
		this.created = created;
		this.modified = modified;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getModified() {
		return modified;
	}
	public void setModified(Date modified) {
		this.modified = modified;
	}
	

}
