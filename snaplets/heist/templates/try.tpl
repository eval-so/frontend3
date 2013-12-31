<apply template="base">
  <bind tag="pagetitle">Try in your browser</bind>
  <bind tag="pageassets">
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/addon/mode/loadmode.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.min.css">

    <cm-map />

    <script src="/static/js/try.js"></script>
  </bind>

  <div class="container">
    <div class="col-md-8 col-md-offset-2 evalso-top">
      <h2>See for yourself</h2>
      <h1>How the API Responds</h1>
      <hr />
    </div>
    <div class="col-md-6 sample">
      <h3 class="center">Input (source code)</h3>
      <form>
        <div class="form-group">
          <textarea id="code" name="code">puts "Hello world!"</textarea>
        </div>
        <div class="form-group">
          <textarea id="stdin" name="stdin"></textarea>
        </div>

        <select id="language" name="language">
          <languages>
            <option value="${apiname}"><displayname /></option>
          </languages>
        </select>
      </form>

      <!-- Outside of the form because we want to submit as ajax only. -->
      <button id="submit" value="submit" class="btn btn-success">Evaluate</button>

    </div>

    <div class="col-md-6 sample">
      <h3 class="center">Output (JSON)</h3>
      <pre><code id="output"></code></pre>
    </div>
  </div>
</apply>
