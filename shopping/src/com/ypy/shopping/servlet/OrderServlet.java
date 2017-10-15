package com.ypy.shopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.Order;
import com.ypy.shopping.model.OrderDetail;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.model.ShopCar;
import com.ypy.shopping.model.User;
import com.ypy.shopping.service.IMcService;
import com.ypy.shopping.service.IOrderService;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.service.impl.IOrderServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/filter/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IOrderService impl = new IOrderServiceImpl();
		String task = request.getParameter("task");
		if ("query".equals(task)) {
			int pageSize = Util.getPageSize(request);//��̬����ÿҳ��¼��
			int currentPage = Util.getCurrentPage(request);//��̬��ȡ��ǰҳ��
			String userid = request.getParameter("userid");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String status = request.getParameter("status");
			Page<Order> p = impl.queryPage(startDate, endDate, status, Util.strToInt(userid, -1), currentPage, pageSize);
			request.setAttribute("p", p);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			request.setAttribute("status", Util.strToInt(status, -1));
			request.getRequestDispatcher("/front/fourth.jsp").forward(request, response); 
		
		//��Ӷ���
		} else {
			//1.�ӹ��ﳵ�еõ�������Ϣ������������Ϣ
			HttpSession session = request.getSession();
			ShopCar shopcar = ShopCar.getSession(session);
			int totalcount = shopcar.getTotalCount();
			int typecount = shopcar.getTotalType();
			double totalprice = shopcar.getTotalPrice();
			List<Mc> mcList = shopcar.getMcList();
			List<OrderDetail> detailList = new ArrayList<>();
			IMcService m = new IMcServiceImpl();
			for (Mc mc : mcList) {
				OrderDetail detail = new OrderDetail();
				detail.setBuynum(mc.getCount());
				detail.setMcid(mc.getMcid());
				mc.setQuantity(mc.getQuantity()-mc.getCount());  //�޸Ŀ��
				if (mc.getQuantity() == 0) {
					mc.setFlag("1");   //�ж��Ƿ�ȱ��
				}
				ShopCarServlet.mcCount.clear();   //���˶�����������������Ʒ��������Map���
				m.update(mc);
				detailList.add(detail);
			}
			//2.�Ӷ������л�ȡ�ջ�����Ϣ
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String postcard = request.getParameter("postcard");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String paytype = request.getParameter("paytype");
			String receivedtype = request.getParameter("receivedtype");
			//3.��session�л�ȡuserid
			User user = (User) session.getAttribute("USER");
			int userid = user.getUserid();
			//4.�������ݿ�
			Order od = new Order();
			od.setAddress(address);
			od.setAlltype(typecount);
			od.setEmail(email);
			od.setList(detailList);
			od.setPaytype(paytype);
			od.setPhoneno(phone);
			od.setPostcode(postcard);
			od.setQuantity(totalcount);
			od.setReceivedtype(receivedtype);
			od.setTotalprice(totalprice);
			od.setUserid(userid);
			od.setUsername(username);
			int addResult = impl.add(od);
			if (addResult != -1) {
				shopcar.clear();   //�������չ��ﳵ
				request.getRequestDispatcher("/IndexServlet").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('���ʧ��')</script>");
				out.flush();
				out.close();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
