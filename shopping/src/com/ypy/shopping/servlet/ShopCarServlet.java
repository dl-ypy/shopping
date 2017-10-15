package com.ypy.shopping.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.ShopCar;
import com.ypy.shopping.service.IMcService;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class ShopCarServlet
 */
@WebServlet("/ShopCarServlet")
public class ShopCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Map<String, Integer> mcCount = new HashMap<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		IMcService impl = new IMcServiceImpl();
		HttpSession session = request.getSession();
		ShopCar shopCar = ShopCar.getSession(session);
		//往购物车中添加商品
		if ("add".equals(task)) {
			String mcid = request.getParameter("mcid");
			Mc mc = new Mc();
			mc.setMcid(Util.strToInt(mcid, 0));
			mc = impl.queryForSingle(mc);
			if (mc.getQuantity()>0) { //判断是否有存货
				Set<String> keySet = mcCount.keySet();
				Iterator<String> it = keySet.iterator();
				boolean flag = true;
				int value = 1;
				while (it.hasNext()) {
					String key = it.next();
					if (key.equals(mcid)) {  //判断是否有此id
						value = mcCount.get(key);  //得到值
						if (mc.getQuantity()<=value) {   //判断存货够不够
							PrintWriter out = response.getWriter();
							out.write("-1");
							out.flush();
							out.close();
							return;
						} 
						mcCount.put(key, value+1);
						flag = false;
					}
				}
				if (flag) {   //说明Map中没有
					mcCount.put(mcid, 1);
				}
				System.out.println(mcCount);
				shopCar.add(mc);
				int count = shopCar.getTotalCount();
				PrintWriter out = response.getWriter();
				out.write(count+"");//int类型不能直接放入
				out.flush();
				out.close();
				
			} else {   
				PrintWriter out = response.getWriter();
				out.write("-1");
				out.flush();
				out.close();
			}
			
		//清空购物车	
		} else if ("clear".equals(task)) {
			shopCar.clear();
			mcCount.clear(); //将存放购买数量的Map也清空
			request.getRequestDispatcher("/front/shopCar.jsp").forward(request, response);
		
		//删除购物车中的商品
		} else if ("delete".equals(task)) {
			String mcid = request.getParameter("mcid");
			shopCar.remove(Util.strToInt(mcid, -1));
			request.getRequestDispatcher("/front/shopCar.jsp").forward(request, response);
		
		//修改购物车中的商品信息
		} else if ("update".equals(task)) {
			String mcid = request.getParameter("mcid");
			String count = request.getParameter("count");
			Mc mc = new Mc();
			mc.setCount(Util.strToInt(count, 0));
			mc.setMcid(Util.strToInt(mcid, -1));
			shopCar.update(mc);
			request.getRequestDispatcher("/front/shopCar.jsp").forward(request, response);
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
