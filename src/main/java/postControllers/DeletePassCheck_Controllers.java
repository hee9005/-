package postControllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/post/DeletePassCheck/*")
public class DeletePassCheck_Controllers extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  boardId = req.getParameter("boardId");
		req.setAttribute("boardId", boardId);
		req.getRequestDispatcher("/WEB-INF/post/DeletePassCheck.jsp").forward(req, resp);

	}
}
