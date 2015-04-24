package edu.neu.cs5200.model;

import java.io.Serializable;
import java.lang.String;
import java.sql.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Entity implementation class for Entity: Movie
 *
 */
@Entity
@JsonIgnoreProperties(ignoreUnknown=true)
public class Movie implements Serializable {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String year;
	String title;   
	String rating;
	String urlPoster;
	String simplePlot;
	String plot;
	
	
	@OneToMany(mappedBy="movie")
	List<Actor> actors;
	
	@ManyToMany(mappedBy="movies")
	private List<User> users;	
	
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void setYear(String year) {
		this.year = year;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getYear() {
		return year;
	}
	public String getRating() {
		return rating;
	}

	@OneToMany(mappedBy="movie", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Comment> comments; 
	
	public List<Actor> getActors() {
		return actors;
	}
	public void setActors(List<Actor> actors) {
		this.actors = actors;
	}

	private static final long serialVersionUID = 1L;

	public Movie() {
		super();
	}  
	

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   


	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getUrlPoster() {
		return urlPoster;
	}
	public void setUrlPoster(String urlPoster) {
		this.urlPoster = urlPoster;
	}
	public String getSimplePlot() {
		return simplePlot;
	}
	public void setSimplePlot(String simplePlot) {
		this.simplePlot = simplePlot;
	}
	
   
}
