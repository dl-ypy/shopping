package com.ypy.shopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IUserService;
import com.ypy.shopping.service.impl.IUserServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		IUserService impl = new IUserServiceImpl();
		
		//ע��
		if ("register".equals(task)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String usersex = request.getParameter("usersex");
			if ("��".equals(usersex)) {
				usersex = "1";
			} else {
				usersex = "0";
			}
			String truename = request.getParameter("truename");
			String birthday = request.getParameter("birthday");
			Date birth = Date.valueOf(birthday);
			String email = request.getParameter("email");
			String phoneno = request.getParameter("phoneno");
			String address = request.getParameter("address");
			String postcard = request.getParameter("postcard");
			Date regDate = new Date(new java.util.Date().getTime());   //�õ�ע��ʱ��
			if (impl.queryForSingle(username) == null) {
				User user = new User(username, password, truename, usersex, birth, email, phoneno, postcard, address, regDate, "0");
				int regResult = impl.addUser(user);
				if (regResult != -1) {
					request.getRequestDispatcher("/front/userLogin.jsp").forward(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">alert('ע��ʧ��')</script>");
					out.flush();
					out.close();
				}
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('���û����ѱ�ռ��!')</script>");
				out.flush();
				out.close();
			}
			
			
		//�޸�
		} else if ("update".equals(task)){
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String usersex = request.getParameter("usersex");
			if ("��".equals(usersex)) {
				usersex = "1";
			} else {
				usersex = "0";
			}
			String truename = request.getParameter("truename");
			String email = request.getParameter("email");
			String phoneno = request.getParameter("phoneno");
			String address = request.getParameter("address");
			String postcard = request.getParameter("postcard");
			User user = new User();
			user.setAddress(address);
			user.setEmail(email);
			user.setPhoneno(phoneno);
			user.setPostcade(postcard);
			user.setTruename(truename);
			user.setUserid(Util.strToInt(userid, -1));
			user.setUsername(username);
			int updateResult = impl.updateUser(user);
			if (updateResult != -1) {
				//���ĺ�Ҫ��������¼��ѯ���������ŵ�session��
				String password = request.getParameter("password");
				User u = impl.queryForSingle(username, password);
				HttpSession session = request.getSession();
				session.setAttribute("USER", u);
				request.getRequestDispatcher("IndexServlet").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޸�ʧ��')</script>");
				out.flush();
				out.close();
			}
			
		//�޸�����
		} else if ("updatePwd".equals(task)) {
			String password = request.getParameter("password");
			String userid = request.getParameter("userid");
			User user = new User();
			user.setPassword(password);
			user.setUserid(Util.strToInt(userid, -1));
			int upResult = impl.updateUser(user);
			if (upResult != -1) {
				//���ĺ�����������¼��ѯ���������ŵ�session��
				String username = request.getParameter("username");
				User u = impl.queryForSingle(username, password);
				HttpSession session = request.getSession();
				session.setAttribute("USER", u);
				request.getRequestDispatcher("IndexServlet").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޸�ʧ��')</script>");
				out.flush();
				out.close();
			}
			
		//��½
		} else {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String code = request.getParameter("code");   //�õ��û��������֤��
			HttpSession session = request.getSession();
			String rand =  (String) session.getAttribute("rand");  //�õ������������֤��
			User user = impl.queryForSingle(username, password);
			if (user != null) {
				if ("1".equals(user.getLockstate())) {
					request.setAttribute("fail", "���û��ѱ����ᣡ");
					request.getRequestDispatcher("/front/userLogin.jsp").forward(request, response);
				} else {
					if (rand.equals(code)) {
						Date lastaccess = new Date(new java.util.Date().getTime());
						int login = user.getLogin()+1;
						user.setLastaccess(lastaccess);  //��������½ʱ��
						user.setLogin(login);   //���õ�½����
						User u = new User();
						u.setUserid(user.getUserid());
						u.setLastaccess(lastaccess);
						u.setLogin(login);
						impl.updateUser(u);   //�޸����ݿ��еĶ�Ӧ��Ϣ
						session.setAttribute("USER", user);
						request.getRequestDispatcher("IndexServlet").forward(request, response);
					} else {
						request.setAttribute("fail", "��֤�����");
						request.getRequestDispatcher("/front/userLogin.jsp").forward(request, response);
					}
				}
			} else {
				request.setAttribute("fail", "�û������������");
				request.getRequestDispatcher("/front/userLogin.jsp").forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
