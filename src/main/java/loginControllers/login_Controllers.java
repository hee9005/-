package loginControllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mindrot.jbcrypt.BCrypt;

import data.User;

@WebServlet("/user/*")
public class login_Controllers extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ctxPath = req.getContextPath();
		String uri = req.getRequestURI().substring(ctxPath.length());

		switch (uri) {
		case "/user/login" -> {
			req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);
		}

		case "/user/login-task" -> {
			String id = req.getParameter("id");
			String pass = req.getParameter("pass");
			SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
			SqlSession sqlSession = factory.openSession(true);

			User found = sqlSession.selectOne("user.login", id);
			
			if(id != null && pass !=null && found !=null) {
				if(found.getPass().equals(pass)) {
					HttpSession session = req.getSession();
					session.setAttribute("logon", true);
					session.setAttribute("logonUser", found);
					resp.sendRedirect("/");
					return;
					
				}else {
					req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);
				}
			}else{
				req.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(req, resp);
			}
			

		
			}
		}
		}
	
}
