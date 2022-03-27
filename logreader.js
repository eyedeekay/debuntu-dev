// NO JQUERY ALLOWED
// wait until the window is loaded
window.addEventListener("load", function() {
    // find every li in the ol
    var lis = document.querySelectorAll("ol li");
    // get the text of the li and download the contents, relative to the current directory
    for (var i = 0; i < lis.length; i++) {
        var li = lis[i];
        console.log("log dammit", li.textContent);
        // request the file contents by doing a fetch
        fetch(li.textContent)
            .then(function(response) {
                console.log("response", response);
                // create a new div with id==text of the li
                var div = document.createElement("div");
                div.id = li.textContent;
                // create a preformatted code section inside of the div
                response.text().then(function(text) {
                    console.log("text", text);
                    var pre = document.createElement("pre");
                    pre.textContent = text;
                    div.appendChild(pre);
                    // append the div to the body
                    document.body.appendChild(div);
                }).catch(function(err) { console.log(err) });
            });

        li.addEventListener("click", function() {
            // hide all divs
            var divs = document.querySelectorAll("div");
            for (var i = 0; i < divs.length; i++) {
                divs[i].style.display = "none";
            }
            // show the div with the id of the li
            document.getElementById(this.textContent).style.display = "block";
            // scroll to the div
            window.scrollTo(0, this.offsetTop);
        });
        // add exactly the same event to the a
        var a = li.querySelector("a");
        a.addEventListener("click", function(e) {
            e.preventDefault();
            // hide all divs
            var divs = document.querySelectorAll("div");
            for (var i = 0; i < divs.length; i++) {
                divs[i].style.display = "none";
            }
            // show the div with the id of the li
            document.getElementById(this.textContent).style.display = "block";
            // scroll to the div
            window.scrollTo(0, this.offsetParent.offsetTop);
        });
    }
});