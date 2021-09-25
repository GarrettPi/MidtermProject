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

class ActivityTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Activity a;

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
		a = em.find(Activity.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		a = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(a);
		assertEquals("Malignant", a.getName());
	}

	@Test
	void test_activity_OneToMany_activityRatings_mapping() {
		assertNotNull(a);
		assertEquals("IMDb", a.getActivityRatings().get(0).getName());
	}

	@Test
	void test_activity_ManyToOne_activityType_mapping() {
		assertNotNull(a);
		assertEquals("Movie", a.getActivityType().getName());
	}

	@Test
		void test_activity_ManyToOne_User_mapping() {
		assertNotNull(a);
		assertEquals("insert", a.getUser().getFirstName());
		}

	@Test
	void test_activity_OneToMany_comments_mapping() {
		assertNotNull(a);
		assertEquals(1, a.getComments().size());
	}


}
