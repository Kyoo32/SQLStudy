package git.sql;
import java.sql.*;

public class DBApp {

	public static void main(String[] args) {
		Connection connection = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		String sql = null;
		
		String jdbcUrl = "jdbc:mysql://10.73.43.229/exercise";
		String userID = "nextuser";
		String userPW =  "1snow";
		try{


			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			connection =DriverManager.getConnection(jdbcUrl,userID,userPW);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			System.out.println("제대로 연결되었습니다.");                            // 커넥션이 제대로 연결되면 수행된다.

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
		}
		
		try{
			//select
			
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			connection = DriverManager.getConnection(jdbcUrl,userID,userPW);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			String sql1 = "select * from book_inventory";                        // sql 쿼리
			pstmt = connection.prepareStatement(sql1);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.

			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

			while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.

				String id = rs.getString("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String cost = rs.getString("cost");
				String inventory = rs.getString("inventory");
				
				System.out.println(id + "/"  + title + "/" + author + "/" + cost + "/"+inventory);

			}

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("book_inventory 테이블 호출에 실패했습니다.");
		}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
			if(connection != null) try{connection.close();}catch(SQLException sqle){}   // Connection 해제
		}
		
		try {
			//update
			connection = DriverManager.getConnection(jdbcUrl, userID, userPW);
			System.out.println("Connection2 Success");
			
			stmt = connection.createStatement();
			sql = "update book_inventory set cost = cost * 1 where id = 3";
			int x = stmt.executeUpdate(sql);
			System.out.println(x+"updqted");
			
			stmt.close();
			connection.close();
			
		} catch(SQLException e) {
			System.out.println("DB error"+e.getMessage());
	
		}

		/*
		try{
			//insertion
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			connection = DriverManager.getConnection(jdbcUrl,userID,userPW);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			sql = "insert into book_inventory (title, author,publication,isbn) values(?,?,?,?)";        // sql 쿼리
			pstmt = connection.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
			//pstmt.setInt(1, null);
			pstmt.setString(1,"객체지향의 사실과 오해");
			pstmt.setString(2, "조영호");
			pstmt.setString(3, "위키북스");
			pstmt.setString(4, "9788998139767");		

			pstmt.executeUpdate();                                       // 쿼리를 실행한다.
			//pstmt.executeUp();
			 

			System.out.println("book 테이블에 새로운 레코드를 추가했습니다.");        // 성공시 메시지 출력

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("book 테이블에 새로운 레코드 추가에 실패했습니다.");
		}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}            // PreparedStatement 객체 해제
			if(connection != null) try{connection.close();}catch(SQLException sqle){}            // Connection 해제
		}
		*/
		
		
		try {
			//transaction + commit + rollback
			connection = DriverManager.getConnection(jdbcUrl, userID, userPW);
			System.out.println("Connection3 Success");
			
			
			String sql1 = "select * from book_inventory";                        // sql 쿼리
			pstmt = connection.prepareStatement(sql1);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.

			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

			while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.

				connection.setAutoCommit(false);
				String id = rs.getString("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String cost = rs.getString("cost");
				Integer inventory = rs.getInt("inventory");				
				
				if(inventory >= 0 ){
					stmt = connection.createStatement();
					sql = "update book_inventory set inventory = inventory + 1 where id = " + id;
					int x = stmt.executeUpdate(sql);
					System.out.println( title +"updqted");
					connection.commit();
				}else{
					System.out.println( title +"rollbacked");
					connection.rollback();
				}
				
			}
					
			pstmt.close();
			connection.close();
			
		} catch(SQLException e) {
			System.out.println("DB error"+e.getMessage());
	
		} finally {
			if(pstmt!=null)
				try { pstmt.close(); }
				catch(SQLException e) {} 
			if(rs!=null)
				try { rs.close(); } 
				catch(SQLException e) {}
			if(connection!=null)
				try { connection.setAutoCommit(true); }
				catch(SQLException e) {} }

	}
	
}
