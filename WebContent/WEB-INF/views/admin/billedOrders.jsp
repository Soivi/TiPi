
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Laskutetut tilaukset</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<%@include file="ordersNavi.jsp"%>
			<div class="row-fluid">
				<div class="span10 offset1">

					<fieldset>
						<legend>Laskutetut tilaukset</legend>
						<div class="row-fluid">
							<div class="span12">

								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Yritys</th>
											<th colspan=2>Nouto</th>
											<th colspan=2>Toimitus</th>
											<th>Palautus</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><c:out value="${order.userProfile.company.name}" /></td>
												<td><c:out value="${order.collectionCity}" />, <c:out
														value="${order.collectionAddress}" /></td>
												<td><i class="icon-arrow-right"></i></td>
												<td><c:out value="${order.destinationCity}" />, <c:out
														value="${order.destinationAddress}" /></td>
												<c:choose>
													<c:when test="${order.hasNewDestination}">
														<td><i class="icon-arrow-right"></i></td>
														<td><c:out value="${order.nextDestinationCity}" />,
															<c:out value="${order.nextDestinationAddress}" /></td>
													</c:when>
													<c:otherwise>
														<td colspan="2"></td>
													</c:otherwise>
												</c:choose>
												<form action="orderInformation" method="post" class="span4">
													<td><input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Avaa</button></td>
												</form>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/jquery-tablesorter/jquery.tablesorter.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("table#myTable").tablesorter({
					sortList : [ [ 1, 0 ] ]
				});
			});
		});
	</script>
</body>
</html>