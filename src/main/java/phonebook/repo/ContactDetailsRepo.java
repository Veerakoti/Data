package phonebook.repo;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import phonebook.entity.ContactEntity;
public interface ContactDetailsRepo extends JpaRepository<ContactEntity, Serializable> {

}
