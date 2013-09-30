<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Siirtoapu.fi -- Uusi tilaus</title>
<link rel="stylesheet"
	href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/styles/style.css">
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table" id="orderConfirmationTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Auto</td>
						</tr>
					</thead>
					<tr>
						<th>Automalli</th>
						<td><c:out value="${orderForm.carBrand}" default="-----" /></td>
						<th>Rekisterinumero</th>
						<td><c:out value="${orderForm.carRegister}" default="-----" /></td>
					</tr>
					<tr>
						<th>Automerkki</th>
						<td><c:out value="${orderForm.carModel}" default="-----" /></td>
						<th>Autoväri</th>
						<td><c:out value="${orderForm.carColor}" default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Nouto</td>
						</tr>
					</thead>

					<tr>
						<th>Noudettavissa päivämäärä</th>
						<td><c:out value="${orderForm.collectionDate}"
								default="-----" /></td>
						<th>Perillä päivämäärä</th>
						<td><c:out value="${orderForm.destinationDate}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Noudettavissa kellonaika</th>
						<td><c:out value="${orderForm.collectionTime}"
								default="-----" /></td>
						<th>Perillä kellonaika</th>
						<td><c:out value="${orderForm.destinationTime}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Nouto osoite</th>
						<td><c:out value="${orderForm.collectionAddress}"
								default="-----" /></td>
						<th>Toimitus osoite</th>
						<td><c:out value="${orderForm.destinationAddress}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Nouto postinumero</th>
						<td><c:out value="${orderForm.collectionPostalCode}"
								default="-----" /></td>
						<th>Toimitus postinumero</th>
						<td><c:out value="${orderForm.destinationPostalCode}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Nouto toimipaikka</th>
						<td><c:out value="${orderForm.collectionCity}"
								default="-----" /></td>
						<th>Toimitus toimipaikka</th>
						<td><c:out value="${orderForm.destinationCity}"
								default="-----" /></td>
					</tr>


					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Asiakas</td>
						</tr>
					</thead>

					<tr>
						<th>Etunimi</th>
						<td><c:out value="${orderForm.clientFname}" default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${orderForm.clientPhoneNo}" default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${orderForm.clientLname}" default="-----" /></td>
						<th>Yritys</th>
						<td><c:out value="${orderForm.clientCompany}" default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Toimituksen
								Lisätiedot</td>
						</tr>
					</thead>

					<tr>
						<td colspan="4"><c:out
								value="${orderForm.additionalInformation}" default="-----" /></td>
					</tr>
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Palautus</td>
						</tr>
					</thead>

					<tr>
						<th>Nouto Päivämäärä</th>
						<td><c:out value="${orderForm.nextDestinationCollectionDate}" default="-----" /></td>
						<th>Palautus Päivämäärä</th>
						<td><c:out value="${orderForm.nextDestinationDate}" default="-----" /></td>
					</tr>

					<tr>
						<th>Nouto aika</th>
						<td><c:out value="${orderForm.nextDestinationCollectionTime}" default="-----" /></td>
						<th>Palautus aika</th>
						<td><c:out value="${orderForm.nextDestinationTime}" default="-----" /></td>
					</tr>

					<tr>
						<th>Palautus osoite</th>
						<td><c:out value="${orderForm.nextDestinationAddress}" default="-----" /></td>
						<th>Palautus postinumero</th>
						<td><c:out value="${orderForm.nextDestinationPostalCode}" default="-----" /></td>
					</tr>

					<tr>
						<th>Palautus toimipaikka</th>
						<td><c:out value="${orderForm.nextDestinationCity}" default="-----" /></td>
						<td colspan="2"></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight:700;">Palautuksen
								Lisätiedot</th>
						</tr>
					</thead>

					<tr>
						<td colspan="4"><c:out
								value="${orderForm.nextAdditionalInformation}" default="-----" /></td>
					</tr>


					<tr>
						<td><a href="orderForm" class="btn btn-danger">Takaisin</a></td>
						<td>
							<button type="submit" class="btn btn-inverse">Lähetä
								tilaus</button>
						</td>
						<td colspan="2"></td>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>