package edu.neu.cs5200.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.model.Actor;

public class ActorDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MovieWeb");

	
	public List<Actor> ListActorsForMovie(String movieId) {
		List<Actor> actors = new ArrayList<Actor>();
		EntityManager em = factory.createEntityManager();
		int movieId1 = Integer.parseInt(movieId); 
		Movie movie = em.find(Movie.class, movieId1);
		actors = movie.getActors();
		
		return actors;
	}
	
	public List<Actor> findAllActors()
	{
		List<Actor> actors = new ArrayList<Actor>();
		EntityManager em = factory.createEntityManager();
		Query query = em.createQuery("select a from Actor a");
		actors =query.getResultList();	
		return actors;
	}
	
	public void removeActorById(int id){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		Actor actor = em.find(Actor.class, id);
		em.remove(actor);
		em.getTransaction().commit();

	}
	
	public static void main(String[] args) {
		ActorDao dao = new ActorDao();
		List<Actor> actors = dao.ListActorsForMovie("1");
		for (Actor actor:actors){
			System.out.print(actor.getName());
		}
		
	}
}
