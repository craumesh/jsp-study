/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-22 01:38:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.itwillbs.board.BoardBean;
import com.itwillbs.board.BoardDAO;

public final class boardList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.itwillbs.board.BoardDAO");
    _jspx_imports_classes.add("com.itwillbs.board.BoardBean");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<h2>게시판 목록</h2>\r\n");
      out.write("	<input type=\"button\" value=\"글쓰기\" onclick=\"location.href='fileWriteForm.jsp'\">	\r\n");
      out.write("	\r\n");
      out.write("	");

		BoardDAO dao = new BoardDAO();
		int result = dao.getBoardCount();
	
		/*****************************************/
		// 한페이지에 출력할 글의 개수 설정
		int pageSize = 5;
	
		// 현 페이지가 몇 페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작 행 번호 계산하기 - 1 11 21 31 41
		int currentPage = Integer.valueOf(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		
		// 끝 행 번호 계산하기 - 10 20 30 40 50
		int endRow = currentPage * pageSize;
		
		
		/*****************************************/
		ArrayList boardList = dao.getBoardList(startRow, pageSize);
		
		if(boardList.size() == 0){
			response.sendRedirect("boardList.jsp?pageNum=" + (currentPage - 1));
		}
	
      out.write("\r\n");
      out.write("	<h3>글 개수 : ");
      out.print(result );
      out.write(" 개</h3>\r\n");
      out.write("		\r\n");
      out.write("	<table border=\"1\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<th>번호</th>\r\n");
      out.write("			<th>제목</th>\r\n");
      out.write("			<th>작성자</th>\r\n");
      out.write("			<th>작성일</th>\r\n");
      out.write("			<th>조회수</th>\r\n");
      out.write("			<th>ip</th>\r\n");
      out.write("		</tr>	\r\n");
      out.write("		");
for(int i = 0; i < boardList.size(); i++){
			BoardBean bb = (BoardBean)boardList.get(i);
      out.write("\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td width=\"50\" align=\"center\">");
      out.print(bb.getBno() );
      out.write("</td>\r\n");
      out.write("				<!-- 페이징 처리 3 : 페이지 처리 후 다시 리스트로 돌아올 때 기존의 페이지를 유지 하도록 처리 -->\r\n");
      out.write("				<td width=\"500px\">\r\n");
      out.write("				");
if(bb.getRe_lev() > 0){
      out.write("<img src=\"level.gif\" width=\"");
      out.print(bb.getRe_lev()*10 );
      out.write("\" height=\"10\"><img src=\"re.gif\">");
}
      out.write("\r\n");
      out.write("				<a href=\"boardContent.jsp?bno=");
      out.print(bb.getBno());
      out.write("&pageNum=");
      out.print(pageNum);
      out.write('"');
      out.write('>');
      out.print(bb.getSubject() );
      out.write("</a>\r\n");
      out.write("				");
if(bb.getFile() != null){
      out.write("<img src=\"save.png\" height=\"12\">");
}
      out.write("</td>\r\n");
      out.write("				<td width=\"100px\" align=\"center\">");
      out.print(bb.getName() );
      out.write("\r\n");
      out.write("				</td>\r\n");
      out.write("				<td>");
      out.print(bb.getDate() );
      out.write("</td>\r\n");
      out.write("				<td width=\"60px\" align=\"center\">");
      out.print(bb.getReadcount() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print(bb.getIp() );
      out.write("</td>\r\n");
      out.write("			</tr>		\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("	</table>	\r\n");
      out.write("	");
if(result != 0){
		int pageCount = result / pageSize + (result % pageSize == 0 ? 0 : 1) + 1;
		
		// 한 화면에 보여줄 페이지 블럭 개수
		int pageBlock = 2;
		
		// 페이지 블럭의 시작 번호 계산
		// 1페이지 => 1		, 11페이지 => 11
		// 5페이지 => 1		, 25페이지 => 21
		
      out.write(" <h1>current = ");
      out.print(currentPage );
      out.write("</h1> ");

		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		
      out.write(" <h1>start = ");
      out.print(startPage );
      out.write("</h1> ");

		
		// 페이지 블럭의 마지막 번호 계산
		// 1페이지 => 10
		// 13페이지 => 20
		int endPage = startPage + pageBlock;
		// 페이지의 글이 없는 경우
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage != 1){
      out.write("\r\n");
      out.write("			<a href=\"boardList.jsp?pageNum=");
      out.print(1 );
      out.write("\"> [처음] </a>\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("		\r\n");
      out.write("		");
if(startPage > pageBlock){
      out.write("\r\n");
      out.write("			<a href=\"boardList.jsp?pageNum=");
      out.print(startPage - pageBlock );
      out.write("\"> [이전] </a>\r\n");
      out.write("		");
}
      out.write("		\r\n");
      out.write("		");
for(int i = startPage; i < endPage; i++) { 
      out.write("	\r\n");
      out.write("			");
if(i == Integer.valueOf(pageNum)) {
      out.write("\r\n");
      out.write("				[");
      out.print(i);
      out.write("]\r\n");
      out.write("			");
continue;}
      out.write("\r\n");
      out.write("			[<a href=\"boardList.jsp?pageNum=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a>]\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("		\r\n");
      out.write("		");
if(endPage < pageCount){
      out.write("\r\n");
      out.write("			<a href=\"boardList.jsp?pageNum=");
      out.print(startPage + pageBlock );
      out.write("\"> [다음] </a>\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("		\r\n");
      out.write("		");
if(!(endPage >= pageCount)){
      out.write("\r\n");
      out.write("			<a href=\"boardList.jsp?pageNum=");
      out.print(result / pageBlock + result % pageBlock );
      out.write("\"> [마지막] </a>\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("		\r\n");
      out.write("	");
}
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
