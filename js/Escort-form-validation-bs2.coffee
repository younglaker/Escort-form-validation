( ($) ->

	$.fn.EscortForm = (options) ->
		opts = $.extend {}, $.fn.EscortForm.options, options
		selector = "input, textarea, select"

		form = @

		form.find(selector).parent().append "<span class='help-inline tip-red es-tips'>aaa</span>"

		form.submit ->
			qualified = true
			reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/

			form.find(selector).each ->
				if $(@).attr("esRequired") == "true"
					if @value == ""
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_required)
					else
						$(@).parent().find(".es-tips").html("")

			console.log "2"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esNum") == "true"
					if isNaN(@value) == true
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_num)
					else
						$(@).parent().find(".es-tips").html("")

			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMax")
					if @value > $(@).attr("esMax")
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_max + $(@).attr("esMax") )
					else
						$(@).parent().find(".es-tips").html("")
			console.log "3"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMin")
					if @value < $(@).attr("esMin")
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_min + $(@).attr("esMin"))
					else
						$(@).parent().find(".es-tips").html("")
						
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esEmail") == "true"
					mail = reg_email.test(@value);
					if not mail
						qualified = false
						$.fn.EscortForm.tips(@, opts.tip_email)
					else
						$(@).parent().find(".es-tips").html("")

			if qualified isnt true
				return false

	$.fn.EscortForm.tips = (s, text) ->
		$(s).parent().find(".es-tips").html(text)

	$.fn.EscortForm.options =
		tip_required: "Required here"
		tip_num: "Please enter a number"
		tip_max: "Can't lager than "
		tip_min: "Can't smaller than "
		tip_email: "Please enter correct email"

	return true

) jQuery