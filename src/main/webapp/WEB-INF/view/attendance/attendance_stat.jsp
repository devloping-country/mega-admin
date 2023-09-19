<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: uBeom
  Date: 2023-09-17
  Time: 오후 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mega - attendance-stat</title>
    <link rel="stylesheet" href="../../../css/reset.css">
    <link rel="stylesheet" href="../../../css/header.css">
    <link rel="stylesheet" href="../../../css/footer.css">
    <link rel="stylesheet" href="../../../css/attendance-stat.css">
</head>
<body>
<%@ include file="/WEB-INF/layout/header.jsp" %>
<div class="AttendanceStatWrapper">
    <main class="MainWrapper">
        <nav class="nav">
            <h2 class="title">출결관리</h2>
            <button type="button" class="btn">단위기간 설정</button>
        </nav>
        <section class="content">
            <ul class="tab-list">
                <li class="tab-item">
                    <h3 class="tab-title title-disabled">인원</h3>
                </li>
                <li class="tab-item">
                    <h3 class="tab-title title-active">통계</h3>
                </li>
            </ul>
            <ul class="table-header-list">
                <li class="table-header-item table-header-item-name">이름</li>
                <c:forEach var="attendanceDate" items="${attendanceDates}">
                    <li class="table-header-item">
                            ${fn:substring(attendanceDate.date, 5, 11)}
                        <p>${attendanceDate.day}</p>
                    </li>
                </c:forEach>
                <li class="table-header-item">미출석</li>
                <li class="table-header-item table-header-item-info">출석</li>
                <li class="table-header-item">지각</li>
                <li class="table-header-item">조퇴</li>
                <li class="table-header-item">공결</li>
                <li class="table-header-item">결석</li>
                <li class="table-header-item">병가</li>
            </ul>
            <div class="attendance-table-wrapper">
                <table class="attendance-table">
                    <c:forEach var="attendanceInfo" items="${attendanceInfos}">
                        <tr class="attendance-table-row">
                            <td class="attendance-table-col attendance-table-col-name">
                                    ${attendanceInfo.name}
                            </td>
                            <c:forEach var="attendanceDateInfo"
                                       items="${attendanceInfo.attendanceInfoo}">
                                <td class="attendance-table-col">${attendanceUserInfo.date}
                                    <c:choose>
                                        <c:when test="${attendanceDateInfo.value == 1}">미출석</c:when>
                                        <c:when test="${attendanceDateInfo.value == 2}">출석</c:when>
                                        <c:when test="${attendanceDateInfo.value == 3}">지각</c:when>
                                        <c:when test="${attendanceDateInfo.value == 4}">조퇴</c:when>
                                        <c:when test="${attendanceDateInfo.value == 5}">결석</c:when>
                                        <c:when test="${attendanceDateInfo.value == 6}">공가</c:when>
                                        <c:when test="${attendanceDateInfo.value == 7}">병가</c:when>
                                    </c:choose>
                                </td>
                            </c:forEach>
                            <c:forEach var="attendanceUserInfoCount"
                                       items="${attendanceInfo.statCounts}">
                                <td class="attendance-table-col attendance-table-col-result">
                                        ${attendanceUserInfoCount}
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </section>
    </main>
</div>
<%@ include file="/WEB-INF/layout/footer.jsp" %>
<script>
  const tableHeaderList = document.querySelector('.table-header-list');
  const attendanceTableWrapper = document.querySelector(
      '.attendance-table-wrapper'
  );

  tableHeaderList.addEventListener('scroll', () => {
    attendanceTableWrapper.scrollLeft = tableHeaderList.scrollLeft;
  });

  attendanceTableWrapper.addEventListener('scroll', () => {
    tableHeaderList.scrollLeft = attendanceTableWrapper.scrollLeft;
  });
</script>
</body>
</html>
