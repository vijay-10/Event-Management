package Model;

import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Registration {

	private Connection con;
	HttpSession se;

	public Registration(HttpSession session) {
		try {

			Class.forName("com.mysql.jdbc.Driver"); // load the drivers
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/events", "root", "vijigowda@10");
			// connection with data base
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String Registration(String name, String phone, String email, String pw) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from users where phone='" + phone + "' or email='" + email + "';");
			boolean b = rs.next();
			if (b) {
				status = "existed";
			} else {
				ps = (PreparedStatement) con
						.prepareStatement("insert into users (name,email,phone,password) values(?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, pw);
				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String email, String pass) {
		// TODO Auto-generated method stub
		String status1 = "", id = "";
		String name = "", emails = "";

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();

			rs = st.executeQuery("select * from users  where email='" + email + "' and password='" + pass + "';");
			boolean b = rs.next();
			if (b == true) {
				id = rs.getString("sl_no");
				name = rs.getString("name");
				emails = rs.getString("email");
			
				se.setAttribute("uname", name);
				se.setAttribute("email", emails);
				se.setAttribute("id", id);
			
				status1 = "success";
			} else {
				status1 = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status1;
	}

	public String update(String name, String pno, String email) {
		String status = "";
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			st.executeUpdate("update  users set name='" + name + "',phone='" + pno + "',email='" + email
					+ "' where sl_no= '" + se.getAttribute("id") + "' ");
			se.setAttribute("uname", name);
			status = "success";
		} catch (Exception e) {
			status = "failure";
			e.printStackTrace();
		}

		return status;
	}

	public ArrayList<Student> getUserinfo(String id) {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Student> al = new ArrayList<Student>();
		try {
			st = con.createStatement();
			String qry = "select * from users where sl_no = '" + id + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Student p = new Student();
				p.setId(rs.getString("sl_no"));
				p.setName(rs.getString("name"));
				p.setemail(rs.getString("email"));
				p.setphone(rs.getString("phone"));
				p.setdate(rs.getString("registration_datetime"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Student> getUserDetails() {
		Statement st;
		ResultSet rs;
		ArrayList<Student> al = new ArrayList<Student>();
		try {
			st = con.createStatement();
			String qry = "select *," + "date_format(registration_datetime,'%b %d, %Y') as date1"
					+ " from users where sl_no not in(1);";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Student p = new Student();
				p.setId(rs.getString("sl_no"));
				p.setName(rs.getString("name"));
				p.setemail(rs.getString("email"));
				p.setphone(rs.getString("phone"));
				p.setdate(rs.getString("date1"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from users where " + "sl_no='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public String ForgotPassword(String mail, String pw) {
		String status = "";
		try {
			Statement st = con.createStatement();

			int rspw = st.executeUpdate("update users  set password='" + pw + "' where email='" + mail + "';");
			if (rspw > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String getPassword(String email, String oldPass) {
		// TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from users where email=? and password=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, oldPass);
			rs = ps.executeQuery();
			if (rs.next()) {
				// se.setAttribute("pwd", rs.getString(5));
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// System.out.println(status);
		return status;
	}

	public String resetPassword(String email, String pwd) {
		// TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;
		boolean res;
		try {
			ps = con.prepareStatement("update users set password =  ? where  email =  ?");
			ps.setString(1, pwd);
			ps.setString(2, email);
			int rc = ps.executeUpdate();
			if (rc > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public Student getInfo() {
		Statement st = null;
		ResultSet rs = null;
		Student s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from users where sl_no= '" + se.getAttribute("id") + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new Student();
				s.setName(rs.getString("name"));
				s.setphone(rs.getString("phone"));
				s.setemail(rs.getString("email"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}

	public String addEvent(String img, String name, String cost, String details, String category) {
	
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from events where event_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				PreparedStatement ps;
				ps = (PreparedStatement) con.prepareStatement("insert into events values (0,?,?,?,?,?,now())");
				ps.setString(1, img);
				ps.setString(2, name);
				ps.setString(3, cost);
				ps.setString(4, details);
				ps.setString(5, category);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String delEvent(String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from events where " + "event_category='" + category + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public ArrayList<Events> getEventList() {
		ArrayList<Events> al = new ArrayList<Events>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select event_img, event_category from events;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Events d = new Events();				
				d.setEvent_img(rs.getString("event_img"));
				d.setEvent_category(rs.getString("event_category"));
				al.add(d);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}


	
	public ArrayList<Dproduct> get_eventinfo(String event_category) {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			String qry = " select * from events where event_category='" + event_category + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct();
				d.setP_id(rs.getInt("event_id")); // 1..r---db 2.. pass the data or value to Dproduct class set
														// method
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getInt("event_cost"));
				d.setP_details(rs.getString("event_details"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public Dproduct getEventFormInfo(String event_id) {
        Statement st = null;
        ResultSet rs = null;
        Dproduct s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from events where event_id= '" + event_id + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new Dproduct();
                s.setP_name(rs.getString("event_name"));
                s.setP_cost(rs.getInt("event_cost"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
	
	public String Booknow(HttpServletRequest request) {
		String status = "";
		ResultSet rs = null;
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery(
					"select event_id from bookevent where eventdate= '" + request.getParameter("edate") + "'");
			boolean b = rs.next();
			if (b == true) {
				status = "existed";
			} else {
				String qry = "insert into bookevent select 0,event_img,event_name,'" + request.getParameter("email")
						+ "', '" + request.getParameter("address") + "',event_cost,'" + se.getAttribute("uname") + "',"
						+ se.getAttribute("id") + " ,'pending',now(),'" + request.getParameter("edate")
						+ "' from events where event_id=" + request.getParameter("event_id") + ";";
				int a = st.executeUpdate(qry);
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public ArrayList<Dproduct> geteventstatus() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent where uid='"
					+ se.getAttribute("id") + " ';";
			rs = st.executeQuery(qry);
			//System.out.println("changed");
			while (rs.next()) {
				//System.out.println("comeing");
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setP_id(rs.getInt("event_id"));
				d.setP_image(rs.getString("event_image"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getInt("event_cost"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date1"));
				d.setEventdate(rs.getString("date2"));
				d.setStatus(rs.getString("status"));
				al.add(d);
				//System.out.println(al);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}




public int deleteevent(int event_id) {
        int status = 0;
        try {
            Statement st = null;
            st = con.createStatement();
            String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

public ArrayList<Dproduct> geteventstatusAdmin() {
    ArrayList<Dproduct> al = new ArrayList<Dproduct>();
    try {
    	ResultSet rs = null;
		Statement st = null;

        st = con.createStatement();
        String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent;";
        rs = st.executeQuery(qry);
        while (rs.next()) {
            Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
            d.setP_id(rs.getInt("event_id"));
            d.setP_image(rs.getString("event_image"));
            d.setP_name(rs.getString("event_name"));
            d.setP_cost(rs.getInt("event_cost"));
          
            d.setEmail(rs.getString("email"));
            d.setDate(rs.getString("date1"));
            d.setEventdate(rs.getString("date2"));
            d.setStatus(rs.getString("status"));
            al.add(d);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return al;

}
public int acceptevent(int event_id) {
    int status = 0;
    try {
        Statement st = null;
        st = con.createStatement();
        String qry = "update bookevent set status='booked' where event_id=' " + event_id + "' ";
        status = st.executeUpdate(qry);
    } catch (Exception e) {
        e.printStackTrace();
    }
    return status;
}
public String review(String name, String email, String rating, String opinion) {
	 String status="";
	try {
	    PreparedStatement  ps = null;
	    Statement st=null;
		ResultSet rs = null;
		
		System.out.println("comeing");
		st = con.createStatement();
		ps = (PreparedStatement) con.prepareStatement("insert into review values (0,?,?,?,?,now())");
		System.out.println("inserted");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, rating);
		ps.setString(4, opinion);
		int a = ps.executeUpdate();
		if (a > 0)
			status = "Successful";
		else
			status = "Failed";
	} catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}


}