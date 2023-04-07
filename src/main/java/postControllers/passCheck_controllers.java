package postControllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/post/passCheck")
public class passCheck_controllers extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  boardId = req.getParameter("boardId");
		req.getRequestDispatcher("/WEB-INF/post/passCheck.jsp?boardId=11" + boardId).forward(req, resp);

	}
}
