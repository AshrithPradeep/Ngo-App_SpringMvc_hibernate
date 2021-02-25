package com.ashrith.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.ashrith.constant.Constant;
import com.ashrith.pojo.User;

@Repository
public class UserDAO extends DAO {

	public List<User> getUsers() {

		begin();
		Session session = getSession();

		Query theQuery = session.createQuery("from User where isActive=:isActive and role != :role");
		theQuery.setParameter("isActive", 1);
		theQuery.setParameter("role", Constant.Roles.Admin);
		List<User> users = theQuery.list();
		commit();
		close();
		return users;
	}

	public User validateUser(User theUser) {

		begin();
		Session session = getSession();
		Criteria criteria = session.createCriteria(User.class)
				.add(Restrictions.disjunction().add(Restrictions.eq("username", theUser.getUsername()))
						.add(Restrictions.eq("email", theUser.getEmail())));

		User user = (User) criteria.uniqueResult();

		close();

		return user;
	}

	public int saveUser(User theUser) {
		Integer vId = null;
		try {
			begin();
			Session session = getSession();
			theUser.setIsActive(1);
			vId = (Integer) session.save(theUser);
			commit();
			close();
		} catch (HibernateException he) {
			rollback();
		}

		return vId;

	}

	public void updateUser(User theUser) {

		try {
			begin();
			Session session = getSession();
			theUser.setIsActive(1);
			session.saveOrUpdate(theUser);
			commit();
			close();
		} catch (HibernateException he) {
			rollback();
		}

	}

	public User getUser(int theId) {
		User theUser = null;
		try {
			begin();
			Session session = getSession();
			theUser = session.get(User.class, theId);
			commit();
			close();

		} catch (HibernateException he) {
			rollback();
		}
		return theUser;
	}

	public void deleteUser(int theId) {
		try {
			begin();
			Session session = getSession();
			User theUser = session.get(User.class, theId);
			theUser.setIsActive(0);
			session.saveOrUpdate(theUser);
			commit();
			close();
		} catch (HibernateException he) {
			rollback();
		}
	}

	@SuppressWarnings("unchecked")
	public User findUserByLogin(String login) {
		List<User> list = null;
		User users = null;
		try {
			list = new ArrayList<User>();
			begin();
			Session session = getSession();
			Query query = session.createQuery("from User where login = :login");
			query.setParameter("login", login);
			list = query.list();
			if (list.size() > 0) {
				users = list.get(0);
			}
			commit();
			close();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return users;
	}

}
