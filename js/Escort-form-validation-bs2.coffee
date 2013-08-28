	octForm = (f) ->
		form = $(f)

		form.find("input, textarea, select").parent().append("<span class='help-inline tip-red oct-tips'>aaa</span>")

		form.submit ->
			qualified = true
			reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/

			form.find(".oct-required").each -> 
        if @value == ""
          $(this).parent().find(".oct-tips").html("请填写")
          qualified = false
        else
          $(this).parent().find(".oct-tips").html("")
			
			if qualified isnt true
				return false

			form.find(".oct-email").each -> 
				mail = reg_email.test(this.value)
				if mail isnt true
          $(this).parent().find(".oct-tips").html("请填写正确邮箱")
          qualified = false
        else
          $(this).parent().find(".oct-tips").html("")
			
			if qualified isnt true
				return false

			form.find(".oct-positivel").each -> 
				val = @value
				if isNaN(val) isnt NaN
					if val <= 0
	          $(this).parent().find(".oct-tips").html("请填写正数")
	          qualified = false
	        else
          	$(this).parent().find(".oct-tips").html("")
				else
					$(this).parent().find(".oct-tips").html("请填写正数")
					qualified = false
			
			if qualified isnt true
				return false