[#ftl]

[#assign content]
<div id="slides-refs">
${slide.html}
</div>

<ul id="slides-nav">
</ul>
<div id="scrollable">
  <div id="slides">
  </div>
</div>
<script type="text/javascript">
  $(function() {
    $("#slides-refs li").each(function() {
      var li = $(this);
      // preload slides
      var slide = $("<div/>");
      slide.attr("class", li.attr("class"));
      slide.addClass("slide");
      slide.append("<div class='loading'/>");
      $("#slides").append(slide);
      var href = $("a", li).attr("href");
      $.get(href, {}, function(data){
        slide.empty();
        slide.append(data);
      }, "html");
      // add navigation
      var index = li.index() + 1;
      slide.attr("id", index);
      $("<li><a href='#" + index + "'>•</a></li>").appendTo($("#slides-nav"));
    });
    // init scrollables
    $("#scrollable")
        .scrollable({items: "#slides"})
        .navigator({navi: "#slides-nav"})
        .bind("onBeforeSeek", function() {
      $("#scrollable *").stop(true, true);
    });
    $("#slides-nav li:first").addClass("active");
  });
</script>
[/#assign]

[#include "/layout.ftl"]

