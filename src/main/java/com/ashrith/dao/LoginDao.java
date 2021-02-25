package com.ashrith.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ashrith.pojo.SessionBean;
import com.ashrith.pojo.User;

@Repository
public class LoginDao extends DAO {

	@Autowired
	SessionBean sessionBean;

	public User getValidUser(String username, String password) {

		begin();
		Session session = getSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		criteria.add(Restrictions.eq("pwd", password));
		User user = (User) criteria.uniqueResult();
		if (user != null) {
			sessionBean.setId(user.getId());
			sessionBean.setLogin(user.getUsername());
			sessionBean.setFirstName(user.getFirstname());
			sessionBean.setRole(user.getRole());
		}
		commit();
		close();

		return user;
	}

}
