package Servlets;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


//ßimport org.apache.hadoop.hive.jdbc.*;




public class DataBaseConnection {
	//private static String driverName = "com.mysql.jdbc.Driver";
	/**
	* @param args
	* @throws SQLException
	**/
	Connection con = null;
	static ResultSet rs;
    Statement stmt = null;
//    jdbc:mysql://us-cdbr-iron-east-01.cleardb.net:3306/ad_4b5e957890504e4
//    private static Connection getConnection() throws URISyntaxException, SQLException {
//        URI dbUri = new URI(System.getenv("CLEARDB_DATABASE_URL"));
//
//        String username = dbUri.getUserInfo().split(":")[0];
//        String password = dbUri.getUserInfo().split(":")[1];
//        String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();
//
//        return DriverManager.getConnection(dbUrl, username, password);
//    }
	DataBaseConnection(){
		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe239Project","root","");
			stmt = con.createStatement();
				if(!con.isClosed())
					System.out.println("Successfully Connected!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*String tableName = "testHiveDriverTable";
		stmt.executeQuery("drop table " + tableName);
		ResultSet res = stmt.executeQuery("create table " + tableName + " (key int, value string)");*/
		
		
	}
	public DataBean[] ratingDistribution(String businessName)
	{
		String query;
		//String productStatus ="Purchased";
		ResultSet res;
		DataBean[] topicDistribution = null;
		int i=0;
		try{
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic0 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic1 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic2 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic3 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic4 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic5 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic6 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic7 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic8 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.name,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where topic9 > 0.2 and name ='"+businessName+"' ";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return topicDistribution;
	}
	
	public DataBean[] ratingDistributionCity(String cityName)
	{
		String query;
		//String productStatus ="Purchased";
		ResultSet res;
		DataBean[] topicDistribution = null;
		int i=0;
		try{
			
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic0 > 0.01 and city ='"+cityName+"'";		
			System.out.println(query);
			res = stmt.executeQuery(query);
			topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic1 > 0.01 and city ='"+cityName+"'";		
			res = stmt.executeQuery(query);
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic2 > 0.01 and city ='"+cityName+"'";		
			res = stmt.executeQuery(query);
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic3 > 0.01 and city ='"+cityName+"'";		
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic4 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic5 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic6 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic7 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic8 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
			query="Select yr.city,count(dt.srno) as review_count_topic from topicdistribution dt inner join business_review yr on dt.srno=yr.srno where yr.stars>2 and topic9 > 0.01 and city ='"+cityName+"'";
			res = stmt.executeQuery(query);
			//topicDistribution = new DataBean[10];
			while(res.next())
			{
				topicDistribution[i] = new DataBean();
				System.out.println(res.getInt("review_count_topic"));
				topicDistribution[i].setTopicDistributionCount(res.getInt("review_count_topic"));
				i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return topicDistribution;
	}
	public DataBean[] getCities() throws SQLException
	{
		Statement stmt = null;
	    stmt = con.createStatement();
		String query;
		//String productStatus ="Purchased";
		ResultSet res;
		DataBean[] cities = null;
		int i=0;
		try{
			query="Select distinct city from business_review";		
			res = stmt.executeQuery(query);
			cities = new DataBean[61];
			while(res.next())
			{
				cities[i] = new DataBean();
				cities[i].setCity(res.getString("city"));
				i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cities;
	}
	
	public List<String> getRestuarants(String city) throws SQLException
	{
		Statement stmt = null;
	    stmt = con.createStatement();
		String query;
		//String productStatus ="Purchased";
		ResultSet res;
		List<String> rest = new ArrayList<String>();
		
		try{
			query="Select distinct name from business_review where city='"+city+"'";		
			res = stmt.executeQuery(query);
			
			while(res.next())
			{
				rest.add(res.getString("name"));				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rest;
	}
	public JSONArray getRestuarantPrediction(String Restuarant) throws SQLException
	{
		Statement stmt = null;
	    stmt = con.createStatement();
		String query;
		ResultSet res;
		JSONObject json      = new JSONObject();
		JSONArray  ratings = new JSONArray();
//		JSONObject restuarant_ratings;
//		List<Float> rest = new ArrayList<Float>();
		
		try{
			System.out.println("executing the query");
			query="Select avg_rating from restuarantPredictions where business_name='"+Restuarant+"'";		
			res = stmt.executeQuery(query);
			System.out.println("after query exce"+res);
			
			while(res.next())
			{
				ratings.add(res.getFloat("avg_rating"));				
			}
			json.put("ratings", ratings);
			System.out.println("json body"+json);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		JSONArray jsonMainArr = json.getJSONArray("ratings");
		System.out.println("array of ratings"+jsonMainArr);
		
		return jsonMainArr;
	}

	
	

}