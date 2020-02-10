package file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//파일저장
	public int fileInsert(FileVO vo) {
		return sqlSession.insert("file.file_insert", vo);
	}
	//파일선택
	public FileVO fileSelect(FileVO vo) {
		return sqlSession.selectOne("file.file_select", vo);
	}
	public int fileUpdate(FileVO vo) {
		return sqlSession.update("file.file_update", vo);
	}
}
