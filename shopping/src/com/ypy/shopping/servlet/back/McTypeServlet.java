package com.ypy.shopping.servlet.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.IMcService;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.service.impl.IMcTypeServiceImpl;
import com.ypy.shopping.util.Util;

/**
 * Servlet implementation class McTypeServlet
 */
@WebServlet("/back/McTypeServlet")
public class McTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public McTypeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMcTypeServiceImpl impl = new IMcTypeServiceImpl();
		String task = request.getParameter("task");
		if ("father".equals(task)) {
			List<McType> list = impl.queryFather();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/back/mctype/mctypeadd.jsp").forward(request, response);
		} else if ("delete".equals(task)) {//删除商品类的时候需要删除该商品类下的商品
			String typeid = request.getParameter("typeid");
			IMcService mc = new IMcServiceImpl();
			int delsResult = mc.deleteS(Util.strToInt(typeid, -1));
			if (delsResult != -1) {
				int delResult = impl.delete(Util.strToInt(typeid, -1));
				if (delResult != -1) {
					query(request, response, impl);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">alert('删除失败')</script>");
					out.flush();
					out.close();
				}
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('删除失败')</script>");
				out.flush();
				out.close();
			}
			
		} else if ("add".equals(task)) {
			String typename = request.getParameter("typename");
			String fatherid = request.getParameter("fatherid");
			int addResult = impl.addMcType(new McType(typename, Util.strToInt(fatherid, 0)));
			if (addResult != 0) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('添加失败')</script>");
				out.flush();
				out.close();
			}
		} else if ("updatequery".equals(task)) {
			String typeid = request.getParameter("typeid");
			McType mcType = impl.queryForSingle(new McType(Util.strToInt(typeid, -1)));
			request.setAttribute("mt", mcType);
			List<McType> list = impl.queryFather();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/back/mctype/mctypeupdate.jsp").forward(request, response);
		} else if ("update".equals(task)) {
			String typeid = request.getParameter("typeid");
			String typename = request.getParameter("typename");
			String fatherid = request.getParameter("fatherid");
			int updateResult = impl.update(new McType(Util.strToInt(typeid, 0),typename,Util.strToInt(fatherid, -1)));
			if (updateResult != 0) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('修改失败')</script>");
				out.flush();
				out.close();
			}
		} else {
			query(request, response, impl);
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
	private void query(HttpServletRequest request, HttpServletResponse response, IMcTypeServiceImpl impl)
			throws ServletException, IOException {
		int pageSize = Util.getPageSize(request);//动态设置每页记录数
		int currentPage = Util.getCurrentPage(request);//动态获取当前页数
		Page<?> p = impl.queryPage(currentPage, pageSize);
		request.setAttribute("p", p);
		request.getRequestDispatcher("/back/mctype/mctype.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
