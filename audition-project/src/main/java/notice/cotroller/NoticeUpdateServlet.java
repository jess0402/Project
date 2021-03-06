package notice.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.dto.NoticeExt;
import notice.model.service.NoticeService;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/notice/noticeUpdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeService noticeService = new NoticeService();
	/**
	 * 수정폼 요청
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 1.사용자입력값 처리
		int no = Integer.parseInt(request.getParameter("no")); // 게시판 넘버
		
		// 2.업무로직
		NoticeExt notice = noticeService.findByNo(no);
		
		// 3.view단처리
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeUpdate.jsp")
			.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// update board set title = ?, content = ? where no = ?
		try {
			request.setCharacterEncoding("utf-8");
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String memberId = request.getParameter("memberId");
			String content = request.getParameter("content");
			System.out.println(no + ", " + title + ", " + memberId + ", " + content);
			NoticeExt notice = new NoticeExt();
			notice.setNo(no);
			notice.setTitle(title);
			notice.setMemberId(memberId);
			notice.setContent(content);
			
			int result = noticeService.updateNotice(notice);

			response.sendRedirect(request.getContextPath() + "/notice/noticeView?no=" + no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}