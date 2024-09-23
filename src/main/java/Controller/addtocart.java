package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.Registration;

@WebServlet(name = "addtocart", urlPatterns = { "/addtocart" })
public class addtocart extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=ISO-8859-1");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {
			if (session.getAttribute("uname") != null && request.getParameter("bookevent") != null) {
				String status = reg.Booknow(request);
				if (status.equals("success")) {
			          request.setAttribute("status", "Booking successful.<a href='Eventstatus.jsp'>Click here</a> to check status.");
					RequestDispatcher rd = request
							.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Booking failed");
					RequestDispatcher rd = request
							.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				} else if (status.equals("existed")) {
					request.setAttribute("status", "Date not available for event");
					RequestDispatcher rd = request
							.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && request.getParameter("cancelevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.deleteevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && request.getParameter("admincancelevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.deleteevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
					rd.forward(request, response);
				}
			} 
		else if (session.getAttribute("uname") != null && session.getAttribute("id").equals("786")
					&& request.getParameter("acceptevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.acceptevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && request.getParameter("cancelevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.deleteevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("EventStatus.jsp");
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && request.getParameter("admincancelevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.deleteevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && session.getAttribute("id").equals("1")
					&& request.getParameter("acceptevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.acceptevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("BookedEvents.jsp");
					rd.forward(request, response);
				}
			
	}
	} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
