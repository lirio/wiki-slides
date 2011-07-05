[#ftl]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title>${title}</title>
  <link rel="stylesheet" title="screen" href="/public/css/screen.css">
  <link rel="stylesheet" title="projection" disabled href="/public/css/projection.css">
  <link rel="stylesheet" title="projection" disabled href="/public/css/main.css">
</head>
<body>
<div id="outer">
  <div id="content">
  ${content}
  </div>
  <div id="footer">
    <span class="copyright">2011-${currentDate?string("yyyy")}</span> ©
    <a class="home" href="http://${headers['Host']!"localhost"}">
    ${headers['Host']!"localhost"}
    </a>
  </div>
</div>
</body>
</html>





