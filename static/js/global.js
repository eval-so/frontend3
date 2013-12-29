$(function() {
    var keys = [];
    var konami = '38,38,40,40,37,39,37,39,66,65';
    $(document).keydown(function(event) {
        keys.push(event.keyCode);
        if (keys.toString().indexOf(konami) >= 0) {
            $('img').each(function() {
                $(this).attr('src', '/static/img/doge.png');
            });
            $('body, h1, h2, h3, h4, h5').css('cssText', 'font-family: Delius !important;');

            // Code from https://github.com/idiot/doge/blob/master/jquery.doge.js
            // Need license to be added though. :(
            $('body').append('<div class="doge" />').children('.doge').css({
                position: 'fixed',
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                pointerEvents: 'none',
                overflow: 'hidden',
            });

            var r = function(arr) {
                return arr[Math.floor(Math.random() * arr.length)];
            };

            var doges = ['wow', 'such', 'plz', 'want', 'very', 'much', 'nice', 'cool'];
            var languages = ['php', 'python', 'haskell', 'scala', 'c#', 'ruby', 'perl', 'monads', 'evaluation', 'compilation', 'api', 'speed', 'exit code'];

            setInterval(function() {
                $('.doge').append(
                    '<span style="position: absolute; left: ' +
                        Math.random()  *100 + '%; top: ' +
                        Math.random()  *100 + '%; font-size: ' +
                        Math.max(24, (Math.random() * 50 + 50)) +
                        'px; color: rgb(' + Math.round(Math.random() * 255) +
                        ', ' + Math.round(Math.random() * 255) + ', ' +
                        Math.round(Math.random() * 255) + ');">' +
                        r(doges) + ' ' + r(languages) +
                        '</span>');
            }, 700);

            keys = [];
        }
    });
});
