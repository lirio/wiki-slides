[#ftl]
<!doctype html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title>Simple Wiki Slides Engine</title>
  <link rel="stylesheet/less" href="/css/main.less"/>
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
  <script type="text/javascript" src="/js/jquery.js">
  </script>
  <script type="text/javascript" src="/js/jquery.tools.js">
  </script>
  <script type="text/javascript" src="/js/less.js">
  </script>
</head>
<body>
<nav id="main-nav">
  <ul>
    <li [#if uri?length > 1]class="active"[/#if]>
      <a href="/index.html">Workshop</a>
    </li>
    <li [#if uri?length <= 1]class="active"[/#if]>
      <a href="/">Slideshow</a>
    </li>
  </ul>
</nav>
<div id="content">
${content}
</div>
</body>
</html>





