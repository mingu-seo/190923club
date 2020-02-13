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
	
	public int insert(AdminVO adminvo) {
		return adminDao.insert(adminvo);
	}

	public AdminVO adminLogin(AdminVO adminvo) {
		// TODO Auto-generated method stub
		return adminDao.adminLogin(adminvo);
	}	
}
