package postControllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

@WebServlet("/post/postModifys")
public class postModify_Controllers extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Map<String, Object> map = new HashMap<>();
		map.put("boardId", boardId);
		map.put("title", title);
		map.put("content", content);
		SqlSessionFactory factory = (SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		sqlSession.update("boards.postModify",map);
		sqlSession.close();
		
		req.getRequestDispatcher("/post/detail").forward(req, resp);
	}
}
