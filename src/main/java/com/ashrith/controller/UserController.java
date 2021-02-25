package com.ashrith.controller;

//package com.project.myapp.controller;
//
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ashrith.constant.Constant;
import com.ashrith.dao.UserDAO;
import com.ashrith.pojo.SessionBean;
import com.ashrith.pojo.User;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	SessionBean sBean;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listUsers(Model theModel) {

		List<User> theUsers = new ArrayList<User>();
		if (sBean.getRole().equals(Constant.Roles.Admin)) {
			theUsers.addAll(userDao.getUsers());
		} else {
			User adh = userDao.getUser(sBean.getId());
			theUsers.add(adh);
		}

		theModel.addAttribute("users", theUsers);
		return "list-users";
	}

	@RequestMapping(value = "/showFormForAdd", method = RequestMethod.GET)
	public String showFormForAdd(Model theModel) {

		User theUser = new User();
		theUser.setUserType("institutionaluser");
		theModel.addAttribute("user", theUser);

		return "user-form";

	}

	@RequestMapping(value = "/showVolunteerForm", method = RequestMethod.GET)
	public String showVolunteerForm(Model theModel) {

		User theUser = new User();
		theUser.setRole(Constant.Roles.Volunteer);
		theUser.setUserType("volunteer");
		theModel.addAttribute("user", theUser);
		theModel.addAttribute("fromVolunteer", "yes");
		return "volunteer-form";

	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User theUser, Model theModel) {
		User existingUser = userDao.validateUser(theUser);
		if (existingUser == null || theUser.getId() != 0) {
			int id = 0;
			if (theUser.getId() == 0) {
				id = userDao.saveUser(theUser);
			} else {
				id = theUser.getId();
				userDao.updateUser(theUser);
			}
			String returnJsp = "index";
			if (theUser != null && theUser.getUserType() != null && theUser.getUserType().equals("institutionaluser")) {
				returnJsp = "redirect:/users/list";
			}

			if (id > 0) {
				theModel.addAttribute("volunteersignupsucess", "yes");
			} else {
				theModel.addAttribute("volunteersignupsucess", "no");
			}
			return returnJsp;
		} else {
			if (theUser != null && theUser.getUserType() != null && theUser.getUserType().equals("institutionaluser")) {
				theUser.setUserType("institutionaluser");
				theModel.addAttribute("user", theUser);
				theModel.addAttribute("validationMessage",
						"The username or email is already exist" + " Please try different one!!");

				return "user-form";
			} else {
				theUser.setRole(Constant.Roles.Volunteer);
				theUser.setUserType("volunteer");
				theModel.addAttribute("user", theUser);
				theModel.addAttribute("fromVolunteer", "yes");
				theModel.addAttribute("validationMessage",
						"The username or email is already exist" + " Please try different one!!");
				return "volunteer-form";
			}

		}

	}

	@RequestMapping(value = "/showFormForVolunteerUpdate", method = RequestMethod.GET)
	public String showFormForVolunteerUpdate(@RequestParam("usersId") int theId, Model theModel) {

		User theUser = userDao.getUser(theId);

		theModel.addAttribute("user", theUser);

		return "volunteer-form";

	}

	@RequestMapping(value = "/showFormForUpdate", method = RequestMethod.GET)
	public String showFormForUpdate(@RequestParam("usersId") int theId, Model theModel) {

		User theUser = userDao.getUser(theId);
		theUser.setUserType("institutionaluser");
		theModel.addAttribute("user", theUser);

		return "user-form";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("usersId") int theId) {

		userDao.deleteUser(theId);

		return "redirect:/users/list";
	}

}