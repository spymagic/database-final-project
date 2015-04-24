package edu.neu.cs5200.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MovieClient {

	public final String FIND_MOVIE_BY_TITLE = "http://www.myapifilms.com/imdb?title=MOVIE_TITLE&format=JSON&aka=0&business=0&seasons=0&seasonYear=0&technical=0&filter=M&exactFilter=1&limit=10&forceYear=0&lang=en-us&actors=N&biography=0&trailer=0&uniqueName=0&filmography=0&bornDied=0&starSign=0&actorActress=0&actorTrivia=0&movieTrivia=0&awards=0&moviePhotos=N&movieVideos=N&similarMovies=0";
	public final String FIND_MOVIE_BY_TITLE_Only_One = "http://www.myapifilms.com/imdb?title=MOVIE_TITLE&format=JSON&aka=0&business=0&seasons=0&seasonYear=0&technical=0&filter=N&exactFilter=0&limit=1&forceYear=0&lang=en-us&actors=N&biography=0&trailer=0&uniqueName=0&filmography=0&bornDied=0&starSign=0&actorActress=0&actorTrivia=0&movieTrivia=0&awards=0&moviePhotos=N&movieVideos=N&similarMovies=0";
	
	public Movie[] findMoviesByTitle(String title)
	{
		String urlStr = FIND_MOVIE_BY_TITLE.replace("MOVIE_TITLE", title);	
		String json = getJsonStringForUrl(urlStr);
		ObjectMapper mapper = new ObjectMapper();
		try {
			Movie[] movies= mapper.readValue(json, Movie[].class);
			return movies;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;	
	}

	
	public Movie findMovieByTitle(String title)
	{
		String urlStr = FIND_MOVIE_BY_TITLE_Only_One.replace("MOVIE_TITLE", title);	
		String json = getJsonStringForUrl(urlStr);
		System.out.println(urlStr);
		System.out.println(json);
		ObjectMapper mapper = new ObjectMapper();
		Movie movie = null;
			try {
			Movie[]	movies = mapper.readValue(json, Movie[].class);
		    movie=movies[0];
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return movie;
	}

	private String getJsonStringForUrl(String urlStr) {
		try {
			String newStr = urlStr.replace(" ", "%20");
			URL url = new URL(newStr);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			InputStream stream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(stream);
			BufferedReader buffer = new BufferedReader(reader);
			String line;
			String json="";
			while((line = buffer.readLine()) !=null) {
				json += line;
			}
			return json;
			
			
		}catch(IOException e){
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args)
	{
		MovieClient client = new MovieClient();
		Movie movie = client.findMovieByTitle("the godfather");
//		for(Movie movie:movies){
			System.out.println(movie.getTitle());
			System.out.println(movie.getYear());
			System.out.println(movie.getUrlPoster());
			System.out.print(movie.getSimplePlot());
		}
	}

