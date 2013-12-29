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
        $.ajax(
            {
                "url": "/api/evaluate",
                "type": "POST",
                "data": JSON.stringify({
                    "language": language.val(),
                    "code": editor.getValue(),
                    "stdin": $("#stdin").val()
                }),
                "dataType": "json",
                "contentType": "application/json; charset=utf-8",
                "success": function(data) {
                    $("#output").text(JSON.stringify(data, null, 4));
                    $('#output').each(function(i, c) { hljs.highlightBlock(c) });
                },
                "error": function(jqXHR, textStatus, errorThrown) {
                    $("output").text("[" + textStatus + "] " + errorThrown);
                }
            }
        );
    });

    // Default to Ruby.
    $("#language").chosen().val("ruby").trigger("chosen:updated");
    change("ruby");
});
