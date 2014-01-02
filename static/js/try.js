$(function() {
    CodeMirror.modeURL = "//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/%N/%N.js";

    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true
    });

    var language = $("#language");
    language.change(function() {
        change(language.val());
    });

    function change(language) {
        mappedLanguage = '';
        if (language in cmMap) {
            mappedLanguage = cmMap[language];
            CodeMirror.autoLoadMode(editor, mappedLanguage);
        } else {
            mappedLanguage = 'text';
        }
        editor.setOption("mode", mappedLanguage);
    }

    $("#submit").click(function() {
        var response = $("#output");
        var json = JSON.stringify(
            {
                "language": language.val(),
                "code": editor.getValue(),
                "stdin": $("#stdin").val()
            });
        eval_code(json, response);
    });

    // Default to Ruby.
    $("#language").chosen().val("ruby").trigger("chosen:updated");
    change("ruby");
});
