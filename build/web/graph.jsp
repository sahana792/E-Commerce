<%-- 
    Document   : graph
    Created on : 9 Oct, 2025, 1:03:13 AM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="database.dbconfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Income Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* === General Page Styling === */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #c3ec52, #0ba29d);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* === Back Button Styling === */
        .top-bar {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 20px 40px;
        }

        .top-bar form button {
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .top-bar form button:hover {
            background-color: #d32f2f;
            transform: scale(1.05);
        }

        /* === Heading === */
        h2 {
            text-align: center;
            color: #333;
            font-size: 32px;
            margin-top: 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* === Chart Container === */
        .chart-container {
            width: 80%;
            max-width: 700px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 15px;
            padding: 25px 20px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.2);
            text-align: center;
        }

        canvas {
            width: 100% !important;
            height: 400px !important;
        }

        /* === Responsive Design === */
        @media screen and (max-width: 768px) {
            .chart-container {
                width: 90%;
                padding: 20px 15px;
            }

            h2 {
                font-size: 26px;
            }

            canvas {
                height: 300px !important;
            }
        }
        /* ===== Navigation Bar ===== */
        nav {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 1px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 3;
            border-radius: 0 0 15px 15px;
        }

        nav .nav-left h2 {
            color: #6c63ff;
            font-size: 26px;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        nav .nav-right a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            margin: 0 20px;
            font-size: 17px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        nav .nav-right a:hover {
            color: #6c63ff;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <!-- Back Button -->
    <div class="top-bar">
        <form action="Menu.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>
    <nav>
        <div class="nav-left">
            <h2>Ecommerce</h2>
        </div>
        <div class="nav-right">
            <a href="graph.jsp">Home</a>
            <a href="add.jsp">Add</a>
            <a href="pview.jsp">View</a>
            <a href="Monthly.jsp">Income</a>
            <a href="alogout">Logout</a>
        </div>
    </nav>

<%
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");

    java.util.List<String> dates = new java.util.ArrayList<String>();
    java.util.List<Double> totals = new java.util.ArrayList<Double>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = new dbconfig().getConnection();

        String query;
        PreparedStatement ps;

        if (fromDate != null && toDate != null && !fromDate.isEmpty() && !toDate.isEmpty()) {
            query = "SELECT DATE(date) as pdate, SUM(price) as total FROM details WHERE DATE(date) BETWEEN ? AND ? GROUP BY DATE(date) ORDER BY DATE(date)";
            ps = con.prepareStatement(query);
            ps.setString(1, fromDate);
            ps.setString(2, toDate);
        } else {
            query = "SELECT DATE(date) as pdate, SUM(price) as total FROM details GROUP BY DATE(date) ORDER BY DATE(date)";
            ps = con.prepareStatement(query);
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            dates.add(rs.getString("pdate"));
            totals.add(rs.getDouble("total"));
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    // Convert lists to JavaScript arrays
    StringBuilder jsDates = new StringBuilder("[");
    StringBuilder jsTotals = new StringBuilder("[");
    for (int i = 0; i < dates.size(); i++) {
        jsDates.append("\"").append(dates.get(i)).append("\"");
        jsTotals.append(totals.get(i));
        if (i < dates.size() - 1) {
            jsDates.append(",");
            jsTotals.append(",");
        }
    }
    jsDates.append("]");
    jsTotals.append("]");
%>

    <!-- Chart Section -->
    <div class="chart-container">
        <h2>Monthly Income Chart</h2>
        <canvas id="incomeChart"></canvas>
    </div>

    <!-- Chart.js Script -->
    <script>
        const labels = <%= jsDates.toString() %>;
        const data = {
            labels: labels,
            datasets: [{
                label: 'Total Income (Rs)',
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 2,
                data: <%= jsTotals.toString() %>,
                borderRadius: 5,
            }]
        };

        const config = {
            type: 'bar',
            data: data,
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Date',
                            color: '#333',
                            font: { size: 14, weight: 'bold' }
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Total Income (Rs)',
                            color: '#333',
                            font: { size: 14, weight: 'bold' }
                        }
                    }
                },
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        backgroundColor: 'rgba(0,0,0,0.7)',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        borderColor: '#fff',
                        borderWidth: 1
                    }
                }
            }
        };

        new Chart(document.getElementById('incomeChart'), config);
    </script>

</body>
</html>
