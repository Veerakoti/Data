package phonebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phonebook.model.Contact;
import phonebook.service.ContactService;
@Controller
public class ViewContactsController {
	@Autowired
	private ContactService service;

	@RequestMapping("/editContact")
	public String editContact(@RequestParam("cid") Integer contactId, Model model) {
		Contact contactById = service.getContactById(contactId);
		model.addAttribute("contact", contactById);
		return "contactinfo";
	}
	@RequestMapping("/deleteContact")
	public String deleteContact(@RequestParam("cid") Integer contactId, Model model) {
		boolean isDeleted = service.deleteContact(contactId);
		if(isDeleted) {
			model.addAttribute("delete", "Contact Delete Successfully");
		return"redirect:/viewContacts";
		}
		return "contactinfo";
	}
}
