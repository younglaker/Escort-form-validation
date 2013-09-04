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

			$(ele.required).each ->
				val = $.fn.EscortForm.trim @value
				if val == ""
					# $.fn.EscortForm.tipBox @
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_required)

			if qualified isnt true
				return false

			$(ele.match).each ->
				name = $(@).attr("esMatch")
				val = @value
				t = @
				form.find('[name='+name+']').each ->
					if @value isnt val
						qualified = false
						$.fn.EscortForm.tips(t, opts.tip_mat)

			if qualified isnt true
				return false

			$(ele.num).each ->
				if isNaN(@value) == true
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_num)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			$(ele.max).each ->
				if @value > $(@).attr("esMax")
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_max)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			$(ele.min).each ->
				if @value < $(@).attr("esMin")
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_min)
				else
					$.fn.EscortForm.tips(@, "")
						
			if qualified isnt true
				return false

			$(ele.maxlen).each ->
				if @value.length > $(@).attr("esMaxLen")	
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_maxlen)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			$(ele.minlen).each ->
				if @value.length < $(@).attr("esMinLen")	
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_minlen)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			$(ele.email).each ->
				reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
				mail = reg_email.test(@value)
				if not mail
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_email)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			$(ele.regex).each ->
				reg = new RegExp($(@).attr("esRegex"))
				test = reg.test(@value)
				if not test
					qualified = false
					$.fn.EscortForm.tips(@, opts.tip_regex)
				else
					$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

	$.fn.EscortForm.tips = (ele, text) ->
		$(ele).closest(".controls").find("span").remove(".es-tips")
		$(ele).closest(".controls").append "<span class='help-inline tip-red es-tips'>aaa</span>"
		$(ele).closest(".controls").find(".es-tips").html(text)

	$.fn.EscortForm.trim = (str) ->
		if (String.prototype.trim)
			return str.trim()
		else
			return str.replace(/^\s+|\s+$/g, "")

	$.fn.EscortForm.options =
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