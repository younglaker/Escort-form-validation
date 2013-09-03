// Generated by CoffeeScript 1.6.3
(function($) {
  $.fn.EscortForm = function(options) {
    var form, opts, selector;
    opts = $.extend({}, $.fn.EscortForm.options, options);
    selector = "input, textarea, select";
    form = this;
    form.find(selector).closest(".controls").append("<span class='help-inline tip-red es-tips'></span>");
    return form.submit(function() {
      var ele, qualified;
      qualified = true;
      ele = {
        required: [],
        match: [],
        num: [],
        max: [],
        min: [],
        maxlen: [],
        minlen: [],
        email: [],
        regex: []
      };
      form.find(selector).each(function() {
        if ($(this).attr("esRequired") === "true") {
          ele.required.push(this);
        }
        if ($(this).attr("esMatch")) {
          ele.match.push(this);
        }
        if ($(this).attr("esNum") === "true") {
          ele.num.push(this);
        }
        if ($(this).attr("esMax")) {
          ele.max.push(this);
        }
        if ($(this).attr("esMin")) {
          ele.min.push(this);
        }
        if ($(this).attr("esMaxLen")) {
          ele.maxlen.push(this);
        }
        if ($(this).attr("esMinLen")) {
          ele.minlen.push(this);
        }
        if ($(this).attr("esEmail") === "true") {
          ele.email.push(this);
        }
        if ($(this).attr("esRegex")) {
          return ele.regex.push(this);
        }
      });
      $(ele.required).each(function() {
        if (this.value === "") {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_required);
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.match).each(function() {
        var name, t, val;
        name = $(this).attr("esMatch");
        val = this.value;
        t = this;
        return form.find('[name=' + name + ']').each(function() {
          if (this.value !== val) {
            qualified = false;
            return $.fn.EscortForm.tips(t, opts.tip_mat);
          }
        });
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.num).each(function() {
        if (isNaN(this.value) === true) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_num);
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.max).each(function() {
        if (this.value > $(this).attr("esMax")) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_max + $(this).attr("esMax"));
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.min).each(function() {
        if (this.value < $(this).attr("esMin")) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_min + $(this).attr("esMin"));
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.maxlen).each(function() {
        if (this.value.length > $(this).attr("esMaxLen")) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_maxlen + $(this).attr("esMaxLen"));
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.minlen).each(function() {
        if (this.value.length < $(this).attr("esMinLen")) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_minlen + $(this).attr("esMinLen"));
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.email).each(function() {
        var mail, reg_email;
        reg_email = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
        mail = reg_email.test(this.value);
        if (!mail) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_email);
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
      $(ele.regex).each(function() {
        var reg, test;
        reg = new RegExp($(this).attr("esRegex"));
        test = reg.test(this.value);
        if (!test) {
          qualified = false;
          return $.fn.EscortForm.tips(this, opts.tip_regex + $(this).attr("esRegex"));
        } else {
          return $.fn.EscortForm.tips(this, "");
        }
      });
      if (qualified !== true) {
        return false;
      }
    });
  };
  $.fn.EscortForm.tips = function(s, text) {
    return $(s).closest(".controls").find(".es-tips").html(text);
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
