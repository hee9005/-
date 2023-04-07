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



@WebServlet("/post/detail")
public class detail_Controllers extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardId = req.getParameter("boardId");
		SqlSessionFactory factory=
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);	
		Board list =sqlSession.selectOne("boards.post",boardId);
		sqlSession.update("boards.viewsIncrease",boardId);
		sqlSession.close();
		
		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/post/detail.jsp").forward(req, resp);
	}
}
