package com.ashrith.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ashrith.dao.AgencyDAO;
import com.ashrith.pojo.Agency;
import com.ashrith.pojo.AgencyVolunteer;

@Controller
@RequestMapping("/agency")
public class AgencyController {

	@Autowired
	private AgencyDAO agencyDao;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listAgencys(Model theModel) {

		// get Agencys from the service
		List<Agency> theAgencys = agencyDao.getAgencys();

		// add the Agencys to the model
		theModel.addAttribute("agency", theAgencys);

		return "list-agency";
	}

	@RequestMapping(value = "/volunteer/list", method = RequestMethod.GET)
	public String listVolunteerAgencys(Model theModel) {

		List<AgencyVolunteer> theAgencys = agencyDao.getVolunteerAgencys();
		// add the Agencys to the model
		theModel.addAttribute("agency", theAgencys);

		return "list-volunteer-agency";
	}

	@RequestMapping(value = "/showFormForAdd", method = RequestMethod.GET)
	public String showFormForAdd(Model theModel) {

		// create model attribute to bind form data
		Agency theAgency = new Agency();

		theModel.addAttribute("agency", theAgency);

		return "agency-form";
	}

	@RequestMapping(value = "/saveAgency", method = RequestMethod.POST)
	public String saveAgency(@ModelAttribute("agency") Agency theAgency) {

		// save the Agency using our service
		agencyDao.saveAgency(theAgency);

		return "redirect:/agency/list";
	}

	@RequestMapping(value = "/showFormForUpdate", method = RequestMethod.GET)
	public String showFormForUpdate(@RequestParam("agencyId") int theId, Model theModel) {

		Agency theAgency = agencyDao.getAgency(theId);

		// set Agency as a model attribute to pre-populate the form
		theModel.addAttribute("agency", theAgency);

		// send over to our form
		return "agency-form";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteAgency(@RequestParam("agencyId") int theId) {

		// delete the Agency
		agencyDao.deleteAgency(theId);

		return "redirect:/agency/list";
	}

	@RequestMapping(value = "/volunteerreq", method = RequestMethod.GET)
	public String applicationRequest(@RequestParam("agencyId") int agencyId, Model theModel) {

		List<AgencyVolunteer> theUsers = agencyDao.getAgencysVolunteer(agencyId);
		// add the Agencys to the model
		theModel.addAttribute("users", theUsers);
		return "list-agency-users";
	}

	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String applyForAgency(@RequestParam("agencyId") int agencyId, @RequestParam("userId") int userId,
			Model theModel) {

		agencyDao.applyAgency(userId, agencyId);

		return "redirect:/agency/volunteer/list";
	}

	@RequestMapping(value = "/applicationUpdate", method = RequestMethod.GET)
	public String applicationUpdate(@RequestParam("agencyId") int agencyId, @RequestParam("userId") int userId,
			@RequestParam("status") int status, Model theModel) {

		agencyDao.updateStatus(userId, agencyId, status);

		return "redirect:/agency/volunteerreq?agencyId="+agencyId;
	}

}
