[#ftl]
[#assign content]

<div class="shower">
  <section  id="Cover" class="slide cover back">
    <article>
    </article>
    <!--<img src="/public/img/cover.png" alt="">-->
  </section>

  [#list slides as s]
    <section class="slide" id=${s.id}>
      <article>
      ${s.content}
      </article>
    </section>
  [/#list]
  <div class="progress"><div></div></div>
</div>
<script src="/public/js/script.js"></script>

[/#assign]

[#include "/layout.ftl"]

