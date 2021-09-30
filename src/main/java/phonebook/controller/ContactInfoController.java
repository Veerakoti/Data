package phonebook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import phonebook.model.Contact;
import phonebook.service.ContactService;

@Controller
public class ContactInfoController {

	@Autowired
	private ContactService service;
	
	@GetMapping(value = { "/","/addContact"})
	public String loadForm(Model model) {
		Contact contact=new Contact();
		model.addAttribute("contact",contact);
		return "contactinfo";
	}
	
	@PostMapping(value = ("/saveContact"))
	public String handleSubmitBtn(@ModelAttribute("contact") Contact contact,RedirectAttributes attributes) {
		boolean isSaved=service.saveContact(contact);
		if(isSaved) {
			//model.addAttribute("success", "contact saved successfully");
			//return "redirect:/viewContacts";
			attributes.addFlashAttribute("success", "contact saved successfully");
			
		}else {
			//model.addAttribute("error","failed to save contact data");
			attributes.addFlashAttribute("error","failed to save contact data");
		}
		return "redirect:/addContact";
	}
	
	@GetMapping(value="/viewContacts")
	public String handleViewContactList(Model model) {
		List<Contact> contactList=service.getAllContacts();
		model.addAttribute("contactDetailsList", contactList);
		return "viewContacts";
	}

}
