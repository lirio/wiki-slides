[#ftl]

[#assign content]
<div class="slide">
  <div class="content-output">
    <h1>${(slide.title)!"New slide"}</h1>
    <form method="post" action="${uri}">
      <dl>
        <dd>
          <textarea id="c"
                    name="c"
                    cols="80"
                    rows="16">${(slide.source)!}</textarea>
        </dd>
      </dl>
      <div class="submits">
        <input type="submit" value="Save"/>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
  $(function() {
    $("#c").focus();
  })
</script>
[/#assign]

[#include "/layout.ftl"/]