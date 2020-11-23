template |head|
---
title: __title__
author: __CW__
date:  

---
endtemplate


template |blog|
---
title: __title__
author: __CW__
date:  
include-before:
  <!-- Menu bar -->
  <nav class="menu">
  <div class="nav-left">
    <ul>
      <li><a href="index.html"><img class="logo" src="figures/favicon.jpg" alt="">Cong's blog</a></li>
    </ul>
  </div>
  <div class="nav-right">
    <ul>
      <li><a href="https://unsplash.com/@carbonscott">unspalsh</a></li>
      <li><a href="https://github.com/carbonscott">github</a></li>
      <li><a href="https://scholar.google.com/citations?user=aXOOJ2cAAAAJ&hl=en&oi=sra">publication</a></li>
      <li><a href="resume.html">resume</a></li>
    </ul>
  </div>
  </nav>

include-after:
  <!-- Footer -->
  <footer>
  <p>Licensed under <a href="https://creativecommons.org/licenses/by-nc/4.0/">CC BY-NC 4.0</a>
  </footer>

---
endtemplate


template |code.block|
```
____
```
endtemplate


template |link|
[____](____)
endtemplate


template |image|
![____](____)
endtemplate


template |comment.inline|
<!-- __comment__ -->
endtemplate


template |comment.block|
<!--

__comment__

-->
endtemplate
