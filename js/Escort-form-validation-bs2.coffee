( ($) ->
	$.fn.EscortForm = (options) ->
		opts = $.extend {}, $.fn.EscortForm.options, options
		selector = "input, textarea, select"

		form = @

		form.find(selector).parent().append "<span class='help-inline tip-red oct-tips'>aaa</span>"

		form.submit ->
			qualified = true
			reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/

			form.find(selector).each ->
				if $(@).attr("esRequired") == "true"
					if @value == ""
						qualified = false
						$(@).parent().find(".oct-tips").html(opts.tip_required)
					else
						$(@).parent().find(".oct-tips").html("")

			console.log "2"+qualified
			if qualified isnt true
				return false

			form.find(selector).each ->
				if $(@).attr("esMax")
					if @value > $(@).attr("esMax")
						qualified = false
						$(this).parent().find(".oct-tips").html(opts.tip_max + $(@).attr("esMax"))
			console.log "3"+qualified
			if qualified isnt true
				return false

	$.fn.EscortForm.options =
		tip_required: "Required here"
		tip_max: "Can't lager than "
) jQuery		