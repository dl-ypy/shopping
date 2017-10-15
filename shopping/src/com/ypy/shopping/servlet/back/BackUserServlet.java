package com.ypy.shopping.servlet.back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IUserService;
import com.ypy.shopping.service.impl.IUserServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class BackUserServlet
 */
@WebServlet("/back/BackUserServlet")
public class BackUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		IUserService impl = new IUserServiceImpl();
		
		if ("query".equals(task)) {
			query(request, response, impl); 
			
		//冻结、解冻
		} else if ("state".equals(task)) {
			String userid = request.getParameter("userid");
			System.out.println(userid);
			User user = impl.queryForSingle(Util.strToInt(userid, 0));
			if (user != null) {
				String lockstate = user.getLockstate();
				if ("0".equals(lockstate)) {
					user.setLockstate("1");
				} else {
					user.setLockstate("0");
				}
				int updateResult = impl.updateUser(user);
				if (updateResult != -1) {
					query(request, response, impl);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">alert('操作失败')</script>");
					out.flush();
					out.close();
				}
			}
		}
	}
	
	/**
	 * 分页查询
	 * @param request
	 * @param response
	 * @param impl
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response, IUserService impl)
			throws ServletException, IOException {
		int pageSize = Util.getPageSize(request);//动态设置每页记录数
		int currentPage = Util.getCurrentPage(request);//动态获取当前页数
		String username = request.getParameter("username");
		String usersex = request.getParameter("usersex");
		String lockstate = request.getParameter("lockstate");
		User user = new User();
		user.setLockstate(lockstate);
		user.setUsername(username);
		user.setUsersex(usersex);
		Page<User> p = impl.queryPage(user, currentPage, pageSize);
		request.setAttribute("p", p);
		request.setAttribute("username", username);
		request.setAttribute("usersex", Util.strToInt(usersex, -1));
		request.setAttribute("lockstate", Util.strToInt(lockstate, -1));
		request.getRequestDispatcher("/back/user/userList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
