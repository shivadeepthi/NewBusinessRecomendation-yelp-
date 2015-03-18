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
 * Servlet implementation class RatingDistribution
 */
@WebServlet("/RatingDistributionBusinessServlet")
public class RatingDistributionBusinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseConnection rating_business = new DataBaseConnection();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingDistributionBusinessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String topics[] = { "BreakFast","FastFood","Ambience","Mexican","Family Oriented","Service","Asian","Fine dining","Italian","Worthiness"};
		System.out.println("inside doget");
		HttpSession session = request.getSession();
		DataBean[] rating_business1 = new DataBean[9];
		String t;
		try
		{
			
			String business_name=request.getParameter("business_name");
			System.out.println(business_name);
			rating_business1=rating_business.ratingDistribution(business_name);
			
			//System.out.println("rating_business1"+rating_business1);
			
			//y=Integer.parseInt(request.getParameter("y"));
			session.setAttribute("business_distribution", rating_business1);
			session.setAttribute("topics", topics);
			//session.setAttribute("year", y);
			//sessionVar = sessionVar+ "_" + y;
			//if(session.getAttribute()==null){
				//topTagesPerYear1=topTagesPerYear.TopTagesPerYear(t,y);
				//session.setAttribute(sessionVar, topTagesPerYear1);
			//}
			System.out.println("forwarding to page");
			
			RequestDispatcher view = request.getRequestDispatcher("singleRestaurant.jsp");
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
		String topics[] = { "BreakFast","FastFood","Ambience","Mexican","Family Oriented","Service","Asian","Fine dining","Italian","Worthiness"};
		System.out.println("inside doget");
		HttpSession session = request.getSession();
		DataBean[] rating_business1 = new DataBean[9];
		String t;
		try
		{
			
			String business_name=request.getParameter("business_name");
			System.out.println(business_name);
			rating_business1=rating_business.ratingDistribution(business_name);
			
			//System.out.println("rating_business1"+rating_business1);
			
			//y=Integer.parseInt(request.getParameter("y"));
			session.setAttribute("business_distribution", rating_business1);
			session.setAttribute("topics", topics);
			//session.setAttribute("year", y);
			//sessionVar = sessionVar+ "_" + y;
			//if(session.getAttribute()==null){
				//topTagesPerYear1=topTagesPerYear.TopTagesPerYear(t,y);
				//session.setAttribute(sessionVar, topTagesPerYear1);
			//}
			System.out.println("forwarding to page");
			
			RequestDispatcher view = request.getRequestDispatcher("singleRestaurant.jsp");
			view.forward(request, response);
		}
		catch(Exception e){
			
		}
	}

}
