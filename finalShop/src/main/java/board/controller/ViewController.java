package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class ViewController {
	@Autowired
	BoardService service;

	// 게시물 번호가 없을 경우 목록으로 넘김
	@RequestMapping(value="/view.do", params="!boardNo")
	public String viewNull() {
		return "redirect:board_list.do";
	}
	@RequestMapping(value="/view.do", params="!pageNo")
	public String viewPageNull(String boardNo) {
		return "redirect:view.do?pageNo=1&boardNo=" + boardNo;
	}

	@RequestMapping(value="/view.do", params="!mode")
	public String viewPageList(String boardNo) {
		return "redirect:view.do?mode=list&pageNo=1&boardNo=" + boardNo;
	}
	
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public ModelAndView runView(@RequestParam(value="board_no", defaultValue="1") String board_no,
			int page_no,
			String mode,
			String target,
			String keyword) {
		ModelAndView mav = new ModelAndView();
		service.viewCount(boardNo);	// 조회수
		BoardDTO board = service.view(boardNo);
		mav.addObject("board", board);
		mav.addObject("pageNo", pageNo);
		mav.addObject("mode", mode);
		mav.addObject("target", target);
		mav.addObject("keyword", keyword);
		mav.setViewName("board/view");
		return mav;
	}
}