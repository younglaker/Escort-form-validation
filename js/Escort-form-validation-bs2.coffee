	$ = jQuery
	$.fn.EscortForm = () ->
		selector = "input, textarea, select"

		form = @

		form.find(selector).parent().append("<span class='help-inline tip-red oct-tips'>aaa</span>")

		form.submit ->
			qualified = true
			reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/

			form.find(selector).each ->
				if $(@).attr("esRequired") == "true"
					console.log @value
					if @value == ""
						$(@).parent().find(".oct-tips").html("请填写")
						qualified = false
					else
						$(@).parent().find(".oct-tips").html("")
						console.log "662"+qualified

			console.log "2"+qualified
			if qualified isnt true
				return false

			console.log "55"

			form.find(selector).each ->
				if $(@).attr("octmax")
					if @value > $(@).attr("octmax")
						$(this).parent().find(".oct-tips").html("太大了")
						qualified = false

			console.log "3"+qualified
			if qualified isnt true
				return false

