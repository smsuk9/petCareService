package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.BoardVO;

public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	//게시글 전체 조회
	public List<BoardVO> selectList(){
		return sqlSession.selectList("b.selectList");
	}
}