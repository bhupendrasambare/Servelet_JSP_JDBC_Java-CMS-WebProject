package admin.servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.showFeedback;
import controller.base.common;
import controller.users.FeedbackOperation;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/admin/feedback")
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("feedback.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method st!ub
		FeedbackOperation fd = new FeedbackOperation();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String message = request.getParameter("message");
		if((name != "") && (email != "") && (number != "") && (message != "")) {
			if(fd.setFeedback(name, email, number, message)) {
				request.setAttribute("message", "Thank you for Your Feedback");
			}
			else {
				request.setAttribute("message", "Something went Wrong,Please Try Again later");
			}
			RequestDispatcher dispatch = request.getRequestDispatcher("../template/feedback.jsp");
			dispatch.forward(request, response);
		}else {
			request.setAttribute("message", "Please Fill All the entry");
			RequestDispatcher dispatch = request.getRequestDispatcher("../template/feedback.jsp");
			dispatch.forward(request, response);
		}
		
	}

}
