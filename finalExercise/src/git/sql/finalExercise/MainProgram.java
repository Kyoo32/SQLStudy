package git.sql.finalExercise;
import java.sql.*;

public class MainProgram {

	public static void main(String[] args) {
		Connection connection = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		String sql = null;
		
		String jdbcUrl = "jdbc:mysql://10.73.38.158/kyuwon";
		String userID = "kyuwon";
		String userPW =  "dbgood";
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
			
			String sql1 =  "select studentname, trackname from student as s join track t join student_has_track1 on student_has_track1.student_idstudent = s.idstudent and student_has_track1.track_idtrack = t.idtrack";

			pstmt = connection.prepareStatement(sql1);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.

			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

			while(rs.next()){                                                        // 결과를 한 행씩 돌아가면서 가져온다.

				String stdname = rs.getString("studentname");
				String trackname = rs.getString("trackname");
			
				
				System.out.println(stdname + "/"  + trackname);

			}

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			System.out.println("테이블 호출에 실패했습니다.");
		}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
			if(connection != null) try{connection.close();}catch(SQLException sqle){}   // Connection 해제
		}
	}
}