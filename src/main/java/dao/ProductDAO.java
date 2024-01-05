package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.ProductVO;

public class ProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 상품 리스트 등록 기능 추가시 매개변수 int idx 추가해야함
	public List<ProductVO> selectList(){
		List<ProductVO> list = sqlSession.selectList("product.product_list");
		return list;
	}

}
