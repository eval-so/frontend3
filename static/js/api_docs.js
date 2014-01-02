$(function() {
    $(".example").each(function(i, e) {
        CodeMirror.modeURL = "//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/%N/%N.js";

        var cm = $(e).find(".cm");

        var editor = CodeMirror.fromTextArea(cm[0], {
            lineNumbers: true,
            mode: {name: "javascript", json: true},
            viewportMargin: Infinity
        });

        CodeMirror.autoLoadMode(editor, "javascript");

        $(e).find("button").click(function() {
            var response = $(e).find("pre code");
            eval_code(JSON.stringify(JSON.parse(editor.getValue())), response);
        });
    });
});
