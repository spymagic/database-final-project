package edu.neu.cs5200.model;

import java.util.List;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;


@Path("api/movie")
public class MovieService{


		@GET
		@Path("/test")
		public String hello(){
			return "Heool Wqqaa";
		}
	
		
		@GET
		@Path("/")
		@Produces(MediaType.APPLICATION_JSON)
		public List<Movie> findAllMovies(){
			MovieDao dao = new MovieDao();
			return dao.findAllMovies();
		}
		
		@GET
		@Path("/{id}")
		@Produces(MediaType.APPLICATION_JSON)
		public Movie findMovie(@PathParam("id") int id){
			MovieDao dao = new MovieDao();
			return dao.findMovieById(id);
		}
     

	
	
	public static void main(String[] args) {
		MovieService service = new MovieService();
		List<Movie> movies = service.findAllMovies();
		for(Movie movie: movies){
			System.out.println(movie.getTitle());
		}
	}
}
