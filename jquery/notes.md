# Learn about jQuery in 2 Hours

## Plan of Attack

### RESEARCH
----------
Do a quick search to find a short jQuery overview.
-http://www.tutorialspoint.com/jquery/jquery-overview.htm
-https://learn.jquery.com/about-jquery/how-jquery-works/
-jQuery Tutorial #1: jQuery Tutorial for Beginners - https://www.youtube.com/watch?v=hMxGhHNOkCU (This video was quite helpful. The person explained things through writing actual code.)
-jQuery Overview: https://www.youtube.com/watch?v=DpdqEonT__8 (This was a good explanatory video.)

----------
Search for a jQuery cheat sheet.
-https://oscarotero.com/jquery/ (similar to overapi one)
-http://overapi.com/jquery (good one)
-http://makeawebsitehub.com/jquery-mega-cheat-sheet/ (printable pdf)

----------
Find out how jQuery works with JavaScript.
-Example...

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("p").click(function(){
        $(this).hide();
    });
});
</script>
</head>
<body>

<p>If you click on me, I will disappear.</p>
<p>Click me away!</p>
<p>Click me too!</p>

</body>
</html>

----------
Find out if jQuery is useful with other languages; and if so, what's the respective relation to each language?
-Doesn't look like it.

----------
Look at and play around with code examples.
-http://www.w3schools.com/jquery/ (Good site to play around with code examples.)

### APPLY YOUR LEARNINGS
----------
Test at least one thing learned about jQuery.
-Applied jquery to Taco World project.

### NOTES
----------
The plan was pretty useful since it provided a structural approach to learing jQuery in a short period of time. I spent a few minutes looking through an overview. Then I found a cheat sheet that was visually presented well and interactive to refer back to. Watching a YouTube tutorial video helped me further understand the process of implementing and using jQuery. Practices exercises on a site like w3schools quickly helped me apply what I learned. I also went to office hours to strengthen my knowledge. I also referred back to the video as I applied jQuery to my own sample project (Taco World). Don't forget to check out the Taco Wave™!