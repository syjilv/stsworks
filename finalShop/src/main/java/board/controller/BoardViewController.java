package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.dto.BoardDTO;
import board.service.BoardService;

@Controller
public class BoardViewController {
	@Autowired
	BoardService service;

//	// 게시물 번호가 없을 경우 목록으로 넘김
//	@RequestMapping(value = "/view.do", params = "!board_no")
//	public String viewNull() {
//		return "redirect:/board/board_list.do";
//	}

	@RequestMapping(value = "/board/view.do", method = RequestMethod.GET)
	public ModelAndView runView(@RequestParam(value = "board_no", required = true) String board_no,
								@RequestParam(value = "page_no", defaultValue = "1") int page_no,
								@RequestParam(value = "mode", defaultValue = "list") String mode,
								@RequestParam(value = "target", required = false) String target,
								@RequestParam(value = "target", required = false) String keyword) {

		ModelAndView mav = new ModelAndView();

		if(board_no == null) {
			mav.setViewName("redirect:/finalshop/board/list.do");
		} else {
			service.viewCount(board_no); // 조회수
			BoardDTO board = service.view(board_no);
			int count = 0;
			List<BoardDTO> list = null;
			
			if(mode.equals("search")) {
				count = service.searchCount(target, keyword);
				list = service.search(target, keyword, page_no);			
				mav.addObject("target", target);
				mav.addObject("keyword", keyword);
			} else {
				count = service.count();
				list = service.list(page_no);
			}

			mav.addObject("board", board);
			mav.addObject("list", list);
			mav.addObject("page_no", page_no);
			mav.addObject("count", count);
			mav.addObject("mode", mode);
			mav.setViewName("board/view");
		}
		return mav;
	}
}