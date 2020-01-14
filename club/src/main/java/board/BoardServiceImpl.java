package board;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	@Override
	public int boardInsert(BoardVO vo, HttpServletRequest request) {
		int r = boardDao.boardInsert(vo);
		return r;
	}

	@Override
	public BoardVO boardDetail(int id) {
		BoardVO vo = boardDao.boardDetail(id);
		return vo;
	}

	@Override
	public int boardUpdate(BoardVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/test/"));
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setPicture(fu.fileName);
		}
		int r = boardDao.boardUpdate(vo);
		return r;
	}

	@Override
	public int boardDelete(int id) {
		int r = boardDao.boardDelete(id);
		return r;
	}


}
