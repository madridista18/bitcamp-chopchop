<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>상품 목록</title>
<!--   <link rel="stylesheet" href="/css/main/main_style.css"> -->
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <style>

#admin-content {
  width: 1100px;
  padding-top: 10px;
  margin: 0 auto;
}

.pInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.pInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.product-h3 {
/*   font-family: 'Oswald' !important; */
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}
  </style>

</head>

<jsp:include page="../header.jsp"/>
<jsp:include page="admin_sidebar.jsp"/>
<body>



  <div id="admin-content">
    <div class="d-flex justify-content-between align-items-center py-0 mb-3 pInfo">
      <h3 class="product-h3">상품 목록</h3>
      <span class="pInfo-span"> 
<!--         <a href="/app/member/myprofile" class="admin-tagA"> -->
        관리자페이지</a>&nbsp>&nbsp전체상품목록
      </span>
    </div>
    <div style="float:right;">
      <button type="button" onclick="location.href='/app/product/form'">새 상품</button>
      <select name="productCategory">
        <option value="" selected="selected">전체</option>
        <option value="">강아지</option>
        <option value="">고양이</option>
        <option value="">작은친구들</option>
      </select>
    </div>
    <table class='table table-hover'>
      <tr>
        <th>상품번호</th>
        <th>상품명</th>
        <th>상품금액</th>
        <th>할인율</th>
        <th>할인적용금액</th>
        <th>조회수</th>
      </tr>
      <c:forEach items="${products}" var="product">
        <tr>
          <td>${product.productNo}</td>
          <td><a href='/app/product/detail?no=${product.productNo}' target="_blank" class="r-tagA">
          <div>
                <p style="float: left;">
                <img src="/upload/product/${product.files[0].filePath}" style="width: 100px; margin-right: 22px;"></p>
                <div>
                  <p class="review-tagP">${product.title}</p>
                </div>
              </div></a><br>
          </td>
          <td>
            <span style=" text-decoration:line-through">
            <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
          </td>
          <td>${product.discount}</td>
          <td><span>
            <span id='product-price'><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /></span>
            원</span>
            </td>
          <td>${product.viewCount}회</td>
        </tr>
      </c:forEach>
    </table>
    
  </div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
<!--   <div class="bueno-post-area mb-70"> -->
<!--       <div class="container"> -->
<!--         <div class="row ml-0" > -->
<!--             <div id="prod_columns"style="align-content: center;"> -->
<%--               <c:forEach items="${products}" var="product"> --%>
<!--                 <figure> -->
<%--                   <a href="/app/product/detail?no=${product.productNo}"><img src="/upload/product/${product.files[0].filePath}"></a> --%>
<!--                   <figcaption> -->
<!--                     <div class="product-info"> -->
<!--                       <div class="product-title tagA"> -->
<%--                         <a href="/app/product/detail?no=${product.productNo}"><strong style="font-size: 22px;">${product.title}</strong></a> --%>
<!--                       </div> -->
<%--                       <div class="product-detail"><span>${product.detail}</span></div> --%>
<!--                         <div class="product-price"> -->
<%--                           <c:if test="${product.discount ne 0}"> --%>
<%--                             <span style="color:#35c5f0;">${product.discount}%&nbsp</span> --%>
<!--                             <span style=" text-decoration:line-through"> -->
<%--                             <fmt:formatNumber value="${product.price}" pattern="#,###" />원</span>&nbsp --%>
<%--                           </c:if> --%>
<%--                           <span><fmt:formatNumber value="${product.price * (100-product.discount)/100}" pattern="#,###" />원</span> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                   </figcaption> -->
<!--                 </figure> -->
<%--               </c:forEach> --%>
<!--             </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->

<jsp:include page="../footer.jsp"/>

<script src="../js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="../js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="../js/active.js"></script>

  <!-- <script>
    var totalPrice = document.getElementsByClassName('totalPrice');
    for(var i of totalPrice) {
      i.innerText = parseInt(i.innerText)
    }
  </script> -->
</body>
</html>
