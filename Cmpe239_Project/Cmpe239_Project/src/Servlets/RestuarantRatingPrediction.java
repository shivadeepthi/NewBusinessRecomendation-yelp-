package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class RestuarantRatingPrediction
 */
@WebServlet("/RestuarantRatingPrediction")
public class RestuarantRatingPrediction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseConnection dbcon = new DataBaseConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestuarantRatingPrediction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("--------inside doget of restuarat rating servlet---------");
//		List<Float> ratings=new ArrayList<Float>();
//		HttpSession session=request.getSession();
//		DataBean[] dataBean=new DataBean[11];
		String restuarantName=request.getParameter("input");
		System.out.println("resturant Name"+restuarantName);
		try {
			JSONArray rating=dbcon.getRestuarantPrediction(restuarantName);
//			response.setContentType("text/plain");  
//			  response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			System.out.println(rating.toString());
			  response.getWriter().write(rating.toString()); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
