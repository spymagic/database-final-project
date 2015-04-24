package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.neu.cs5200.model.Movie;
import edu.neu.cs5200.model.MovieDao;


/**
 * Servlet implementation class AddMovieServlet
 */


@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		MovieDao dao = new MovieDao();
		Movie movie = new Movie();
		movie.setTitle(title);
		dao.createMovie(movie);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp"); 
		dispatcher.forward(request, response);
}
}