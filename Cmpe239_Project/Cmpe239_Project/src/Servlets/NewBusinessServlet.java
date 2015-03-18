package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewBusinessServlet
 */
@WebServlet("/NewBusinessServlet")
public class NewBusinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseConnection dbcon = new DataBaseConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBusinessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside doget");
		HttpSession session = request.getSession();
		DataBean[] cityList = new DataBean[61];
		String t;
		try
		{			
			
			//System.out.println("rating_business1"+rating_business1);
			
			//y=Integer.parseInt(request.getParameter("y"));
			
			//session.setAttribute("year", y);
			//sessionVar = sessionVar+ "_" + y;
			if(session.getAttribute("cities")==null){
				cityList=dbcon.getCities();
				session.setAttribute("cities", cityList);
			}
			
			RequestDispatcher view = request.getRequestDispatcher("newBusiness.jsp");
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
