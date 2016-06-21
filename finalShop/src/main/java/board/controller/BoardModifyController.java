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
public class BoardModifyController {
	@Autowired
	BoardService service;
	
//	// parameter 값 없이 접근할 경우 목록으로 리턴
//	@RequestMapping(value="/board/modify.do", params="!board_no")
//	public String returnToList() {
//		return "redirect:/board/list.do";
//	}

	@RequestMapping(value="/board/modify.do", method=RequestMethod.GET)
	public ModelAndView modifyForm(@RequestParam(value = "board_no", required = true) String board_no) {

		ModelAndView mav = new ModelAndView();

		if(board_no == null) {
			mav.setViewName("redirect:/board/list.do");
		} else {
			BoardDTO board = service.view(board_no);
			mav.addObject("board", board);
			mav.setViewName("board/modify");
		}
			return mav;
	}
	
	@RequestMapping(value="/board/modify.do", method=RequestMethod.POST)
	public String runModify(BoardDTO board) {
		service.modify(board);
		return "redirect:/board/view.do?board_no=" + board.getBoard_no();
	}
}