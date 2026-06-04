<%-- 
    Document   : acceptedTasks
    Created on : Jun 4, 2026, 2:11:42 PM
    Author     : wpy92
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Accepted Tasks</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    </head>
    <body>
        <div class="container">
            <h2>My Commitments & Progress</h2>
            <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>
            <p style="color: green;">${param.msg}</p>
            <hr>

            <c:choose>
                <c:when test="${empty acceptedTaskList}">
                    <p>You haven't accepted any tasks yet, or your tasks are fully finalized.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="task" items="${acceptedTaskList}">
                        <div class="task-card severity-${task.severity.toLowerCase()}">
                            <h3>${task.description}</h3>
                            <p><strong>Location:</strong> ${task.location}</p>
                            <p><strong>Current Tracking Status:</strong> 
                                <span style="background: #eef4fb; padding: 4px 8px; border-radius: 4px; font-weight: bold;">
                                    ${task.status}
                                </span>
                            </p>

                            <form action="volunteer-portal" method="post" style="margin-top: 15px; background: #f8f9fa; padding: 15px; border-radius: 6px;">
                                <input type="hidden" name="action" value="updateProgress">
                                <input type="hidden" name="taskId" value="${task.id}">

                                <label for="progressStatus-${task.id}">Update Operational Progress:</label>
                                <select name="progressStatus" id="progressStatus-${task.id}" style="width: auto; display: inline-block; margin-right: 10px;">
                                    <option value="Not Started" ${task.status == 'Not Started' || task.status == 'Accepted' ? 'selected' : ''}>Not Started</option>
                                    <option value="In Progress" ${task.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                    <option value="Completed" ${task.status == 'Completed' ? 'selected' : ''}>Completed / Done</option>
                                </select>

                                <button type="submit" class="btn btn-success" style="padding: 8px 15px; font-size: 0.85rem;">Update</button>
                            </form>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
