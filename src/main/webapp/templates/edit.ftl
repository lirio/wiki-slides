[#ftl]

[#assign content]
<form method="post" action="${uri}">
  <dl>
    <dt><label for="c">Slide markup</label></dt>
    <dd>
      <textarea id="c" name="c" cols="80" rows="16">${(slide.source)!}</textarea>
    </dd>
  </dl>
  <div class="submits">
    <input type="submit" value="Save"/>
  </div>
</form>
[/#assign]

[#include "/layout.ftl"/]