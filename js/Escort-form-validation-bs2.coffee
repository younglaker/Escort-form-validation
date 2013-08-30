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
						$(@).parent().find(".es-tips").html(opts.tip_required)
					else
						$(@).parent().find(".es-tips").html("")

			console.log "2"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMax")
					if @value > $(@).attr("esMax")
						qualified = false
						$(this).parent().find(".es-tips").html(opts.tip_max + $(@).attr("esMax"))
					else
						$(@).parent().find(".es-tips").html("")
			console.log "3"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMin")
					if @value < $(@).attr("esMin")
						qualified = false
						$(this).parent().find(".es-tips").html(opts.tip_min + $(@).attr("esMin"))
					else
						$(@).parent().find(".es-tips").html("")
						
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esEmail") == "true"
					mail = reg_email.test(this.value);
					if not mail
						qualified = false
						$(this).parent().find(".es-tips").html(opts.tip_email)
					else
						$(@).parent().find(".es-tips").html("")

			if qualified isnt true
				return false

	$.fn.EscortForm.options =
		tip_required: "Required here"
		tip_max: "Can't lager than "
		tip_min: "Can't smaller than "
		tip_email: "Please enter correct email"
) jQuery		