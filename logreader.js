// NO JQUERY ALLOWED
// wait until the window is loaded
window.addEventListener("load", function() {
    // find every li in the ol
    var lis = document.querySelectorAll("ol li");
    // get the text of the li and download the contents, relative to the current directory
    for (var i = 0; i < lis.length; i++) {
        var li = lis[i];
        // create a new div with id==text of the li
        var div = document.createElement("div");
        div.id = li.textContent;
        // create a preformatted code section inside of the div
        var pre = document.createElement("pre");
        // request the file contents by doing an xhr
        var xhr = new XMLHttpRequest();
        xhr.open("GET", li.textContent, false);
        xhr.send();
        // put the contents of the file into the preformatted code section when a response is recieved
        xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    pre.textContent = xhr.responseText;
                }
            }
            // add the preformatted code section to the div
        div.appendChild(pre);
        // add the div to the li
        li.appendChild(div);
        // add a click event to the li
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
    // hide all divs
    //var divs = document.querySelectorAll("div");
    //for (var i = 0; i < divs.length; i++) {
    //divs[i].style.display = "none";
    //}
});