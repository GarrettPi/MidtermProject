package com.skilldistillery.activepotato.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ActivityRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ActivityRating ar;

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
		ar = em.find(ActivityRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ar = null;
	}

	@Test
	void test_activityrating_entity_mapping() {
		assertNotNull(ar);
		assertEquals("IMDb", ar.getName());
	}
	
	@Test
	@DisplayName("activity rating and activity entity relational mapping")
	void test_activityRating_activity_mapping() {
		assertNotNull(ar);
		assertTrue( ar.getActivity().getActivityRatings().size() > 0);
	
	}
}
