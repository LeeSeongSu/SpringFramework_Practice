package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	@Test
	public void testConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";

		long start = System.currentTimeMillis();
		for (int i = 0; i < 1000; i++) {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "book_ex";
			String password = "book_ex";
			try {
				Class.forName(driver);
				System.out.println("jdbc driver 로딩 성공");
				DriverManager.getConnection(url, user, password);
				System.out.println("오라클 연결 성공");
			} catch (ClassNotFoundException e) {
				System.out.println("jdbc driver 로딩 실패");
			} catch (SQLException e) {
				System.out.println("오라클 연결 실패");
			}
		}
		long end = System.currentTimeMillis();
		log.info("------------------");
		log.info(end - start);
	}

}
