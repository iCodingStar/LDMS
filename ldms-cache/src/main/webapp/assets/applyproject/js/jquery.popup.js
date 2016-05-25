(function($) {
  $.fn.simplePopup = function(event) {
    var simplePopup = {
      settings: {
        hashtag: "#/",
        url: "popup",
        event: event || "click"
      },
      initialize: function(link) {
        var popup = $(".js__popup");
        var body = $(".js__p_body");
        var close = $(".js__p_close");
        var routePopup = simplePopup.settings.hashtag + simplePopup.settings.url;

        var cssClasses = link[0].className;

        if (cssClasses.indexOf(" ") >= 0) {
          cssClasses = cssClasses.split(" ");

          for (key in cssClasses) {
            if (cssClasses[key].indexOf("js__p_") === 0) {
              cssClasses = cssClasses[key]
            }
          };
        }

        var name = cssClasses.replace("js__p_", "");

        // We redefine the variables if there is an additional popap
        if (name !== "start") {
          name = name.replace("_start", "_popup");
          popup = $(".js__" + name);
          routePopup = simplePopup.settings.hashtag + name;
        };

        link.on(simplePopup.settings.event, function() {
          simplePopup.show(popup, body, routePopup);
          return false;
        });

        $(window).on("load", function() {
          simplePopup.hash(popup, body, routePopup);
        });

        body.on("click", function() {
          simplePopup.hide(popup, body);
        });

        close.on("click", function() {
          simplePopup.hide(popup, body);
          return false;
        });

        $(window).keyup(function(e) {
          if (e.keyCode === 27) {
            simplePopup.hide(popup, body);
          }
        });
      },


      centering: function(popup) {
        var marginLeft = -popup.width()/2;
        return popup.css("margin-left", marginLeft);
      },

      show: function(popup, body, routePopup) {
        simplePopup.centering(popup);
        body.removeClass("js__fadeout");
        popup.removeClass("js__slide_top");
        location.hash = routePopup;
      },

      hide: function(popup, body) {
        popup.addClass("js__slide_top");
        body.addClass("js__fadeout");
        location.hash = simplePopup.settings.hashtag;
      },

      hash: function(popup, body, routePopup) {
        if (location.hash === routePopup) {
          simplePopup.show(popup, body, routePopup);
        }
      }
    };


    return this.each(function() {
      var link = $(this);
      simplePopup.initialize(link);
    });
  };
})(jQuery);