package com.movies.dao;

import com.movies.model.Candidate;

public interface Logindao {
	 public Candidate findCandidate(String userName, String passWord);
	 public void updateLastLogin(Candidate candidate);
}
