var $event=$.event,$special,resizeTimeout;$special=$event.special.debouncedresize={setup:function(){$(this).on("resize",$special.handler)},teardown:function(){$(this).off("resize",$special.handler)},handler:function(e,i){var t=this,n=arguments,s=function(){e.type="debouncedresize",$event.dispatch.apply(t,n)};resizeTimeout&&clearTimeout(resizeTimeout),i?s():resizeTimeout=setTimeout(s,$special.threshold)},threshold:250};var BLANK="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";$.fn.imagesLoaded=function(e){function i(){var i=$(o),t=$(d);s&&(d.length?s.reject(r,i,t):s.resolve(r)),$.isFunction(e)&&e.call(n,r,i,t)}function t(e,t){e.src!==BLANK&&-1===$.inArray(e,h)&&(h.push(e),t?d.push(e):o.push(e),$.data(e,"imagesLoaded",{isBroken:t,src:e.src}),a&&s.notifyWith($(e),[t,r,$(o),$(d)]),r.length===h.length&&(setTimeout(i),r.unbind(".imagesLoaded")))}var n=this,s=$.isFunction($.Deferred)?$.Deferred():0,a=$.isFunction(s.notify),r=n.find("img").add(n.filter("img")),h=[],o=[],d=[];return $.isPlainObject(e)&&$.each(e,function(i,t){"callback"===i?e=t:s&&s[i](t)}),r.length?r.bind("load.imagesLoaded error.imagesLoaded",function(e){t(e.target,"error"===e.type)}).each(function(e,i){var n=i.src,s=$.data(i,"imagesLoaded");return s&&s.src===n?void t(i,s.isBroken):i.complete&&void 0!==i.naturalWidth?void t(i,0===i.naturalWidth||0===i.naturalHeight):void((i.readyState||i.complete)&&(i.src=BLANK,i.src=n))}):i(),s?s.promise(n):n};var ExpandPreview=function(){function e(e){x=$.extend(!0,{},x,e),c.imagesLoaded(function(){t(!0),a(),n()})}function i(e){l=l.add(e),e.each(function(){var e=$(this);e.data({offsetTop:e.offset().top,height:e.height()})}),s(e)}function t(e){l.each(function(){var i=$(this);i.data("offsetTop",i.offset().top),e&&i.data("height",i.height())})}function n(){s(l),v.on("debouncedresize",function(){g=0,f=-1,t(),a();var e=$.data(this,"preview");"undefined"!=typeof e&&h()})}function s(e){e.on("click","span.preview-close",function(){return h(),!1}).children("a").on("click",function(){var e=$(this).parent();return p===e.index()?h():r(e),!1})}function a(){d={width:v.width(),height:v.height()}}function r(e){var i=$.data(this,"preview"),t=e.data("offsetTop");if(g=0,"undefined"!=typeof i){if(f===t)return i.update(e),!1;t>f&&(g=i.height),h()}f=t,i=$.data(this,"preview",new o(e)),i.open()}function h(){p=-1;var e=$.data(this,"preview");e.close(),$.removeData(this,"preview")}function o(e){this.$item=e,this.expandedIdx=this.$item.index(),this.create(),this.update()}var d,c=$("#preview-grid"),l=c.children("li"),p=-1,f=-1,g=0,u=10,v=$(window),m=$("html, body"),w={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd",msTransition:"MSTransitionEnd",transition:"transitionend"},A=w[Modernizr.prefixed("transition")],T=Modernizr.csstransitions,x={minHeight:500,speed:350,easing:"ease"};return o.prototype={create:function(){this.$title=$("<h3></h3>"),this.$description=$("<p></p>"),this.$href=$('<a href="#">Visit website</a>'),this.$details=$('<div class="preview-details"></div>').append(this.$title,this.$description,this.$href),this.$loading=$('<div class="preview-loading"></div>'),this.$fullimage=$('<div class="preview-fullimg"></div>').append(this.$loading),this.$closePreview=$('<span class="preview-close"></span>'),this.$previewInner=$('<div class="preview-expander-inner"></div>').append(this.$closePreview,this.$fullimage,this.$details),this.$previewEl=$('<div class="preview-expander"></div>').append(this.$previewInner),this.$item.append(this.getEl()),T&&this.setTransition()},update:function(e){if(e&&(this.$item=e),-1!==p){var i=l.eq(p);i.removeClass("preview-expanded"),this.$item.addClass("preview-expanded"),this.positionPreview()}p=this.$item.index();var t=this.$item.children("a"),n={href:t.attr("href"),largesrc:t.data("largesrc"),title:t.data("title"),description:t.data("description")};this.$title.html(n.title),this.$description.html(n.description),this.$href.attr("href",n.href);var s=this;"undefined"!=typeof s.$largeImg&&s.$largeImg.remove(),s.$fullimage.is(":visible")&&(this.$loading.show(),$("<img/>").load(function(){var e=$(this);e.attr("src")===s.$item.children("a").data("largesrc")&&(s.$loading.hide(),s.$fullimage.find("img").remove(),s.$largeImg=e.fadeIn(350),s.$fullimage.append(s.$largeImg))}).attr("src",n.largesrc))},open:function(){setTimeout($.proxy(function(){this.setHeights(),this.positionPreview()},this),25)},close:function(){var e=this,i=function(){T&&$(this).off(A),e.$item.removeClass("preview-expanded"),e.$previewEl.remove()};return setTimeout($.proxy(function(){"undefined"!=typeof this.$largeImg&&this.$largeImg.fadeOut("fast"),this.$previewEl.css("height",0);var e=l.eq(this.expandedIdx);e.css("height",e.data("height")).on(A,i),T||i.call()},this),25),!1},calcHeight:function(){var e=d.height-this.$item.data("height")-u,i=d.height;e<x.minHeight&&(e=x.minHeight,i=x.minHeight+this.$item.data("height")+u),this.height=e,this.itemHeight=i},setHeights:function(){var e=this,i=function(){T&&e.$item.off(A),e.$item.addClass("preview-expanded")};this.calcHeight(),this.$previewEl.css("height",this.height),this.$item.css("height",this.itemHeight).on(A,i),T||i.call()},positionPreview:function(){var e=this.$item.data("offsetTop"),i=this.$previewEl.offset().top-g,t=this.height+this.$item.data("height")+u<=d.height?e:this.height<d.height?i-(d.height-this.height):i;m.animate({scrollTop:t},x.speed)},setTransition:function(){this.$previewEl.css("transition","height "+x.speed+"ms "+x.easing),this.$item.css("transition","height "+x.speed+"ms "+x.easing)},getEl:function(){return this.$previewEl}},{init:e,addItems:i}}();$(function(){ExpandPreview.init()});