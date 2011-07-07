[#ftl]

[#assign content]
<div class="slide">
  <div class="content-output">
  ${slide.html}
  </div>
  <div class="edit-ref">[<a href="${uri}.e">Edit</a>]</div>
</div>
[/#assign]

[#include "/layout.ftl"/]