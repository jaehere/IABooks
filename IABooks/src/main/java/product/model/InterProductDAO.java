package product.model;

import java.sql.SQLException;
import java.util.*;
//import java.util.Map;

import member.model.MemberVO;
import product.model.*;


public interface InterProductDAO {
	
	// 카테고리(종합,인문,사회,과학) select 
	List<ProductVO> selectPagingProduct(Map<String, String> paraMap) throws SQLException;
	// 카테고리(best20) select 
	List<ProductVO> selectCategoryBest20() throws SQLException;
	// 카테고리(newbook) select 
	List<ProductVO> selectCategoryNewBook() throws SQLException;
	// 카테고리(restock) select 
	List<ProductVO> selectCategoryRestock() throws SQLException;
	// 카테고리(oldbook) select 
	List<ProductVO> selectCategoryOldBook() throws SQLException;
	//페이징 처리를 위한 제품에 대한 총페이지 알아오기
	Map<String, Integer> getTotalPage(Map<String, String> paraMap) throws SQLException;
	//페이징 처리를 위한 검색한 제품에 대한 총페이지 알아오기
	Map<String, Integer> getSearchPage(Map<String, String> paraMap) throws SQLException;
	//페이징 처리를 위한 검색한 제품 select
	List<ProductVO> selectPagingSearch(Map<String, String> paraMap) throws SQLException;
	//주문할 회원 아이디 정보 불러오기 ? 삭제예정
	MemberVO oderUserInfo(String userid) throws SQLException;
	//인덱스에서 slidesList 띄우기
	List<ProductVO> selectSlides(Map<String, String> paraMap) throws SQLException;
	//인덱스에서 best책띄우기
	List<ProductVO> selectIndexBest(Map<String, String> paraMap) throws SQLException;
	//인덱스에서 화제의책 띄우기
	List<ProductVO> selectIndexHot() throws SQLException;
	//인덱스에서 이책어때요 띄우기
	List<ProductVO> selectIndexRandom() throws SQLException;
	// 제품번호를 입력받아서 제품의 상세정보를 출력해주는 메소드 구현하기
	ProductVO showBookDetail(String pk_pro_num) throws SQLException;
	//장바구니에 추가할 상품개수랑 재고량비교
	Map<String, Integer> qtyCheck(Map<String, String> paraMap) throws SQLException;
	//현재 장바구니에 추가할 제품이 장바구니에 있는지 중복체크
	boolean proCartCheck(Map<String, String> paraMap) throws SQLException;
	//장바구니에 중복된 제품이 있어서 수량 update
	int updateAddCart(Map<String, String> paraMap) throws SQLException;
	//장바구니에 제품 추가 insert
	int insertAddCart(Map<String, String> paraMap) throws SQLException;
	//현재 유저가 장바구니에 가지고있는 제품수
	Map<String, Integer> cartQtyCheck(Map<String, String> paraMap) throws SQLException;
	//현재 유저의 장바구니 수량 변경
	int updatePqty(Map<String, String> paraMap) throws SQLException;
	//삭제하기 버튼 클릭시 선택 제품 삭제
	int proDeleteSelect(Map<String, String> paraMap) throws SQLException;
	//partPrice값조회
	int partPriceSelect(Map<String, String> paraMap) throws SQLException;
	//totalPrice조회
	int totalPriceSelect(Map<String, String> paraMap) throws SQLException;
	//장바구니 모두 비우기
	int deleteCartAll(Map<String, String> paraMap) throws SQLException;
	//선택상품 주문하기
	CartVO orderSelect(Map<String, String> paraMap) throws SQLException;
	//전체 상품 주문하기
	List<CartVO> orderAll(Map<String, String> paraMap) throws SQLException;
	//한개 상품 주문하기
	List<CartVO> orderOne(Map<String, String> paraMap) throws SQLException;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////
	
	// 장바구니 조회하기 메소드
	List<CartVO> getCart(String fk_userid) throws SQLException;

	// VO 를 사용하지 않고 Map 으로 tbl_category 테이블에서 카테고리번호(pk_cate_num), 카테고리명(cate_name)을 조회해오기
	List<HashMap<String, String>> getCategoryList() throws SQLException;

	// tbl_writer 테이블에 작가정보 insert 하기
	int writerInsert(WriterVO wvo) throws SQLException;
	
	// tbl_product 테이블에 제품정보 insert 하기 
	int productInsert(ProductVO pvo) throws SQLException;
	
	// tbl_product 테이블에 카테고리를 가져오기 위해 select 해오기
	List<HashMap<String, String>> getCategoryListSelect() throws SQLException;
	
	// 작가코드(seq_tbl_writer 값) 중복검사하기
	public boolean wr_codeDuplicateCheck(String wrcode) throws SQLException;

	// 작가코드 존재하는지 찾기
	String findWr_code(Map<String, String> paraMap)  throws SQLException;
	
	// 작가코드(seq_tbl_writer 값)을 가져오기 
	int getSeq_tbl_writer() throws SQLException;
	
	// tbl_product_imagefile 테이블에 insert 하기 << 추가이미지 테이블
	int product_imagefile_Insert(Map<String, String> paraMap) throws SQLException;
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 
	//ProductVO selectOneProductByPnum(String pk_pro_num) throws SQLException;

	// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기 
	//List<String> getImagesByPnum(String pk_pro_num) throws SQLException;
		
	

	

	
	
	
	
	
	
	
}
