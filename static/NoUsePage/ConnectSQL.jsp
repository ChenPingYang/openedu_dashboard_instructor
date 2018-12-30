<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%>
<%
	try {
		//讀取mysqlDriver驅動程式
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		try {
			//連接mysql資料庫
			String db_user = "student";//使用者名稱
			String db_pwd = "264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb";// 密碼
			String db_database = "edxresult";//資料庫名稱
			String db_hostport = "140.134.26.84:3309";
			//String db_hostport = "127.0.0.1:3309";
			Connection conn = DriverManager.getConnection("jdbc:mysql://" + db_hostport + "/" + db_database
					+ "?" + "useUnicode=true&characterEncoding=UTF-8", db_user, db_pwd);

			try {
				//建立statement
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_READ_ONLY);
				//建立SQL查詢
				String sql = "select * from course_total_data order by 行動觀看人次  desc";
				ResultSet rs = stmt.executeQuery(sql);
				%>
				<h2><font size="2">行動觀看人數TOP10</font></h2>
				 <input type="text" id="courseName" size="20" />
				<table class="table table-condensed">
					<tr>
						<th><font size="1">課程名稱</font></th>
						<th><font size="1">行動觀看人數</font></th>
					</tr>
					<%
						//顯示資料
					int i = 0;
					while (rs.next() && i < 10) {
						%>
						<tr>
							<td><%=rs.getString("course.name")%></td>
							<td><%=rs.getString("行動觀看人次")%></td>
						</tr>
						<%
						i++;
					}
				// 關閉連線
				
				String sq2 = "select * from course_total_data order by 行動觀看人次  desc";
				rs = stmt.executeQuery(sq2);
				%>
				<h2><font size="2">行動觀看人數TOP10</font></h2>
				<table class="table table-condensed">
					<tr>
						<th><font size="1">課程名稱</font></th>
						<th><font size="1">行動觀看人數</font></th>
					</tr>
					<%
						//顯示資料
					 i = 0;
					while (rs.next() && i < 10) {
						%>
						<tr>
							<td><%=rs.getString("course.name")%></td>
							<td><%=rs.getString("行動觀看人次")%></td>
						</tr>
						<%
						i++;
					}
				stmt.close();
				stmt = null;
				rs.close();
				rs = null;

			} catch (Exception e) {
				out.println("can't create statement");
				out.println(e.toString());
			}
		} catch (Exception e) {
			out.println("can't content mysql database");
			out.println(e.toString());
		}
	} catch (Exception e) {
		out.println("can't load mysql driver");
		out.println(e.toString());
	}
%>
<script>
out.println("5351");
</script>