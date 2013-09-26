## About
A javascript validation plugin, now it is base on jquery and work on bootstrap2/3.  
Repos: [https://github.com/younglaker/Escort-form-validation](https://github.com/younglaker/Escort-form-validation)

## Usage

- Js

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/Escort-form-validation-bs.js"></script>
		<script type="text/javascript">
			$(FormDom).EscortForm();
		</script>

- HTML structure

	- Bootstrap 2:

			<form>
				<div class="control-group">
					<label></label>
					<div class="controls"> // ".controls" is must
						<input esApiName="value">
					</div>
				</div>
			</form>

	- Bootstrap 3:

			<form role="form">
				<div class="form-group"> // ".form-group" is must
					<label></label>
					<input esApiName="value">
				</div>
			</form>

- HTML attribute

	- esRequired = "true"

			<input esRequired="true">

	- esMatch = a input name

			<input name="test">
			<input esMatch="test">

	- esNum = "true"

			<input esNum="true">

	- esMax = number

			<input esMax="50">

	- esMin = number

			<input esMin="10">

	- esMaxLen = number

			<input esMaxLen="30">

	- esMinLen = number

			<input esMinLen="6">

	- esEmail = "true"

			<input esEmail="true">

	- esRegex = a regexp, no "/ /" wrapped

			<input esRegex="^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$">

## Customising
You can custom the bootstrap version and prompt tips.

- Defult bootstrap version and tips

		version: 3
		tip_required: "Required here"
		tip_mat: "Can't match last input"
		tip_num: "Please enter a number"
		tip_max: "Too large"
		tip_min: "Too small"
		tip_maxlen: "Too long"
		tip_minlen: "Too short"
		tip_email: "Please enter correct email"
		tip_regex: "Not match the regex"

- Customising

		var attr = "_attr_"		// "_attr_" stands for the value in html attribute you set
		$("#realse-form").EscortForm({
			version: 2,
			tip_required: "Please fill this.",
			tip_min: "Lager than " + attr + ", please.",
			tip_regex: "Not match " + attr
		});

## Changelog:

### Version 1.1 (2013.09.25)
- Suport bootstrap 3.0.0

### Version 1.0 (2013.09.04)

- Base on jquery.
- Can check required, match for some input,  number, max, min, max length, min length, email, user-defined regex for bootstrap 2.3.X.
- Support input, textarea, select tags.
