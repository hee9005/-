package postControllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Board;




@WebServlet("/post/search")
public class search_Controllers extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int p;
		if (req.getParameter("page") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("page"));
		}
		
		SqlSessionFactory factory=
				(SqlSessionFactory)req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);	
		Map<String, Object> map = new HashMap<>();
		map.put("a", (p - 1) * 6 + 1); // "a" , p*6 - 5;
		map.put("b", 6 * p);
		List<Board> replys =sqlSession.selectList("boards.findByBoardId");
		
		req.setAttribute("replys", replys);
//		List<Moim> list = sqlSession.selectList("moims.findSomeByCates", cates);
		List<Board> list = sqlSession.selectList("boards.postBring", map);
		sqlSession.close();
		req.setAttribute("list", list);
		System.out.println(list);
		req.setAttribute("millis", System.currentTimeMillis());
		
		
		req.getRequestDispatcher("/WEB-INF/post/search.jsp").forward(req, resp);
	}
}
