package purchase.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PurchaseDAO implements InterPurchaseDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public PurchaseDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semidog");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	};

	public void close() {

		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public int purchaseInsert(HashMap<String, String> paraMap) throws SQLException {
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = " insert into tbl_dog_product(product_code, product_name, product_price, product_explanation, fk_brand_code, "
					+ " product_sample, product_ingredient, product_texture, product_capacity, product_age, product_quantity ) "
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("PrdNum"));
			pstmt.setString(2, paraMap.get("Ha_title"));
			pstmt.setString(3, paraMap.get("Ha_price"));
			pstmt.setString(4, paraMap.get("mainImg"));
			pstmt.setString(5, paraMap.get("Ha_brand"));
			pstmt.setString(6, paraMap.get("sample"));
			pstmt.setString(7, paraMap.get("Ha_meat"));
			pstmt.setString(8, paraMap.get("texture"));
			pstmt.setString(9, paraMap.get("capacity"));
			pstmt.setString(10, paraMap.get("age"));
			pstmt.setString(11, paraMap.get("quantity"));

			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}

	@Override
	public int getPrdNum() throws SQLException {
		int PrdNum = 0;

		try {
			conn = ds.getConnection();

			String sql = " select seq_dog_product.nextval AS fk_product_code from dual ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next();

			PrdNum = rs.getInt(1);

		} finally {
			close();
		}

		return PrdNum;
	}

	@Override
	public int purchaseImg(int prdNum, String attachFileName) throws SQLException {
		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_dog_prodphoto(prodphoto_seq, fk_product_code, photoname, status) "
					+ " values(seq_dog_prodphoto.nextval, ?, ?, default) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prdNum);
			pstmt.setString(2, attachFileName);

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}

	@Override
	public List<HashMap<String, String>> prdList(String sort1, String sort2) throws SQLException {
		List<HashMap<String, String>> prdList = null;

		try {
			conn = ds.getConnection();
			int sort = Integer.parseInt(sort1);
			int sorttwo = Integer.parseInt(sort2);
			
			String sql = " select product_code, product_name, product_explanation, product_price, contentTotal  "
					+ " from tbl_dog_product cross join ( select count(*) as contentTotal from tbl_dog_product  ";
			
					if(sort==0) {
						sql+=" where product_sample = 0) "
								+ " where product_sample = 0 ";
					}					
					else if(sort==1||sort==6) {
						sql+=" ) "
								+ " ";
					}
					else if(sort==2) {
						sql+="  where fk_brand_code = 1)  "
								+ "where fk_brand_code = 1";
					}
					else if(sort==3) {
						sql+="  where fk_brand_code = 2)  "
								+ " where fk_brand_code = 2";
					
					}
					else if(sort==4) {
						sql+="  where fk_brand_code = 3)  "
								+ " where fk_brand_code = 3";
					}
					else if(sort==5) {
						sql+="  where fk_brand_code = 4)  "
								+ " where fk_brand_code = 4";
					} 
					else if(sort==7) {
						sql+="  where product_age = 1) "
								+ " where product_age = 1";
					}
					else if(sort==8) {
						sql+="  where product_age = 2) "
								+ " where product_age = 2";
					}
					else if(sort==9) {
						sql+="  where product_age = 3) "
								+ " where product_age = 3";
					}
					else if(sort==10) {
						sql+="  where product_age = 4) "
								+ " where product_age = 4";
					}
					
					if(sorttwo==0) {
						sql+=" order by product_code desc";
					}
					else if(sorttwo==1) {
						sql+=" order by product_code asc";
					} // 인기상품 미구현
					else if(sorttwo==2) {
						sql+=" order by product_price asc";
					}
					else if(sorttwo==3) {
						sql+=" order by product_price desc";
					}
		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				cnt++;
				if (cnt == 1) {
					prdList = new ArrayList<HashMap<String, String>>();
				}

				HashMap<String, String> map = new HashMap<String, String>();
				map.put("code", rs.getString(1));
				map.put("name", rs.getString(2));
				map.put("img", rs.getString(3));
				map.put("price", rs.getString(4));
				map.put("total", rs.getString(5));
				prdList.add(map);
			}

		} finally {
			close();
		}

		return prdList;
	}

	@Override
	public List<HashMap<String, String>> purchaseContent(String prdcode) throws SQLException {
		List<HashMap<String, String>> purchaseContent = null;

		try {
			conn = ds.getConnection();
			
			String sql = " select * from tbl_dog_product join tbl_dog_prodphoto"
					+ " on tbl_dog_product.product_code = tbl_dog_prodphoto.fk_product_code "
					+ " where product_code = ? "
					+ " order by product_code ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prdcode);
			rs =pstmt.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt++;
				if(cnt==1) {
					purchaseContent = new ArrayList<HashMap<String,String>>();
				}
				HashMap<String,String> paraMap = new HashMap<String,String>();
				paraMap.put("PRODUCT_NAME", rs.getString("PRODUCT_NAME"));
				paraMap.put("PRODUCT_EXPLANATION", rs.getString("PRODUCT_EXPLANATION"));
				paraMap.put("PRODUCT_PRICE", rs.getString("PRODUCT_PRICE"));
				paraMap.put("PHOTONAME", rs.getString("PHOTONAME"));
				
				purchaseContent.add(paraMap);
			}
			
		} finally {
			close();
		}
		return purchaseContent;
	}

} // CLASS
