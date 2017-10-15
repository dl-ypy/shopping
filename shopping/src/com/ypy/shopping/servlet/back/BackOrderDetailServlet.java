package com.ypy.shopping.servlet.back;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IMcService;
import com.ypy.shopping.service.IOrderDetailService;
import com.ypy.shopping.service.IOrderService;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.service.impl.IOrderDetailServiceImpl;
import com.ypy.shopping.service.impl.IOrderServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/back/BackOrderDetailServlet")
public class BackOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		IOrderDetailService impl = new IOrderDetailServiceImpl();
		if ("query".equals(task)) {
			query(request, response, impl);
		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response, IOrderDetailService impl)
			throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		int currentPage = Util.getCurrentPage(request);
		int pageSize = Util.getPageSize(request);
		Page<OrderDetail> p = impl.queryPage(orderid, currentPage, pageSize);
		request.setAttribute("p", p);
		//要查询出商品类
		IMcService mcImpl = new IMcServiceImpl();
		List<Mc> mc = mcImpl.queryAll(new Mc());
		request.setAttribute("mc", mc);
		//查询当前订单信息
		IOrderService orderImpl = new IOrderServiceImpl();
		Order order = orderImpl.queryById(orderid);
		request.setAttribute("order", order);
		String flag = request.getParameter("flag");
		if ("update".equals(flag)) {
			request.getRequestDispatcher("/back/order/update.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/back/orderdetail/orderdetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
