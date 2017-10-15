 package com.ypy.shopping.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IMcService;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.service.impl.IMcTypeServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMcTypeServiceImpl impl = new IMcTypeServiceImpl();
		int pageSize = Util.getPageSize(request);//动态设置每页记录数
		int currentPage = Util.getCurrentPage(request);//动态获取当前页数
		String mcname = request.getParameter("mcname");
		String typeid = request.getParameter("typeid");
		Mc mc = new Mc();
		mc.setMcname(mcname);
		mc.setSmalltypeid(Util.strToInt(typeid, 0));
		List<McType> type = impl.queryAll(new McType());
		request.setAttribute("type", type);
		IMcService impl1 = new IMcServiceImpl();
		mc.setPrice(-1);
		Page<?> page = impl1.queryPage(mc, currentPage, pageSize);
		request.setAttribute("p", page);
		request.setAttribute("mcname", mcname);
		request.setAttribute("typeid", typeid);
		request.getRequestDispatcher("/front/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
