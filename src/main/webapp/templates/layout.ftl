[#ftl]
<!doctype html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title>Simple Wiki Slides Engine</title>
  <link rel="stylesheet/less" href="/css/main.less"/>
  <script type="text/javascript" src="/js/jquery.js">
  </script>
  <script type="text/javascript" src="/js/jquery.tools.js">
  </script>
  <script type="text/javascript" src="/js/less.js">
  </script>
</head>
<body>
<ul id="main-nav">
  <li [#if uri?length > 1]class="active"[/#if]>
    <a href="/index.html">Workshop</a>
  </li>
  <li [#if uri?length <= 1]class="active"[/#if]>
    <a href="/">Slideshow</a>
  </li>
</ul>
<div id="content">
${content}
</div>
</body>
</html>





