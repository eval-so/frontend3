/**
 * Evaluate code through the API.
 *
 * This expects the 'code' argument to be a valid string of JSON.
 */
function eval_code(json, out) {
    out.text("...");
    $.ajax(
        {
            "url": "/api/evaluate",
            "type": "POST",
            "data": json,
            "dataType": "json",
            "contentType": "application/json; charset=utf-8",
            "success": function(data) {
                out.text(JSON.stringify(data, null, 4));
                out.each(function(i, c) { hljs.highlightBlock(c) });
            },
            "error": function(jqXHR, textStatus, errorThrown) {
                out.text("[" + textStatus + "] " + errorThrown);
            }
        }
    );
}
