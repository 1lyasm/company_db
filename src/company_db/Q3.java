package company_db;

import java.io.IOException;
import java.sql.*;

public class Q3 {
	public static void main(String[] args) throws SQLException, IOException {
		String username = "postgres", password = "postgres";
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company",
				username, password);
		String query = """
				select
					d.dname as dname,
					count(*) as n_emp
				from
					employee as e,
					department as d
				where
					e.dno = d.dnumber
				group by
					d.dnumber
				order by
					dname
				""";
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery(query);
		while (results.next()) {
			String dname = results.getString("dname");
			String n_emp = results.getString("n_emp");
			System.out.println(dname + " " + n_emp);
		}
		statement.close();
		connection.close();
	}
}
