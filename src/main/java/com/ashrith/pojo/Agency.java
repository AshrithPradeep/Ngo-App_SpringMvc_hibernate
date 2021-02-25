package com.ashrith.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

/**
 * @author mangu
 *
 */
@Entity
@Table(name = "agency")
public class Agency {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "address")
	private String address;

	@Column(name = "email")
	private String email;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "workfield")
	private String workField;

	@Column(name = "expyear")
	private int expYear;

	@Column(name = "typeofreq")
	private String typeOfReq;

	@Column(name = "workdesc")
	private String workDesc;

	@Column(name = "isactive")
	private Integer isActive = 1;

	@OneToMany(mappedBy = "agency")
	private Set<UserAgency> userAgency = new HashSet<UserAgency>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getWorkField() {
		return workField;
	}

	public void setWorkField(String workField) {
		this.workField = workField;
	}

	public int getExpYear() {
		return expYear;
	}

	public void setExpYear(int expYear) {
		this.expYear = expYear;
	}

	public String getTypeOfReq() {
		return typeOfReq;
	}

	public void setTypeOfReq(String typeOfReq) {
		this.typeOfReq = typeOfReq;
	}

	public String getWorkDesc() {
		return workDesc;
	}

	public void setWorkDesc(String workDesc) {
		this.workDesc = workDesc;
	}

	public Set<UserAgency> getUserAgency() {
		return userAgency;
	}

	public void setUserAgency(Set<UserAgency> userAgency) {
		this.userAgency = userAgency;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Agency [id=" + id + ", name=" + name + ", address=" + address + ", email=" + email + ", mobile="
				+ mobile + ", expYear=" + expYear + ", typeOfReq=" + typeOfReq + "]";
	}
}
