package com.skilldistillery.activepotato.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.OneToMany;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User u;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAActivePotato");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		u = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		u = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(u);
		assertEquals("insert", u.getUsername());
	}
	
	
	@Test
	void test_User_OneToMany_activity_mapping() {
		assertNotNull(u);
		assertEquals(188, u.getActivity().size());
	}
	
	@Test
	void test_User_OneToMany_comment_mapping() {
		assertNotNull(u);
		assertEquals("it was great", u.getComments().get(0).getComment());
	}

}
