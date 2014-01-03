<apply template="base">
  <bind tag="pagetitle">API Documentation</bind>
  <bind tag="pageassets">
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/addon/mode/loadmode.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.min.css">
    <script src="/static/js/api_evaluate.js"></script>
    <script src="/static/js/api_docs.js"></script>
  </bind>

  <div id="api_docs" class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2 evalso-top">
        <h2>Read on to learn</h2>
        <h1>How the API Works</h1>
        <hr />
      </div>
    </div>

    <div class="row example" id="intro">
      <div class="col-md-10 col-md-offset-1">
        <h2 class="pad40 nopadtop">Quick Introduction</h2>
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
        <p>
          Let's take a look at how simple the API is. This document is
          interactive and allows you to try out the API without leaving this
          page.
        </p>
        <p>
          We'll use Ruby and Bash for these examples, but keep in mind that the
          API is language-agnostic and works with many other languages.
        </p>
        <p>
          Let's get started with the simplest form of evaluation.
        </p>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Request</h3>
          <textarea class="cm">{
  "language": "ruby",
  "code": "puts 2+2"
}</textarea>
          <!-- Outside of the form because we want to submit as ajax only. -->
          <button value="submit" class="submit btn btn-success">Evaluate</button>
        </div>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Response</h3>
          <pre><code></code></pre>
        </div>
      </div>
    </div> <!-- ./row -->

    <hr />

    <div class="row example" id="file_in">
      <div class="col-md-10 col-md-offset-1">
        <h2 class="pad40">File I/O</h2>
        <p>
          You can get files into and out of the API. To <strong>send</strong>
          files to the API, include them in the <code>inputFiles</code> key.
        </p>
        <p>
          The files should be base64-encoded prior to sending them to the API.
          This allows you to send binary data, such as images, to the API, which
          your code can then interact with.
        </p>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Request</h3>
          <textarea class="cm">{
  "language": "ruby",
  "inputFiles": {
    "my_file.txt": "aGVsbG8gd29ybGQ="
  },
  "code": "puts File.open('my_file.txt').read"
}</textarea>
          <!-- Outside of the form because we want to submit as ajax only. -->
          <button value="submit" class="submit btn btn-success">Evaluate</button>
        </div>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Response</h3>
          <pre><code></code></pre>
        </div>
      </div>
    </div> <!-- ./row -->

    <div class="row example" id="file_out">
      <div class="col-md-10 col-md-offset-1">
        <p>
          You can also get files out of the sandbox. They, too, will be
          base64-encoded, so that if your program generates a binary file, such
          as an image or compressed data, we can easily get it to you.
        </p>
        <p>
          Simply drop them into <code>./output/run/</code> and they will
          automatically be encoded and sent back to you in the API response.
        </p>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Request</h3>
          <textarea class="cm">{
  "language": "bash",
  "code": "echo 'hello' | gzip > output/run/my_file.gz"
}</textarea>
          <!-- Outside of the form because we want to submit as ajax only. -->
          <button value="submit" class="submit btn btn-success">Evaluate</button>
        </div>
        <div class="col-lg-6">
          <h3 class="center pad10">Example Response</h3>
          <pre><code></code></pre>
        </div>
      </div>
    </div> <!-- ./row -->
  </div>
</apply>
