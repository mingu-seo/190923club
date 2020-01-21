package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import adminNotice.AdminNoticeVO;
import util.FileUtil;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminNoticeDao;
	
	
}
