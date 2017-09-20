package com.movies.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.movies.dao.Candidatedao;
import com.movies.model.Candidate;


public class CandidatedaoImpl implements Candidatedao {

	@Override
	public Candidate findById(int id) {
		 Candidate candidate = null;
	        try {
	            SessionFactory sf = new Configuration().configure().buildSessionFactory();
	            Session s = sf.openSession();
	            candidate = (Candidate) s.get(Candidate.class, id);
	            s.close();
	            sf.close();
	        } catch (HibernateException e) {
	        }
	        return candidate;
	}

	@Override
	public List<Candidate> listCandidate() {
		try {
            List<Candidate> candidates;
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            Criteria criteria = s.createCriteria(Candidate.class);
            candidates = (List<Candidate>) criteria.list();
            s.close();
            sf.close();
            return candidates;
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public boolean addCandidate(Candidate candidate) {
		 try {
	            SessionFactory sf = new Configuration().configure().buildSessionFactory();
	            Session s = sf.openSession();
	           
	            s.beginTransaction();
	            s.save(candidate);
	           
	            s.getTransaction().commit();
	            s.close();
	            sf.close();
	            return true;

	        } catch (HibernateException e) {
	            return false;
	        }

	}

	@Override
	public Candidate deleteCandidate(int id) {
		Candidate candidate = null;
        try {
            SessionFactory sf = new Configuration().configure().buildSessionFactory();
            Session s = sf.openSession();
            s.beginTransaction();
            candidate = (Candidate) s.get(Candidate.class, id);
            s.delete(candidate);
            s.getTransaction().commit();
            s.close();
            sf.close();
        } catch (HibernateException e) {
        }
        return candidate;
	}

	@Override
	public Candidate editCandidate(Candidate candidate) {
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
	        return candidate;
	}

	@Override
	public boolean existCandidateByUserName(String string) {
		 try {
	            Candidate candidate;
	            SessionFactory sf = new Configuration().configure().buildSessionFactory();
	            Session s = sf.openSession();
	            candidate = (Candidate) s.get(Candidate.class, string);
	            s.close();
	            sf.close();
	            if (candidate == null) {
	                return true;
	            } else {
	                return false;
	            }
	        } catch (HibernateException e) {
	            return false;
	        }
	    }
	

}
