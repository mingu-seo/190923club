package category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDao;
	
	public int categoryInsert(CategoryVO vo, HttpServletRequest request) {
		String[] names = request.getParameterValues("name");
		String[] category_ids = request.getParameterValues("category_ids");
		System.out.println(names.length);
		System.out.println(category_ids.length);
		for (int i=0; i<names.length; i++) {
			if ("".equals(category_ids[i])) {
				vo.setName(names[i]);
			}
		}
		return categoryDao.categoryInsert(vo);
	}
	
	public void categoryDelete(CategoryVO vo) {
		categoryDao.categoryDelete(vo);
	}
	
	public List<CategoryVO>[] categoryList(CategoryVO vo) {
		List<CategoryVO>[] listArr = new List[3];
		listArr[0] = categoryDao.gCategoryList(vo);
		listArr[1] = categoryDao.wCategoryList(vo);
		listArr[2] = categoryDao.nCategoryList(vo);
		return listArr;
	}
	//카테고리번호 제일 작은 값 불러오기
	public CategoryVO cateMin_num(int spot_num) {
		return categoryDao.cateMin_num(spot_num);
	}
	//카테고리 이름 불러오기
	public CategoryVO cateName_select(int category_id) {
		return categoryDao.cateName_select(category_id);
	}
	
}
