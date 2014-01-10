<apply template="base">
  <bind tag="pagetitle">List of Languages</bind>
  <bind tag="pageassets">
  </bind>

  <div class="container">
    <div class="col-md-8 col-md-offset-2 evalso-top">
      <h2>Here is a list of</h2>
      <h1>Languages We Support</h1>
      <hr />
    </div>

    <languages>
      <div class="col-md-8 col-md-offset-2">
        <div class="clearfix pad10bottom">
          <h1 class="pull-left"><displayName /></h1>
          <h2 class="pull-right"><code><apiName /></code></h2>
        </div>
        <div class="clearfix table-responsive">
          <table class="table">
            <tr>
              <td>Main code filename:</td>
              <td><codeFilename /></td>
            </tr>

            <tr>
              <td>Compilation command:</td>
              <td><compileCommand /></td>
            </tr>

            <tr>
              <td>Compilation timeout:</td>
              <td><compileTimeout /></td>
            </tr>

            <tr>
              <td>Execution command:</td>
              <td><runCommand /></td>
            </tr>

            <tr>
              <td>Execution timeout:</td>
              <td><runTimeout /></td>
            </tr>

            <tr>
              <td>Codemirror highlighter:</td>
              <td><codemirror /></td>
            </tr>

            <tr>
              <td>RPM:</td>
              <td><rpm-nvr /></td>
            </tr>
          </table>
        </div>
        <hr class="blue" />
      </div>
    </languages>
  </div>
</apply>
