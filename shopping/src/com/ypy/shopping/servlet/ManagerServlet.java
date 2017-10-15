package com.ypy.shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ypy.shopping.model.Manager;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.service.IManagerService;
import com.ypy.shopping.service.IOrderService;
import com.ypy.shopping.service.impl.IManagerServiceIpml;
import com.ypy.shopping.service.impl.IOrderServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��½
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		IManagerService impl = new IManagerServiceIpml();
		Manager m = impl.queryForSingle(username, password);
		if (m != null) {
			HttpSession session = request.getSession();
			//�ж��û��Ƿ�ѡ���ס����
			String[] rembers = request.getParameterValues("rember");
			if (rembers != null) {
				String rember = rembers[0];
				if ("selected".equals(rember)) {
					Cookie nameCookie = new Cookie("musername", username);
					Cookie pwdCookie = new Cookie("mpassword", password);
					nameCookie.setMaxAge(60*60*24*10);
					pwdCookie.setMaxAge(60*60*24*10);
					nameCookie.setPath("/");
					pwdCookie.setPath("/");
					response.addCookie(nameCookie);
					response.addCookie(pwdCookie);
				}
			}
			if (m.getMlevel() == 1) {  //�ж��Ƿ��Ѿ��ǳ�������Ա
				IOrderService order = new IOrderServiceImpl();
				Order o = new Order();
				o.setApproveduser(m.getMusername());
				List<Order> list = order.query(o);
				if (list.size() >= 3) {   //�ж���˹����������϶����ľͽ���Ϊ��������Ա
					m.setMlevel(2);
					impl.updateManager(m);
					Manager ma = impl.queryForSingle(m.getMid());
					session.setAttribute("manager", ma);
					request.getRequestDispatcher("/back/index.jsp").forward(request, response);
					return;
				}
			}
			session.setAttribute("manager", m);
			request.getRequestDispatcher("/back/index.jsp").forward(request, response);
		} else {
			request.setAttribute("fail", "�û������������");
			request.getRequestDispatcher("/front/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
