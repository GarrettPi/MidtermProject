package com.skilldistillery.activepotato.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ExperienceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Experience e;

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
		e = em.find(Experience.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		e = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(e);
		assertEquals("jt", e.getId());
	}

}
