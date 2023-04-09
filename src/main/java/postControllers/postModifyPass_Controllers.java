package postControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Board;

@WebServlet("/post/postModify/postPass")
public class postModifyPass_Controllers extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String boardPass = req.getParameter("boardPass");
		int boardId =Integer.parseInt(req.getParameter("boardId"));
		SqlSessionFactory factory=
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);	
		Board list =sqlSession.selectOne("boards.post",boardId);
		String pass = list.getBoardPass();
		if(pass.equals(boardPass)) {
			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/post/postModify.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/post/passCheck").forward(req, resp);
		}

	}
}
