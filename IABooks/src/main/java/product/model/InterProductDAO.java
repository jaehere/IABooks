package product.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
//import java.util.Map;

import member.model.CouponVO;

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
	//인덱스에서 slidesList 띄우기
	List<ProductVO> selectSlides(Map<String, String> paraMap) throws SQLException;
	//인덱스에서 best책띄우기
	List<ProductVO> selectIndexBest(Map<String, String> paraMap) throws SQLException;
	//인덱스에서 화제의책 띄우기
	List<ProductVO> selectIndexHot() throws SQLException;
	//인덱스에서 이책어때요 띄우기
	List<ProductVO> selectIndexRandom() throws SQLException;
	// 제품번호를 입력받아서 제품의 상세정보를 출력해주는 메소드 구현하기
	ProductVO showBookDetail(String pk_pro_num) throws SQLException, IOException;
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
	//로그인한 유저가 사용가능한 쿠폰 
	List<CouponVO> userCoupon(Map<String, String> paraMap)throws SQLException;
	// 장바구니 조회하기 메소드
	//List<CartVO> getCart(String fk_userid) throws SQLException;
	//선택한 totalPrice조회
	int totalPriceSelect2(Map<String, String> paraMap) throws SQLException;
	//선택한 cartNoCheck 조회
	Map<String, String> cartNoCheck(Map<String, String> paraMap) throws SQLException;
	//선택한 cpriceCheck 조회
	String cpriceCheck(Map<String, String> paraMap) throws SQLException;
	//결제 마지막 (오더테이블 insert, 제품수량 update, 포인트 insert)
	int paymentEnd(Map<String, Object> paraMap) throws SQLException;
	//order테이블 채번
	int getSeq_tbl_order() throws SQLException;
	//주문일자 가져오기
	String ordDate(Map<String, Object> paraMap) throws SQLException;
	//사용가능한 포인트 보기
	String userPoint(Map<String, String> paraMap)throws SQLException;
	//관리자 전용 구매리스트 출력
	List<HashMap<String, String>> orderList(Map<String, String> paraMap) throws SQLException;
	//관리자 전용 구매내역 배송상태 변경
	int deliverChange(Map<String, String> paraMap) throws SQLException;
	//관리자 전용 배송상태 배송완료시 배송완료 날짜 등록
	int deliverdateInsert(Map<String, String> paraMap) throws SQLException;
	//관리자 전용 배송상태 리스트
	List<HashMap<String, String>> deliverstatusList() throws SQLException;
	//관리자 전용 구매내역 회원정보
	Map<String, String> orderMemberInfo(Map<String, String> paraMap)throws SQLException;
	//관심상품에 존재하는지 확인
	String getOneCartPnum(Map<String, String> paraMap)throws SQLException;
	//장바구니있는상품 관심상품에 추가
	int insertAddWish(Map<String, String> paraMap)throws SQLException;
	
	////////////////////////////////////////////////////////////////////////////////////////////////

	// 장바구니 조회하기 메소드
	List<CartVO> getCart(String fk_userid) throws SQLException;

	// VO 를 사용하지 않고 Map 으로 tbl_category 테이블에서 카테고리번호(pk_cate_num), 카테고리명(cate_name)을 조회해오기
	List<HashMap<String, String>> getCategoryList() throws SQLException;

	// tbl_product 테이블에 제품정보 insert 하기 
	int productInsert(ProductVO pvo) throws SQLException;

	// 작가존재여부
	int findWrcode(Map<String, String> paraMap) throws SQLException;
	
	// 작가없을경우 작가 추가
	int writerInsert(Map<String, String> paraMap) throws SQLException;
	
	//도서표준번호 존재여부
	String findProNum(Map<String, String> paraMap) throws SQLException;
	
	//도서표준번호 있다면 업데이트
	int productUpdate(Map<String, String> paraMap) throws SQLException;
	
	//작가코드 채번하기
	int getSeq_tbl_writer()throws SQLException;

	
}
