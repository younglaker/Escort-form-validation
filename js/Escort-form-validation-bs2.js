// Generated by CoffeeScript 1.6.3
(function($) {
  $.fn.EscortForm = function(options) {
    var form, opts, selector;
    opts = $.extend({}, $.fn.EscortForm.options, options);
    selector = "input, textarea, select";
    form = this;
    form.find(selector).closest(".controls").append("<span class='help-inline tip-red es-tips'>aaa</span>");
    return form.submit(function() {
      var qualified;
      qualified = true;
      form.find(selector).each(function() {
        if ($(this).attr("esRequired") === "true") {
          if (this.value === "") {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_required);
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      console.log("2" + qualified);
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        var name, t, val;
        if ($(this).attr("esMatch")) {
          name = $(this).attr("esMatch");
          val = this.value;
          t = this;
          return form.find('[name=' + name + ']').each(function() {
            if (this.value !== val) {
              qualified = false;
              return $.fn.EscortForm.tips(t, opts.tip_mat);
            }
          });
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        if ($(this).attr("esNum") === "true") {
          if (isNaN(this.value) === true) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_num);
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        if ($(this).attr("esMax")) {
          if (this.value > $(this).attr("esMax")) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_max + $(this).attr("esMax"));
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      console.log("3" + qualified);
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        if ($(this).attr("esMin")) {
          if (this.value < $(this).attr("esMin")) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_min + $(this).attr("esMin"));
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        if ($(this).attr("esMaxLen")) {
          if (this.value.length > $(this).attr("esMaxLen")) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_maxlen + $(this).attr("esMaxLen"));
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        if ($(this).attr("esMinLen")) {
          if (this.value.length < $(this).attr("esMinLen")) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_minlen + $(this).attr("esMinLen"));
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        var mail, reg_email;
        if ($(this).attr("esEmail") === "true") {
          reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
          mail = reg_email.test(this.value);
          if (!mail) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_email);
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
      form.find(selector).each(function() {
        var reg, test;
        if ($(this).attr("esRegex")) {
          reg = new RegExp($(this).attr("esRegex"));
          test = reg.test(this.value);
          if (!test) {
            qualified = false;
            return $.fn.EscortForm.tips(this, opts.tip_regex + $(this).attr("esRegex"));
          } else {
            return $.fn.EscortForm.tips(this, "");
          }
        }
      });
      if (qualified !== true) {
        return false;
      }
    });
  };
  $.fn.EscortForm.tips = function(s, text) {
    return $(s).parent().find(".es-tips").html(text);
  };
  $.fn.EscortForm.options = {
    tip_required: "Required here",
    tip_mat: "Can't match last input",
    tip_num: "Please enter a number",
    tip_max: "Can't lager than ",
    tip_min: "Can't smaller than ",
    tip_maxlen: "Can't longer than ",
    tip_minlen: "Can't shorter than ",
    tip_email: "Please enter correct email",
    tip_regex: "Not match the regex "
  };
  return true;
})(jQuery);
