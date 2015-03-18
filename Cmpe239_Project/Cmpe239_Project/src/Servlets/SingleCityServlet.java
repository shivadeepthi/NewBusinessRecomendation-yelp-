package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import net.sf.json.JSONArray;

/**
 * Servlet implementation class SingleCityServlet
 */
@WebServlet("/SingleCityServlet")
public class SingleCityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseConnection dbcon = new DataBaseConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingleCityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> restaurants = new ArrayList<String>();
		HttpSession session = request.getSession();
		DataBean[] cityList = new DataBean[61];
		int total=0;
		
		try
		{			
			
			//System.out.println("rating_business1"+rating_business1);
			
			//y=Integer.parseInt(request.getParameter("y"));
			
			//session.setAttribute("year", y);
			//sessionVar = sessionVar+ "_" + y;
			restaurants=dbcon.getRestuarants(request.getParameter("cityName"));
			total=restaurants.size();
			System.out.println("total"+total);
			
			session.setAttribute("restaurants",restaurants);
			session.setAttribute("total", total);
						
			//response.setContentType("text/plain");  
			  //response.setCharacterEncoding("UTF-8"); 
			  //response.getWriter().write(restaurants.toString()); 
			if(session.getAttribute("cities")==null){
				cityList=dbcon.getCities();
				session.setAttribute("cities", cityList);
			}
			RequestDispatcher view = request.getRequestDispatcher("singleCity.jsp");
			view.forward(request, response);
		}
		catch(Exception e){
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
