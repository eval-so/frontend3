<apply template="base">

  <bind tag="pagetitle">Welcome</bind>
  <bind tag="pageassets"></bind>

  <div class="container">
    <div class="col-md-8 col-md-offset-2 evalso-top">
      <h2>Safely compile and/or run code using our</h2>
      <h1>Online Code Sandbox API</h1>
      <hr />
    </div>

    <div class="col-md-6 sample">
      <h3>Send us...</h3>
      <pre><code>{
  "language": "ruby",
  "code": "puts 2+2",
}</code></pre>
    </div>

    <div class="col-md-6 sample">
      <h3>And we'll return...</h3>
      <pre><code>{
  "compile": null,
  "outputFiles": {},
  "run": {
    "stdout": "4\n",
    "stderr": "",
    "walltime": 436,
    "exitcode": 0,
  },
}</code></pre>
    </div>
  </div>

  <div class="evalso-lotsalangs">
    <div class="container">
      <div class="col-md-4">
        <img src="/static/img/doge.png" />
      </div>
      <div class="col-md-8">
        <h1>Many languages. Wow.</h1>
        <p>
          We already support a lot of programming languages and we are adding
          more all the time. We love getting requests for new languages too, so
          if you want something that we don't yet support, let us know!
        </p>
      </div>
    </div>
  </div>
</apply>
