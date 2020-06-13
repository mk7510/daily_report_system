<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<script type="text/javascript">
        // 開始時刻設定
            function getClock_inNow() {
                  document.getElementById( "clock_in" ).value = getNow();
                    }
            // 終了時刻設定
            function getClock_outNow() {
                  document.getElementById( "clock_out" ).value = getNow();
                    }
            // 現在時刻取得
            function getNow() {
                  var now = new Date();
                  var hour = now.getHours();
                  var min = now.getMinutes();
                    //出力用
                  var s = hour + ":" + min ;
                  return s;
                  }
</script>
<label for="clock_in">出勤時刻</label><br />
 <input type="time" id="clock_in" name="clock_in" value="<fmt:formatDate value="${report.clock_in}" pattern='HH:mm'/>"/> <input type="button" value="出勤" onclick="getClock_inNow();"><br/>
 <label for="clock_out">退勤時刻</label><br />
 <input type="time" id="clock_out" name="clock_out" value="<fmt:formatDate value="${report.clock_out}" pattern='HH:mm'/>" /> <input type="button" value="退勤" onclick="getClock_outNow();"><br/>
 <br /><br />

<label for="report_date">日付</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="title">タイトル</label><br />
<input type="text" name="title" value="${report.title}" />
<br /><br />

<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>