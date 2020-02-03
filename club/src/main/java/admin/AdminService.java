package admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	AdminDAO adminDao;
	
	public int idCheck(String id) {
		return adminDao.idCheck(id);
	}
	
	public int insert(AdminVO vo) {
		return adminDao.insert(vo);
	}	
}
