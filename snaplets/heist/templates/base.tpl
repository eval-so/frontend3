<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>  <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>  <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><pagetitle /> :: Eval.so</title>

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:300,400,700|Delius">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/7.4/styles/solarized_light.min.css">

    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/7.4/highlight.min.js"></script>
    <script src="/static/js/global.js"></script>

    <pageassets />

    <!-- Order here actually matters. Put .less files above less.min.js. -->
    <link rel="stylesheet/less" type="text/css" href="/static/main.less" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/1.5.0/less.min.js"></script>
    <!-- /order mattering. -->

    <script>
      document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/,'js');
      $(function() { hljs.initHighlightingOnLoad(); });
    </script>
  </head>
  <body>
    <header>
      <nav class="evalso-navbar" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar" />
              <span class="icon-bar" />
              <span class="icon-bar" />
            </button>
            <a class="navbar-brand" href="/">Eval.so</a>
          </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="/docs">API Documentation</a></li>
              <li><a href="/try">Try out the API</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <apply-content/>

    <!--[if lt IE 7 ]>
      <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
      <script>
        window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})
      </script>
    <![endif]-->
  </body>
</html>
