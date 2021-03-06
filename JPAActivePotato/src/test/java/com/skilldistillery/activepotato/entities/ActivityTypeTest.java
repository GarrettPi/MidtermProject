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

class ActivityTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ActivityType at;

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
		at = em.find(ActivityType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		at = null;
	}

	@Test
	void test_activitytype_entity_mapping() {
		assertNotNull(at);
		assertEquals("Movie", at.getName());
	}
	
	@Test
	void test_activitytype_OneToMany_activity_mapping() {
		assertNotNull(at);
		assertEquals(111, at.getActivity().get(0).getExpectedDuration());
	}

}
