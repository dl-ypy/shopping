package com.ypy.shopping.servlet.back;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;

import com.ypy.shopping.model.Mc;
import com.ypy.shopping.model.McType;
import com.ypy.shopping.model.Page;
import com.ypy.shopping.service.impl.IMcServiceImpl;
import com.ypy.shopping.service.impl.IMcTypeServiceImpl;
import com.ypy.shopping.util.Util;
/**
 * Servlet implementation class McServlet
 */
@WebServlet("/back/McServlet")
public class McServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public McServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMcServiceImpl impl = new IMcServiceImpl();
		String task = request.getParameter("task");
		if ("type".equals(task)) {     //查询大类
			IMcTypeServiceImpl type = new IMcTypeServiceImpl();
			List<McType> bigList = type.queryFather();
			request.setAttribute("bigList", bigList);
			request.getRequestDispatcher("/back/mc/mcadd.jsp").forward(request, response);
		} else if ("change".equals(task)) {    //二级联动下拉框
			String bigid = request.getParameter("bigid");
			IMcTypeServiceImpl type = new IMcTypeServiceImpl();
			List<McType> bigList = type.queryFather();
			PrintWriter out = response.getWriter();
			JSONArray json = null;
			for (McType mcType : bigList) {
				int smallid = Util.strToInt(bigid, -1);
				//判断大类的id与传过来的id是否相等
				if (mcType.getTypeid() == smallid) {
					//查询此大类对应的小类
					List<McType> smallList = type.queryAll(new McType(null, smallid));
					//拼接json字符串
					json = new JSONArray(smallList);
				}
			}
			if (json != null) {
				out.write(json.toString());
			}
			out.flush();
			out.close();
		}else if ("delete".equals(task)) {   //删除
			String mcid = request.getParameter("mcid");
			int delResult = impl.delete(Util.strToInt(mcid, -1));
			if (delResult != -1) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('删除失败')</script>");
				out.flush();
				out.close();
			}
		} else if ("add".equals(task)) {   //添加
			//得到当前时间
			Date date = new Date();
			//设置格式
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			Timestamp t = Timestamp.valueOf("1970-12-12 11:11:11.0");
			java.sql.Date createdate = new java.sql.Date(date.getTime());
			Mc m = createInstance(request);
			m.setCreatedate(createdate);
			int addResult = impl.add(m);
			if (addResult != 0) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('添加失败')</script>");
				out.flush();
				out.close();
			} 
		}else if ("updatequery".equals(task)) {   //修改时的查询
			String mcid = request.getParameter("mcid");
			String smallid = request.getParameter("smallid");
			Mc mc = impl.queryForSingle(new Mc(Util.strToInt(mcid, -1)));
			request.setAttribute("mc", mc);
			IMcTypeServiceImpl type = new IMcTypeServiceImpl();
			List<McType> bigList = type.queryFather();
			request.setAttribute("bigList", bigList);
			McType mt = new McType();
			mt.setTypeid(Util.strToInt(smallid, -1));
			McType mt2 = type.queryForSingle(mt);
			request.setAttribute("mt", mt2);
			List<McType> mtList = type.queryAll(new McType());
			request.setAttribute("mtList", mtList);
			request.getRequestDispatcher("/back/mc/mcupdate.jsp").forward(request, response);
		} else if ("update".equals(task)) {    //修改
			Mc mc = createInstance(request);
			int updateResult = impl.update(mc);
			if (updateResult != 0) {
				query(request, response, impl);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">alert('修改失败')</script>");
				out.flush();
				out.close();
			} 
		} else if ("queryOne".equals(task)) {
			String mcid = request.getParameter("mcid");
		} else {
			query(request, response, impl);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	/**
	 * 分页查询
	 * @param request
	 * @param response
	 * @param impl
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response, IMcServiceImpl impl)
			throws ServletException, IOException {
		int pageSize = Util.getPageSize(request);//动态设置每页记录数
		int currentPage = Util.getCurrentPage(request);//动态获取当前页数
		String mcname = request.getParameter("mcname");
		String flag = request.getParameter("flag");
		String price = request.getParameter("price");
		if ("-1".equals(flag)) {
			flag = "";
		}
		Mc mc = new Mc();
		mc.setMcname(mcname);
		mc.setFlag(flag);
		mc.setPrice(Util.strToInt(price, -1));
		Page<?> p = impl.queryPage(mc, currentPage, pageSize);
		request.setAttribute("p", p);
		request.setAttribute("mcname", mcname);
		request.setAttribute("flag", Util.strToInt(flag, -1));
		request.setAttribute("price", Util.strToInt(price, -1));
		request.getRequestDispatcher("/back/mc/mclist.jsp").forward(request, response);
	}

	/**
	 * 封装类对象
	 * @param request
	 * @return
	 */
	private Mc createInstance(HttpServletRequest request) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		Mc m = new Mc();
		try {
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem fileItem : list) {
				//判断是否是普通输入框
				if (fileItem.isFormField()) {
					String value = fileItem.getString("utf-8");
					String key = fileItem.getFieldName();
					if ("mcname".equals(key)) {
						m.setMcname(value);
					} else if ("mcid".equals(key)) {
						m.setMcid(Util.strToInt(value, 0));
					} else if ("mcdecx".equals(key)) {
						m.setMcdecx(value);
					} else if ("price".equals(key)) {
						m.setPrice(Util.strToDoub(value, 0));
					} else if ("smalltypeid".equals(key)) {
						m.setSmalltypeid(Util.strToInt(value, 0));
					} else if ("quantity".equals(key)) {
						int quantity = Util.strToInt(value, 0);
						m.setQuantity(quantity);
						//通过库存判断是否缺货
						if (quantity > 0) {
							m.setFlag("0");
						} else {
							m.setFlag("1");
						}
					}
				} else { //文件输入框
					String name = fileItem.getName();   //获得文件名字
					//保存的文件名要用时间戳，防止重名
					String filename = Util.getTime()+Util.getName(name);
					m.setPic(filename);
					String path = request.getServletContext().getRealPath("/upload");
					File file  = new File(path+"/"+filename);
					fileItem.write(file); //将上传的文件数据写入文件
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
}
