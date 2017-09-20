package com.movies.dao;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.movies.model.Candidate;

public class LogindaoImpl implements Logindao {

	@Override
	public Candidate findCandidate(String userName, String passWord) {
		Candidate candidate;
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        Criteria criteria = s.createCriteria(Candidate.class)
                .add(Restrictions.eq("userName", userName))
                .add(Restrictions.eq("passWord", passWord));
        candidate = (Candidate) criteria.uniqueResult();
        s.close();
        sf.close();
        return candidate;
	}

	@Override
	public void updateLastLogin(Candidate candidate) {
		   if (candidate == null) {
	            try {
	                SessionFactory sf = new Configuration().configure().buildSessionFactory();
	                Session s = sf.openSession();
	                s.beginTransaction();
	                s.update(candidate);
	                s.getTransaction().commit();
	                s.close();
	                sf.close();
	            } catch (HibernateException e) {
	            }
	        }
		
	}

	
}
