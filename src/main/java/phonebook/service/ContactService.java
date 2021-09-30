package phonebook.service;

import java.util.List;

import phonebook.model.Contact;

public interface ContactService {
	public boolean saveContact(Contact contact);
	public List<Contact> getAllContacts();
	public Contact getContactById(Integer cid);
	public boolean updateContact(Contact contact);
	public boolean deleteContact(Integer cid);

}
