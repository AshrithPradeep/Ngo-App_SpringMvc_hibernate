package com.ashrith.pojo;

public class AgencyVolunteer {
	private Agency agency;
	private User user;
	private int userId;
	private int status;
	private int agencyId;

	public Agency getAgency() {
		return agency;
	}

	public void setAgency(Agency agency) {
		this.agency = agency;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(int agencyId) {
		this.agencyId = agencyId;
	}

	@Override
	public String toString() {
		return "AgencyVolunteer [agency=" + agency + ", userId=" + userId + ", status=" + status + "]";
	}

}
