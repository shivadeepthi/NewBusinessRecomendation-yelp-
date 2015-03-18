package Servlets;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class RatingDistributionCityServlet
 */
@WebServlet("/RatingDistributionCityServlet")
public class RatingDistributionCityServlet extends HttpServlet {
	DataBaseConnection rating_business = new DataBaseConnection();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingDistributionCityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("inside doget");
		HttpSession session = request.getSession();
		DataBean[] rating_city1 = new DataBean[9];
		String t;
		//ArrayList<String> topics=new ArrayList<String>();
		String topics[] = { "BreakFast","FastFood","Ambience","Mexican","Family Oriented","Service","Asian","Fine dining","Italian","Worthiness"};
		
		try
		{
			
			String city_name=request.getParameter("city_name");
			System.out.println(city_name);
			rating_city1=rating_business.ratingDistributionCity(city_name);
			
			JSONObject obj = new JSONObject();
			obj.put("name", city_name);
			//obj.put("value", 100);
			int total_count=0;
			JSONArray list = new JSONArray();
			//JSONObject obj1 = new JSONObject();
	
			for(int i=0;i<=9;i++){
				//String objectName = "Car" + i;
				
				JSONObject obj1 = new JSONObject();
				
				System.out.println("i"+i);
				total_count=total_count+rating_city1[i].getTopicDistributionCount();
				System.out.println("topic"+topics[i]);
				System.out.println("value"+rating_city1[i].getTopicDistributionCount());
				obj1.put("name", topics[i]);
				obj1.put("value", rating_city1[i].getTopicDistributionCount());
				list.add(obj1);
			}
			obj.put("value", total_count);
			obj.put("children", list);
			
			
			
			
			BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("/Users/deepu/Documents/workspace/Cmpe239_Project/WebContent/topics.json")));
//			FileWriter file = new FileWriter(getServletContext().getRealPath("/test.json"));
//			System.out.println(obj.toJSONString());
//			file.write(obj.toJSONString());
//			file.flush();
//			file.close();
			System.out.println(obj.toJSONString());
			bw.write(obj.toJSONString());
	        bw.flush();
			bw.close();
			RequestDispatcher view = request.getRequestDispatcher("cityGraph.jsp");
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
		System.out.println("inside dopost");
		HttpSession session = request.getSession();
		DataBean[] rating_city1 = new DataBean[9];
		String t;
		//ArrayList<String> topics=new ArrayList<String>();
		String topics[] = { "BreakFast","FastFood","Ambience","Mexican","Family Oriented","Service","Asian","Fine dining","Italian","Worthiness"};
		
		try
		{
			
			String city_name=request.getParameter("city_name");
			System.out.println(city_name);
			rating_city1=rating_business.ratingDistributionCity(city_name);
			
			JSONObject obj = new JSONObject();
			obj.put("name", city_name);
			//obj.put("value", 100);
			int total_count=0;
			JSONArray list = new JSONArray();
			//JSONObject obj1 = new JSONObject();
	
			for(int i=0;i<=9;i++){
				//String objectName = "Car" + i;
				
				JSONObject obj1 = new JSONObject();
				
				System.out.println("i"+i);
				total_count=total_count+rating_city1[i].getTopicDistributionCount();
				System.out.println("topic"+topics[i]);
				System.out.println("value"+rating_city1[i].getTopicDistributionCount());
				obj1.put("name", topics[i]);
				obj1.put("value", rating_city1[i].getTopicDistributionCount());
				list.add(obj1);
			}
			obj.put("value", total_count);
			obj.put("children", list);
			
			
			
			
			BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("/Users/deepu/Documents/workspace/Cmpe239_Project/WebContent/topics.json")));
//			FileWriter file = new FileWriter(getServletContext().getRealPath("/test.json"));
//			System.out.println(obj.toJSONString());getResourcePaths
//			file.write(obj.toJSONString());
//			file.flush();
//			file.close();
			System.out.println(obj.toJSONString());
			bw.write(obj.toJSONString());
	        bw.flush();
			bw.close();
			RequestDispatcher view = request.getRequestDispatcher("cityGraph.jsp");
			view.forward(request, response);
		}
		catch(Exception e){
			
		}
	}

}
