<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Profiili</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">


				<table class="table table-striped" id="userProfileTable">
					<thead>
						<tr>
							<td colspan="4" class="thead-header">K�ytt�j�</td>
						</tr>
					</thead>
					<tr>
						<td class="data-header">Etunimi</td>
						<td><c:out value="${userProfile.fName}" default="-----" /></td>
						<td class="data-header">Sukunimi</td>
						<td><c:out value="${userProfile.lName}" default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Puhelinnumero</td>
						<td><c:out value="${userProfile.phoneNo}" default="-----" /></td>
						<td class="data-header">S�hk�posti</td>
						<td><c:out value="${userProfile.email}" default="-----" /></td>
					</tr>

					<tr>
						<td colspan="4" class="thead-header">Yritys</td>
					</tr>
					<tr>
						<td class="data-header">Nimi</td>
						<td><c:out value="${userProfile.company.name}"
								default="-----" /></td>
						<td class="data-header">Osoite</td>
						<td><c:out value="${userProfile.company.address}"
								default="-----" /></td>
					</tr>

					<tr>
						<td class="data-header">Postinumero</td>
						<td><c:out value="${userProfile.company.postalCode}"
								default="-----" /></td>
						<td class="data-header">Toimipaikka</td>
						<td><c:out value="${userProfile.company.city}"
								default="-----" /></td>
					</tr>
				</table>

				<form action="changePassword" method="post" class="form-horizontal">
					<fieldset>
						<legend>Vaihda salasana</legend>
						<div class="row-fluid">
							<div class="span12">
								<div class="control-group">
								
									<c:if test="${not empty passwordChangeSuccessful}">
										<p class="alert alert-success">Salasana vaihdettu onnistuneesti</p>
									</c:if>
									<c:if test="${not empty passwordChangeFailed}">
										<p class="alert alert-error">Nykyinen salasana on v��r�</p>
									</c:if>
								
									<label id="oldPasswordL" class="control-label" for="textinput">Nykyinen</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="oldPassword"
											id="oldPassword" placeholder="Kirjoita nykyinen salasana" />
									</div>
								</div>

								<div class="control-group">
									<label id="newPassword" class="control-label" for="textinput">Uusi</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="newPassword"
											id="password" placeholder="Kirjoita uusi salasana" />

									</div>
								</div>

								<div class="control-group">
									<label id="newRePassword" class="control-label" for="textinput">Varmista
										uusi</label>
									<div class="controls">
										<input type="password" class="input-xlarge"
											name="password-check" id="password-check"
											placeholder="Kirjoita uusi salasana uudelleen" />
									</div>
								</div>



								<div class="row-fluid">
									<div class="offset2" style="padding-left: 1%;">
										<button type="submit" class="btn btn-success" value="Submit"
											id="submit">Vaihda salasana</button>
									</div>

								</div>

							</div>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#submit")
									.click(
											function() {
												$(".text-error").hide();
												$(".text-warning").hide();
												$(".text-success").hide();
												$(".text-info").hide();
												var hasError = true;
												var oldPasswordVal = $("#oldPassword").val();
												var passwordVal = $("#password").val();
												var checkVal = $("#password-check").val();
												
												if (oldPasswordVal == ''){
													$("#oldPassword").after('<span id="info" class="text-error">Sy�t� nykyinen salasana</span>');
												} else if (passwordVal.length < 6) {
													$("#password").after('<span id="info" class="text-error">Uusi salasana on liian lyhyt</span>');
												} else if (passwordVal.length > 100) {
													$("#password").after('<span id="info" class="text-error">Salasana on liian pitk�</span>');
												} else if (passwordVal != checkVal) {
													$("#password-check").after('<span id="info" class="text-error">Ei t�sm�� uuden salasanan kanssa</span>');
												} else{
													hasError = false;
												}

												if (hasError == true) {
													return false;
												}
											});

							$('#password').keyup(function() {
								checkStrength($('#password').val());
							});

							function checkStrength(password) {

								//initial strength
								var strength = 0;
								$(".text-error").hide();
								$(".text-warning").hide();
								$(".text-success").hide();
								$(".text-info").hide();

								//if the password length is less than 6, return message.
								if (password.length < 6) {
									$("#password")
											.after(
													'<span id="info" class="text-error">Lyhyt</span>');
									return 'Lyhyt';
								}

								//length is ok, lets continue.

								//if length is 8 characters or more, increase strength value
								if (password.length > 7)
									strength += 1;

								//if password contains both lower and uppercase characters, increase strength value
								if (password
										.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))
									strength += 1;

								//if it has numbers and characters, increase strength value
								if (password.length > 10
										&& password.match(/([a-zA-Z])/)
										&& password.match(/([0-9])/))
									strength += 1;

								//if it has one special character, increase strength value
								if (password.length > 12
										&& password
												.match(/([!,%,&,@,#,$,^,*,?,_,~])/))
									strength += 1;

								//if it has two special characters, increase strength value
								if (password.length > 12
										&& password
												.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/))
									strength += 1;

								//now we have calculated strength value, we can return messages

								//if value is less than 2
								if (strength < 2) {
									$("#password")
											.after(
													'<span id="info" class="text-warning">Heikko</span>');
									return 'Heikko';
								} else if (strength == 2) {
									$("#password")
											.after(
													'<span id="info" class="text-success">Hyv�</span>');
									return 'Hyv�';
								} else {
									$("#password")
											.after(
													'<span id="info" class="text-info">Vahva</span>');
									return 'Vahva';
								}
							}
						});
	</script>
</body>
</html>