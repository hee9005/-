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

@WebServlet("/post/create")
public class Boards_Controllers extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardPass = req.getParameter("boardPass");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String userId = req.getParameter("userId");
		Map<String, Object> map = new HashMap<>();
		map.put("boardPass", boardPass);
		map.put("title", title);
		map.put("content", content);
		map.put("writer", writer);
		map.put("userId", userId);
		SqlSessionFactory factory= 
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		int r = sqlSession.insert("boards.create", map);
		sqlSession.commit();
		sqlSession.close();
		
		resp.sendRedirect("/home/index");
		return;
		
	}
	
}
