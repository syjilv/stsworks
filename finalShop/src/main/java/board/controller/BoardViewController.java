package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.dto.ReplyDTO;
import board.service.BoardService;

@Controller
public class BoardViewController {
	@Autowired
	BoardService service;

	@RequestMapping(value = "/board/view.do", method = RequestMethod.GET)
	public ModelAndView runView(@RequestParam(value = "board_no", required = true) String board_no,
								@RequestParam(value = "page_no", defaultValue = "1") int page_no,
								@RequestParam(value = "mode", defaultValue = "list") String mode,
								@RequestParam(value = "target", required = false) String target,
								@RequestParam(value = "keyword", required = false) String keyword) {

		ModelAndView mav = new ModelAndView();

		if(board_no == null) {
			mav.setViewName("redirect:/finalshop/board/list.do");
		} else {
			service.viewCount(board_no); // 조회수
			BoardDTO article = service.view(board_no); // 게시물
			int replySize = service.replySize(board_no); // 댓글수
			List<ReplyDTO> replyList = service.replyView(board_no); // 댓글목록

			int listSize = 0;
			List<BoardDTO> list = null;
			
			if(mode.equals("search")) {
				listSize = service.searchListSize(target, keyword);
				list = service.search(target, keyword, page_no);			
				mav.addObject("target", target);
				mav.addObject("keyword", keyword);
			} else {
				listSize = service.listSize();
				list = service.list(page_no);
			}

			mav.addObject("listSize", listSize);
			mav.addObject("article", article);
			mav.addObject("replySize", replySize);
			mav.addObject("replyList", replyList);
			mav.addObject("list", list);
			mav.addObject("page_no", page_no);
			mav.addObject("board_no", board_no);
			mav.addObject("mode", mode);
			mav.setViewName("board/view");
		}
		return mav;
	}
}