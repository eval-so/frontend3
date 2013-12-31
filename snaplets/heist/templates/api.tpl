<apply template="base">
  <bind tag="pagetitle">API Documentation</bind>
  <bind tag="pageassets">
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/addon/mode/loadmode.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.min.css">
  </bind>

  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2 evalso-top">
        <h2>Read on to learn</h2>
        <h1>How the API Works</h1>
        <hr />
      </div>
    </div>

    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <h2 class="pad40 nopadtop">Evaluating Code</h2>
        <p>
          Evaluating code with the API is very straightforward. As of right now,
          the API is in indefinite beta stage and does not require any form of
          authentication. This may change in the future, although the change will
          be announced well in advance.
        </p>
        <p>
          This means that to use the API, all you need to do is send a
          <strong>POST</strong> request to the <code>/api/evaluate</code>
          endpoint.
        </p>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Request</h3>
          <textarea id="code" name="code">puts "Hello world!"</textarea>
          <pre><code>{
  "language": "ruby",
  "code": "puts 2+2",
}</code></pre>
        </div>
      </div>
    </div>
  </div>

  <strong>This page is obviously under construction.</strong>
</apply>
