package category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDao;
	
	public void categoryInsert(CategoryVO vo, HttpServletRequest request) {
		String[] names = request.getParameterValues("name");
		String[] category_ids = request.getParameterValues("category_ids");
		System.out.println(names.length);
		System.out.println(category_ids.length);
		for (int i=0; i<names.length; i++) {
			if ("".equals(category_ids[i])) {
				vo.setName(names[i]);
				categoryDao.categoryInsert(vo);
			}
		}
	}
	
	public List<CategoryVO> gCategoryList(CategoryVO vo) {
		return categoryDao.gCategoryList(vo);
	}
	
	public List<CategoryVO> wCategoryList(CategoryVO vo) {
		return categoryDao.wCategoryList(vo);
	}
	
	public List<CategoryVO> nCategoryList(CategoryVO vo) {
		return categoryDao.nCategoryList(vo);
	}
}
