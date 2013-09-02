( ($) ->

	$.fn.EscortForm = (options) ->
		opts = $.extend {}, $.fn.EscortForm.options, options
		selector = "input, textarea, select"

		form = @

		form.find(selector).parent().append "<span class='help-inline tip-red es-tips'>aaa</span>"

		form.submit ->
			qualified = true

			form.find(selector).each ->
				if $(@).attr("esRequired") == "true"
					if @value == ""
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_required)
					else
						$.fn.EscortForm.tips(@, "")

			console.log "2"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMatch")
					name = $(@).attr("esMatch")
					val = @value
					t = @
					form.find('[name='+name+']').each ->
						if @value isnt val
							qualified = false
							$.fn.EscortForm.tips(t, opts.tip_mat)

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esNum") == "true"
					if isNaN(@value) == true
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_num)
					else
						$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMax")
					if @value > $(@).attr("esMax")
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_max + $(@).attr("esMax") )
					else
						$.fn.EscortForm.tips(@, "")
			console.log "3"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMin")
					if @value < $(@).attr("esMin")
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_min + $(@).attr("esMin"))
					else
						$.fn.EscortForm.tips(@, "")
						
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMaxLen")
					if @value.length > $(@).attr("esMaxLen")	
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_maxlen + $(@).attr("esMaxLen"))
					else
						$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMinLen")
					if @value.length < $(@).attr("esMinLen")	
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_minlen + $(@).attr("esMinLen"))
					else
						$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esEmail") == "true"
					reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
					mail = reg_email.test(@value)
					if not mail
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_email)
					else
						$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esRegex")
					reg = new RegExp($(@).attr("esRegex"))
					test = reg.test(@value)
					if not test
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_regex + $(@).attr("esRegex"))
					else
						$.fn.EscortForm.tips(@, "")

			if qualified isnt true
				return false

	$.fn.EscortForm.tips = (s, text) ->
		$(s).parent().find(".es-tips").html(text)

	$.fn.EscortForm.options =
		tip_required: "Required here"
		tip_mat: "Can't match last input"
		tip_num: "Please enter a number"
		tip_max: "Can't lager than "
		tip_min: "Can't smaller than "
		tip_maxlen: "Can't longer than "
		tip_minlen: "Can't shorter than "
		tip_email: "Please enter correct email"
		tip_regex: "Not match the regex "

	return true

) jQuery