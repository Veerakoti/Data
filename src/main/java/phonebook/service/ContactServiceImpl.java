package phonebook.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phonebook.entity.ContactEntity;
import phonebook.model.Contact;
import phonebook.repo.ContactDetailsRepo;
@Service
public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactDetailsRepo detailsRepo;
	public boolean saveContact(Contact contact) {
		ContactEntity entity=new ContactEntity();
		BeanUtils.copyProperties(contact, entity);
		ContactEntity savedEntity=detailsRepo.save(entity);
		return savedEntity.getContactId() != null;
	}

	public List<Contact> getAllContacts() {
		List<ContactEntity> entites=detailsRepo.findAll();
		List<Contact> contacts=new ArrayList<Contact>();
		// legasy approach===================================================================

		for (ContactEntity entity : entites) {
			Contact contact=new Contact();
			BeanUtils.copyProperties(entity, contact);
			contacts.add(contact);
		}


		//java 8 approach
		/*
		 * List<Contact> contacts=entites.stream().map(entity -> { Contact contact=new
		 * Contact(); BeanUtils.copyProperties(contact, entity); return contact;
		 * }).collect(Collectors.toList());
		 */
		return contacts;
	}

	public Contact getContactById(Integer cid) {
		Optional<ContactEntity> findById = detailsRepo.findById(cid);
		if(findById.isPresent()) {
			ContactEntity entity=findById.get();
			Contact contact=new Contact();
			BeanUtils.copyProperties(entity, contact);
			return contact;
		}
		return null;
	}

	public boolean updateContact(Contact contact) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteContact(Integer cid) {
		detailsRepo.deleteById(cid);
		return true;
	}



}
