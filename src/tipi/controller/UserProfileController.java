package tipi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tipi.bean.UserCompanyBean;
import tipi.bean.UserCompanyBeanImpl;
import tipi.bean.UserProfileBean;
import tipi.bean.UserProfileBeanImpl;

@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userProfile")
public class UserProfileController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		if (!model.containsAttribute("userProfile")) {
			
			UserProfileBean emptyUser = new UserProfileBeanImpl();
			UserCompanyBean emptyCompany = new UserCompanyBeanImpl();
			emptyCompany.setAddress("Kuja 3");
			emptyCompany.setCity("Vantaa");
			emptyCompany.setCompany_id(4);
			emptyCompany.setName("Autoliike");
			emptyCompany.setPostalCode("00120");
			emptyUser.setfName("Pekka");
			emptyUser.setlName("Padas");
			emptyUser.setPhoneNo("0400123123");
			emptyUser.setEmail("esim@sivu.fi");
			emptyUser.setUsername("kayttaja");
			emptyUser.setCompany(emptyCompany);
			
			model.addAttribute("userProfile", emptyUser);
		}
		return "/user/profile";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest req) {
		System.out.println(req.getParameter("oldPassword"));
		System.out.println(req.getParameter("password"));
		
		return "/user/profile";
	}
}