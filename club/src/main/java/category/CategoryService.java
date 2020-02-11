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
	
	public List<CategoryVO>[] categoryList(CategoryVO vo) {
		List<CategoryVO>[] listArr = new List[3];
		listArr[0] = categoryDao.gCategoryList(vo);
		listArr[1] = categoryDao.wCategoryList(vo);
		listArr[2] = categoryDao.nCategoryList(vo);
		return listArr;
	}
	
	public CategoryVO cateMin_num(int spot_num) {
		return categoryDao.cateMin_num(spot_num);
	}
	
	public CategoryVO cateName_select(int category_id) {
		return categoryDao.cateName_select(category_id);
	}
	
}
