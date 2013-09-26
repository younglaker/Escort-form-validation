( ($) ->

	$.fn.EscortForm = (options) ->
		opts = $.extend {}, $.fn.EscortForm.options, options
		selector = "input, textarea, select"

		form = @


		form.submit ->
			qualified = true
			
			form.find("span").remove(".es-tips")

			ele =
				required: []
				match: []
				num: []
				max: []
				min: []
				maxlen: []
				minlen: []
				email: []
				regex: []

			form.find(selector).each ->
				if $(@).attr("esRequired") == "true"
					ele.required.push(@)
				if $(@).attr("esMatch")
					ele.match.push(@)
				if $(@).attr("esNum") == "true"
					ele.num.push(@)
				if $(@).attr("esMax")
					ele.max.push(@)
				if $(@).attr("esMin")
					ele.min.push(@)
				if $(@).attr("esMaxLen")
					ele.maxlen.push(@)
				if $(@).attr("esMinLen")
					ele.minlen.push(@)
				if $(@).attr("esEmail") == "true"
					ele.email.push(@)
				if $(@).attr("esRegex")
					ele.regex.push(@)

			if opts.version == 2
				addTip = $.fn.EscortForm.tips2
			else if  opts.version == 3
				addTip = $.fn.EscortForm.tips3

			# Check required
			$(ele.required).each ->
				val = $.fn.EscortForm.trim @value
				if val == ""
					qualified = false
					addTip(@, opts.tip_required)

			if qualified isnt true
				return false

			# Check match
			$(ele.match).each ->
				name = $(@).attr("esMatch")
				val = @value
				t = @
				form.find('[name='+name+']').each ->
					if @value isnt val
						qualified = false
						addTip(t, opts.tip_mat)

			if qualified isnt true
				return false

			# Check num
			$(ele.num).each ->
				if isNaN(@value) == true
					qualified = false
					addTip(@, opts.tip_num)

			if qualified isnt true
				return false

			# Check max
			$(ele.max).each ->
				if @value > $(@).attr("esMax")
					qualified = false
					attr = $(@).attr("esMax")
					opts.tip_max = $.fn.EscortForm.tipCheck(opts.tip_max, attr)
					addTip(@, opts.tip_max)

			if qualified isnt true
				return false

			# Check min
			$(ele.min).each ->
				if @value < $(@).attr("esMin")
					qualified = false
					attr = $(@).attr("esMin")
					opts.tip_min = $.fn.EscortForm.tipCheck(opts.tip_min, attr)
					addTip(@, opts.tip_min)
						
			if qualified isnt true
				return false

			# Check maxlen
			$(ele.maxlen).each ->
				if @value.length > $(@).attr("esMaxLen")	
					qualified = false
					attr = $(@).attr("esMaxLen")
					opts.tip_maxlen = $.fn.EscortForm.tipCheck(opts.tip_maxlen, attr)
					addTip(@, opts.tip_maxlen)

			if qualified isnt true
				return false

			# Check minlen
			$(ele.minlen).each ->
				if @value.length < $(@).attr("esMinLen")	
					qualified = false
					attr = $(@).attr("esMinLen")
					opts.tip_minlen = $.fn.EscortForm.tipCheck(opts.tip_minlen, attr)
					addTip(@, opts.tip_minlen)

			if qualified isnt true
				return false

			# Check email
			$(ele.email).each ->
				reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
				mail = reg_email.test(@value)
				if not mail
					qualified = false
					addTip(@, opts.tip_email)

			if qualified isnt true
				return false

			# Check regex
			$(ele.regex).each ->
				reg = new RegExp($(@).attr("esRegex"))
				test = reg.test(@value)
				if not test
					qualified = false
					attr = $(@).attr("esRegex")
					opts.tip_regex = $.fn.EscortForm.tipCheck(opts.tip_regex, attr)
					addTip(@, opts.tip_regex)

			if qualified isnt true
				return false

	$.fn.EscortForm.tipCheck = (tip, attr) ->
		if tip.match /_attr_/
			return tip.replace(/_attr_/, attr)
		else
			return tip

	$.fn.EscortForm.tips2 = (ele, text) ->
		$(ele).closest(".controls").find("span").remove(".es-tips")
		$(ele).closest(".controls").append "<span class='help-inline tip-red es-tips'>aaa</span>"
		$(ele).closest(".controls").find(".es-tips").html(text)

	$.fn.EscortForm.tips3 = (ele, text) ->
		$(ele).closest(".form-group").find("span").remove(".es-tips")
		$(ele).closest(".form-group").append "<span class='help-inline tip-red es-tips'>aaa</span>"
		$(ele).closest(".form-group").find(".es-tips").html(text)

	$.fn.EscortForm.trim = (str) ->
		if (String.prototype.trim)
			return str.trim()
		else
			return str.replace(/^\s+|\s+$/g, "")

	$.fn.EscortForm.options =
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

	return true

) jQuery