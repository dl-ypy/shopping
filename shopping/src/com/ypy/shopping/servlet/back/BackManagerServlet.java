package com.ypy.shopping.servlet.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ypy.shopping.model.Manager;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IManagerService;
import com.ypy.shopping.service.impl.IManagerServiceIpml;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class BackManagerServlet
 */
@WebServlet("/back/BackManagerServlet")
public class BackManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IManagerService impl = new IManagerServiceIpml();
		String task = request.getParameter("task");
		if ("query".equals(task)) {
			String mid = request.getParameter("mid");
			Manager m = impl.queryForSingle(Util.strToInt(mid, 0));
			if (m.getMlevel() == 2) {  //ȷ����ͨ����Ա���ܶԹ���Ա���в���
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('����Ȩ�޲��㣡')</script>");
				out.flush();
				out.close();
			}
		} else if ("add".equals(task)) {
			String musername = request.getParameter("username");
			String msex = request.getParameter("sex");
			String mtruename = request.getParameter("truename");
			Manager m = impl.queryForSingle(musername);
			if (m == null) {
				Manager manager = new Manager();
				Date mdate = new Date(new java.util.Date().getTime());
				manager.setMsex(msex);
				manager.setMusername(musername);
				manager.setMtruename(mtruename);
				manager.setMdate(mdate);
				int addResult = impl.addManager(manager);
				if (addResult != -1) {
					query(request, response, impl);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">alert('���ʧ�ܣ�')</script>");
					out.flush();
					out.close();
				}
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('���û����Ա�ռ�ã�')</script>");
				out.flush();
				out.close();
			}
			
		//ɾ��
		} else if ("delete".equals(task)) {
			String mid = request.getParameter("mid");
			Manager manager = new Manager();
			manager.setMid(Util.strToInt(mid, 0));
			int deleteResult = impl.deleteManager(manager);
			if (deleteResult != -1) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('ɾ��ʧ�ܣ�')</script>");
				out.flush();
				out.close();
			}
			
		//�޸�ʱ��ѯ
		} else if ("updatequery".equals(task)) {
			String mid = request.getParameter("mid");
			Manager m = impl.queryForSingle(Util.strToInt(mid, 0));
			if (m != null) {
				request.setAttribute("m", m);
				String num = request.getParameter("num");
				if ("one".equals(num)) {  //�ж��Ƿ���ĵ����Լ���
					request.getRequestDispatcher("/back/manager/uponemanager.jsp").forward(request, response);
					return;
				}
				request.getRequestDispatcher("/back/manager/managerupdate.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޴˼�¼��')</script>");
				out.flush();
				out.close();
			}
			
		//�޸�
		} else if ("update".equals(task)) {
			String mid = request.getParameter("mid");
			String msex = request.getParameter("sex");
			String mtruename = request.getParameter("truename");
			Manager manager = new Manager();
			manager.setMid(Util.strToInt(mid, 0));
			manager.setMsex(msex);
			manager.setMtruename(mtruename);
			int updateResult = impl.updateManager(manager);
			if (updateResult != -1) {
				String num = request.getParameter("num");
				if ("one".equals(num)) {  //�ж��Ƿ���ĵ����Լ���
					Manager m = impl.queryForSingle(Util.strToInt(mid, 0));
					if (manager != null) {
						request.setAttribute("m", m);
						request.getRequestDispatcher("/back/manager/oneManager.jsp").forward(request, response);
						return;
					}
				}
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޸�ʧ�ܣ�')</script>");
				out.flush();
				out.close();
			}

		//��ѯ������Ϣ
		} else if ("queryone".equals(task)) {
			String mid = request.getParameter("mid");
			Manager manager = impl.queryForSingle(Util.strToInt(mid, 0));
			if (manager != null) {
				request.setAttribute("m", manager);
				String flag = request.getParameter("flag");
				if ("pwd".equals(flag)) {
					request.getRequestDispatcher("/back/manager/uppwd.jsp").forward(request, response);
					return;
				}
				request.getRequestDispatcher("/back/manager/oneManager.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޴˼�¼��')</script>");
				out.flush();
				out.close();
			}
			
		//�޸�����
		} else if ("uppwd".equals(task)) {
			String mid = request.getParameter("mid");
			String mpassword = request.getParameter("mpassword");
			Manager m = new Manager();
			m.setMid(Util.strToInt(mid, 0));
			m.setMpassword(mpassword);
			int updateResult = impl.updateManager(m);
			if (updateResult != -1) {
				Manager manager = impl.queryForSingle(Util.strToInt(mid, 0));
				request.setAttribute("m", manager);
				request.getRequestDispatcher("/back/manager/oneManager.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('�޸�ʧ�ܣ�')</script>");
				out.flush();
				out.close();
			}
		}
		
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	/**
	 * ��ҳ��ѯ
	 * @param request
	 * @param response
	 * @param impl
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response, IManagerService impl)
			throws ServletException, IOException {
		
		int pageSize = Util.getPageSize(request);//��̬����ÿҳ��¼��
		int currentPage = Util.getCurrentPage(request);//��̬��ȡ��ǰҳ��
		String musername = request.getParameter("musername");
		String msex = request.getParameter("msex");
		Manager manager = new Manager();
		manager.setMusername(musername);
		manager.setMsex(msex);
		Page<Manager> p = impl.queryPage(manager, currentPage, pageSize);
		request.setAttribute("p", p);
		request.setAttribute("musername", musername);
		request.setAttribute("msex",msex);
		request.getRequestDispatcher("/back/manager/managerList.jsp").forward(request, response);
	}

}
