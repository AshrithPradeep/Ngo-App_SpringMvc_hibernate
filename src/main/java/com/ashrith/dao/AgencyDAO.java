package com.ashrith.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ashrith.constant.Constant;
import com.ashrith.pojo.Agency;
import com.ashrith.pojo.AgencyVolunteer;
import com.ashrith.pojo.SessionBean;
import com.ashrith.pojo.User;
import com.ashrith.pojo.UserAgency;

@Repository
public class AgencyDAO extends DAO {

	@Autowired
	SessionBean sessionBean;

	public List<Agency> getAgencys() {

		begin();
		Session session = getSession();

		Query theQuery = session.createQuery("from Agency where isActive=:isActive");

		theQuery.setParameter("isActive", 1);
		// execute query and get result list
		List<Agency> agencys = theQuery.list();
		commit();
		close();
		return agencys;
	}

	public List<AgencyVolunteer> getVolunteerAgencys() {

		begin();
		Session session = getSession();

		List<AgencyVolunteer> agencyVolunteersLst = new ArrayList<AgencyVolunteer>();
		AgencyVolunteer agencyVolunteer = null;

		String quy = "select ag,ug.user.id,ug.activated from Agency ag\r\n"
				+ "left join UserAgency ug on ag.id=ug.agency.id and ug.user.id=:userId";
		Query qry = session.createQuery(quy);
		qry.setParameter("userId", sessionBean.getId());

		List l = qry.list();
		Iterator it = l.iterator();

		while (it.hasNext()) {
			Object rows[] = (Object[]) it.next();
			agencyVolunteer = new AgencyVolunteer();
			if (rows.length > 0 && rows[0] instanceof Agency) {
				agencyVolunteer.setAgency((Agency) rows[0]);
			}
			if (rows.length > 1 && rows[1] instanceof Integer) {
				agencyVolunteer.setUserId((Integer) rows[1]);
			}
			if (rows.length > 2 && rows[2] instanceof Integer) {
				agencyVolunteer.setStatus((Integer) rows[2]);
			}
			agencyVolunteersLst.add(agencyVolunteer);
//			System.out.println(rows[0] + " -- " + rows[1]);
		}
//		for (AgencyVolunteer agencyVolunteer2 : agencyVolunteersLst) {
//			System.out.println(agencyVolunteer2.toString());
//		}

		// execute query and get result list
		commit();
		close();
		return agencyVolunteersLst;
	}

	public void saveAgency(Agency theAgency) {

		begin();
		Session session = getSession();
		session.saveOrUpdate(theAgency);
		commit();
		close();

	}

	public Agency getAgency(int theId) {

		begin();
		Session session = getSession();

		// now retrieve/read from database using the primary key
		Agency theAgency = session.get(Agency.class, theId);
		commit();
		close();
		return theAgency;
	}

	public void deleteAgency(int theId) {

		begin();
		Session session = getSession();

		// delete object with primary key

		Agency theAgency = session.get(Agency.class, theId);
		theAgency.setIsActive(0);
		session.saveOrUpdate(theAgency);
		commit();
		close();
	}

	public void applyAgency(int userId, int agencyId) {

		begin();
		Session session = getSession();
		UserAgency userAgency = new UserAgency();
		Agency theAgency = session.get(Agency.class, agencyId);
		User theUser = session.get(User.class, userId);
		userAgency.setAgency(theAgency);
		userAgency.setUser(theUser);
		userAgency.setRegisteredDate(new Date());
		userAgency.setActivated(Constant.Application_Status.Applied);
		session.saveOrUpdate(userAgency);
		commit();
		close();

	}

	public List<AgencyVolunteer> getAgencysVolunteer(int agencyId) {

		begin();
		Session session = getSession();

		List<AgencyVolunteer> agencyVolunteersLst = new ArrayList<AgencyVolunteer>();
		AgencyVolunteer agencyVolunteer = null;

		String quy = "select u,ug.user.id,ug.activated from User u\r\n"
				+ "inner join UserAgency ug on u.id=ug.user.id and ug.agency.id=:agencyId";
		if (sessionBean.getRole().equals(Constant.Roles.Superintendent)) {
			quy += " where ug.activated=:successStatus";
		}
		Query qry = session.createQuery(quy);
		qry.setParameter("agencyId", agencyId);
		if (sessionBean.getRole().equals(Constant.Roles.Superintendent)) {
			qry.setParameter("successStatus", Constant.Application_Status.Approved);
		}

		List l = qry.list();
		Iterator it = l.iterator();

		while (it.hasNext()) {
			Object rows[] = (Object[]) it.next();
			agencyVolunteer = new AgencyVolunteer();
			if (rows.length > 0 && rows[0] instanceof User) {
				agencyVolunteer.setUser((User) rows[0]);
			}
			if (rows.length > 1 && rows[1] instanceof Integer) {
				agencyVolunteer.setUserId((Integer) rows[1]);
			}
			if (rows.length > 2 && rows[2] instanceof Integer) {
				agencyVolunteer.setStatus((Integer) rows[2]);
			}
			agencyVolunteer.setAgencyId(agencyId);
			agencyVolunteersLst.add(agencyVolunteer);
//			System.out.println(rows[0] + " -- " + rows[1]);
		}
		for (AgencyVolunteer agencyVolunteer2 : agencyVolunteersLst) {
			System.out.println(agencyVolunteer2.toString());
		}

		// execute query and get result list
		commit();
		close();
		return agencyVolunteersLst;
	}

	public void updateStatus(int userId, int agencyId, int status) {

		begin();
		Session session = getSession();
		UserAgency userAgency = new UserAgency();
		Agency theAgency = session.get(Agency.class, agencyId);
		User theUser = session.get(User.class, userId);
		userAgency.setAgency(theAgency);
		userAgency.setUser(theUser);
		userAgency.setRegisteredDate(new Date());
		userAgency.setActivated(status);
		session.saveOrUpdate(userAgency);
		commit();
		close();

	}

}
