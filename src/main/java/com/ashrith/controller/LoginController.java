package com.ashrith.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ashrith.constant.Constant;
import com.ashrith.dao.LoginDao;
import com.ashrith.pojo.Login;
import com.ashrith.pojo.SessionBean;

@Controller
public class LoginController {

	@Autowired
	LoginDao loginDao;

	@Autowired
	SessionBean sessionBean;

	// add request mapping for /access-denied

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signIn(@ModelAttribute("login") Login login, HttpServletRequest req) {

		loginDao.getValidUser(login.getUsername(), login.getUserpassword());
		req.getSession().setAttribute("sessionBean", sessionBean);
		if (sessionBean != null && sessionBean.getRole() != null
				&& sessionBean.getRole().equals(Constant.Roles.Volunteer)) {
			return "redirect:/agency/volunteer/list";
		} else if (sessionBean != null && sessionBean.getRole() != null
				&& sessionBean.getRole().equals(Constant.Roles.Data_Entry_Manager)) {
			return "redirect:/agency/list";
		} else if (sessionBean != null && sessionBean.getRole() != null
				&& sessionBean.getRole().equals(Constant.Roles.Application_Manager)) {
			return "redirect:/agency/list";
		} else if (sessionBean != null && sessionBean.getRole() != null
				&& sessionBean.getRole().equals(Constant.Roles.Superintendent)) {
			return "redirect:/agency/list";
		} else if (sessionBean != null && sessionBean.getRole() != null) {
			return "redirect:/users/list";
		} else {
			return "access-denied";
		}

	}

	/**
	 * Log out link click. redirect to login page.
	 *
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
}
