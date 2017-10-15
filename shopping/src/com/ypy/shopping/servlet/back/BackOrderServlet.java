package com.ypy.shopping.servlet.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IOrderService;
import com.ypy.shopping.service.IUserService;
import com.ypy.shopping.service.impl.IOrderServiceImpl;
import com.ypy.shopping.service.impl.IUserServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class BackOrderServlet
 */
@WebServlet("/back/BackOrderServlet")
public class BackOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		IOrderService impl = new IOrderServiceImpl();
		if ("query".equals(task)) {
			query(request, response, impl); 
			
		//点击审核时查询
		} else if ("reviewquery".equals(task)) {
			String orderid = request.getParameter("orderid");
			Order order = impl.queryById(orderid);
			if (order != null) {
				request.setAttribute("order", order);
				request.getRequestDispatcher("/back/order/review.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('操作失败')</script>");
				out.flush();
				out.close();
			}
		
		//审核
		} else if ("review".equals(task)) {
			String orderid = request.getParameter("orderid");
			String ostatus = request.getParameter("ostatus");
			String msg = request.getParameter("msg");
			String approveduser = request.getParameter("approveduser");
			Order od = new Order();
			od.setApproveduser(approveduser);
			od.setMsg(msg);
			od.setOrderid(orderid);
			od.setStatus(ostatus);
			od.setAlltype(-1);
			od.setQuantity(-1);
			od.setTotalprice(-1);
			od.setUserid(-1);
			od.setApproveddate(new Date(new java.util.Date().getTime()));  //审核时间
			int updateResult = impl.update(od);
			if (updateResult != -1) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('审核失败')</script>");
				out.flush();
				out.close();
			} 
		
		//修改
		} else if ("update".equals(task)) {
			String orderid = request.getParameter("orderid");
			String paytype = request.getParameter("paytype");
			String receivedtype = request.getParameter("receivedtype");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String postcode = request.getParameter("postcode");
			String phoneno = request.getParameter("phoneno");
			String email = request.getParameter("email");
			Order order = new Order(orderid, -1, -1, -1, -1, paytype, receivedtype, username, address, postcode, phoneno, email, null, null, null, null, null);
			int updateResult = impl.update(order);
			if (updateResult != -1) {
				request.getRequestDispatcher("/back/BackOrderDetailServlet?task=query&orderid="+orderid).forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('修改失败')</script>");
				out.flush();
				out.close();
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
	private void query(HttpServletRequest request, HttpServletResponse response, IOrderService impl)
			throws ServletException, IOException {
		int currentPage = Util.getCurrentPage(request);
		int pageSize = Util.getPageSize(request);
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String status = request.getParameter("status");
		String username = request.getParameter("username");
		IUserService user = new IUserServiceImpl();
		int userid = -1;
		if (username != null && !"".equals(username)) {
			User u = user.queryForSingle(username);
			if (u != null) {
				userid = u.getUserid();   //得到用户id
			} else {
				userid = 0;
			}
		}
		Page<Order> p = impl.queryPage(startDate, endDate, status, userid, currentPage, pageSize);
		request.setAttribute("p", p);
		request.setAttribute("username", username);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("status", Util.strToInt(status, -1));
		List<User> userList = user.queryAll(new User());  //需要查询出所有用户，然后匹配用户名
		request.setAttribute("user", userList);
		request.getRequestDispatcher("/back/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
