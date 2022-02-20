
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"
 lang="en" dir="ltr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    Bruda.CA - Emacs - Prolog Mode for Emacs  </title>

  <meta name="generator" content="DokuWiki"/>
<meta name="robots" content="index,follow"/>
<meta name="keywords" content="emacs,prolog_mode_for_emacs"/>
<link rel="search" type="application/opensearchdescription+xml" href="/lib/exe/opensearch.php" title="Bruda.CA"/>
<link rel="start" href="/"/>
<link rel="contents" href="/emacs/prolog_mode_for_emacs?do=index" title="Sitemap"/>
<link rel="manifest" href="/lib/exe/manifest.php"/>
<link rel="alternate" type="application/rss+xml" title="Recent Changes" href="/feed.php"/>
<link rel="alternate" type="application/rss+xml" title="Current namespace" href="/feed.php?mode=list&amp;ns=emacs"/>
<link rel="alternate" type="text/html" title="Plain HTML" href="/_export/xhtml/emacs/prolog_mode_for_emacs"/>
<link rel="canonical" href="https://bruda.ca/emacs/prolog_mode_for_emacs"/>
<link rel="stylesheet" href="/lib/exe/css.php?t=bruda&amp;tseed=1dbd51a740d49d53036aafe914d86e1e"/>
<!--[if gte IE 9]><!-->
<script >/*<![CDATA[*/var NS='emacs';var JSINFO = {"id":"emacs:prolog_mode_for_emacs","namespace":"emacs","ACT":"show","useHeadingNavigation":0,"useHeadingContent":0};
/*!]]>*/</script>
<script charset="utf-8" src="/lib/exe/jquery.php?tseed=34a552433bc33cc9c3bc32527289a0b2" defer="defer"></script>
<script charset="utf-8" src="/lib/exe/js.php?t=bruda&amp;tseed=1dbd51a740d49d53036aafe914d86e1e" defer="defer"></script>
<!--<![endif]-->

  <link rel="shortcut icon" href="/images/favicon.ico" />

  <!-- link href="ddd.css" rel="stylesheet" type="text/css" / -->

  <link href="/internals/main.css" rel="stylesheet" type="text/css" />
  <link href="/internals/flexibles_content.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="/internals/rte.css" media="all" />
  <link rel="stylesheet" type="text/css" href="/internals/nouvelles.css" media="all" />

  <!-- <script type="text/javascript" src="/internals/jquery-1.js"></script> -->
  <script type="text/javascript" src="/internals/menu.js"></script>

  </head>

<body>
<div class="dokuwiki">
  
  <div style="background-color: #ffffff">
    <div id="container">

      <div id="header">   
        <div id="logo" class="f-l">
          <a href="http://www.ubishops.ca/">
              <img src="/images/BU-logo-purple2.png" alt="BU" border="0" height="62" width="185" /></a>
        </div>
        <div id="name">bruda.ca</div>
        <div id="logo1" class="f-r">
          <a href="http://cs.ubishops.ca/">
              <img src="/images/bucs-name-white.png" alt="BUCS" border="0" height="62" width="292"/></a>
        </div>
      </div><!-- header-->
      <div class="c-b"></div>
    </div> <!-- container -->
  </div> <!-- background-color: #fff -->

  <div id="breadcrumbs-bar">
     <div id="breadcrumbs">
       <div id="filariane">
                  <span><a href="http://www.ubishops.ca">Bishop's University</a> &gt; 
                <a href="http://cs.ubishops.ca">Department of Computer Science</a> &gt;
                <a href="https://bruda.ca">Bruda.CA</a> > <a href="https://bruda.ca/emacs">Emacs</a> > Prolog Mode for Emacs</span>                </div>
     </div><!--breadcrumbs -->
  </div> <!-- breadcrumbs-bar -->

  <div id="container1" class="swm_container">
    <div>
      <div id="x" class="f-l">
        <div id="content">
          <div id="c8033" class="csc-default">
            <div class="csc-textpic csc-textpic-left csc-textpic-below">
              <div class="csc-textpic-text">
              <p class="wikiheaders">
                Prolog Mode for Emacs              </p>
              </div> <!-- csc-textpic-text -->
            </div> <!-- csc-textpic-below -->
            <div class="csc-textpic-clear"><!-- --></div>
          </div> <!-- csc-default -->

          <div class="csdokuwiki">
            <div class="page">
                            
<p>
<em>A variant of this very code now comes bundled with Emacs (23 and above). The bundled version includes extra features such as <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/SMIE.html" class="urlextern" title="https://www.gnu.org/software/emacs/manual/html_node/elisp/SMIE.html" rel="ugc nofollow">SMIE</a> integration (which in turn handles correctly and completely Prolog&#039;s</em> <code>0</code>&#039; <em>construct).  Therefore if you are using a newer Emacs you may be better off just using what comes bundled with it.</em>
</p>

<p>
<em>This being said, some people consider this version superior in several ways.  It is also the case that the new, bundled version is not available to older Emacsen, while this version works with any reasonably new version of Emacs and XEmacs.  For these two reasons this page will continue to exist, and the code herein will continue to be maintained for the foreseeable future.</em>
</p>

<p>
This Prolog mode has all the features one would expect, including syntax highlighting, auto indent, and full interaction with an inferior Prolog process.
</p>

<p>
This mode supports in principle any Prolog system, though I am primarily maintaining it with SWI Prolog in mind. It also has some special tweaks for GNU Prolog (starting from version 1.4) and SICStus Prolog, and explicitly supports Prolog&#039;s close relatives Eclipse, Mercury, and XSB (starting from version 1.23).
</p>

<h1 class="sectionedit1" id="downloads">Downloads</h1>
<div class="level1">
<ul>
<li class="level1"><div class="li">  <a href="/_media/emacs/prolog.el" class="media mediafile mf_el" title="emacs:prolog.el (158.6 KB)">prolog.el</a> version 1.28 works with Emacs 20 and above and reasonably recent versions of XEmacs (tested on 21.1 and higher). For a change log see the beginning of the source file.</div>
</li>
<li class="level1"><div class="li">  A <a href="http://packages.debian.org/prolog-el" class="urlextern" title="http://packages.debian.org/prolog-el" rel="ugc nofollow">Debian package</a> is also available.</div>
</li>
<li class="level1"><div class="li">  An utterly unmaintained version for Emacs 19: <a href="/_media/emacs/prolog-0.1.31.el" class="media mediafile mf_el" title="emacs:prolog-0.1.31.el (106.1 KB)">prolog-0.1.31.el</a>.</div>
</li>
</ul>

</div>

<h1 class="sectionedit2" id="installation">Installation</h1>
<div class="level1">

<p>
In a nutshell, place the downloaded file where Emacs can see it, and insert into your <code>~/.emacs</code> or <code>~/.xemacs/init.el</code> the following lines:
</p>
<pre class="code">(autoload &#039;run-prolog &quot;prolog&quot; &quot;Start a Prolog sub-process.&quot; t)
(autoload &#039;prolog-mode &quot;prolog&quot; &quot;Major mode for editing Prolog programs.&quot; t)
(autoload &#039;mercury-mode &quot;prolog&quot; &quot;Major mode for editing Mercury programs.&quot; t)
(setq prolog-system &#039;swi)
(setq auto-mode-alist (append &#039;((&quot;\\.pl$&quot; . prolog-mode)
                                (&quot;\\.m$&quot; . mercury-mode))
                               auto-mode-alist))</pre>

<p>
See the comments at the beginning of the source file for the gory details, and <a href="/emacs/prolog-mode_installation_guide" class="wikilink1" title="emacs:prolog-mode_installation_guide" data-wiki-id="emacs:prolog-mode_installation_guide">this installation guide</a> for an even more detailed explanation.
</p>

<p>
Note that the default behaviour of <code>prolog-insert-predicate-template</code> has changed in version 1.15. The new behaviour is to just insert the predicate name followed by a parenthesis (as opposed to the old behaviour of inserting the predicate name, matching parentheses, and enough commata to separate all the arguments). Indeed, it seems more productive to just type those commata and closing parenthesis. If the old behaviour is desired, set <code>prolog-electric-dot-full-predicate-template</code> (group “Prolog Keyboard”) to non-nil.
</p>

<p>
Starting from version 1.25 “ansi-color” is required (since most Prolog interpreters seem to use ANSI escape sequences).  The variable <strong>prolog-inferior-ansi-color</strong> controls whether the ANSI escape sequences are translated into text properties (non-nil, default) or filtered out (nil).
</p>

<p>
One new customizable variable has been added in version 1.28:
</p>
<ul>
<li class="level1"><div class="li">  <strong>prolog-align-small-comments-flag</strong> (group “Prolog Indentation”)  specifies how to handle “small” comments (the ones that start with a simgle “%”) as follows: When this variable is non-nil (default) small comments are aligned to `comment-column&#039; (default 32) in all circumstances.  When the variable is set to nil however small comments that begin a line (blank characters notwithstanding) will be treated just like “large” comments (the ones that start with “%%”).  Note that small comments that start somewhere other than at the beginning of the line are still aligned to `comment-column&#039;.</div>
</li>
</ul>

<p>
Two new customizable variables have been added in version 1.9:
</p>
<ul>
<li class="level1"><div class="li">  <strong>prolog-paren-indent-p</strong> (group “Prolog Indentation”) governs how parenthesis expressions (other than compound terms) are indented. If the variable is nil (default) then components are indented one underneath the other (just as for compount terms); otherwise the second and subsequent lines are indented `prolog-paren-indent&#039; characters to the right (old behaviour).</div>
</li>
<li class="level1"><div class="li">  <strong>prolog-char-quote-workaround</strong> (group “Prolog Other”) allows for a somehow correct handling of the 0&#039; character escape by setting 0 as a quote character (when non-nil); setting the variable to nil (default) ignores the 0&#039; construct.<br/>
This should not be customizable (the character escape should be recognized as such no matter what) but the current implementation is kludgy (and I have no idea how to do it better) so for the time being I provide a way to disable the whole thing. Please let me know about any idea to do this better and most importantly about any breakage caused by the current implementation.</div>
</li>
</ul>

<p>
Further note that some more customizable variables have been added (and might be added in future versions), please check the changelog provided at the beginning of the source file.
</p>

</div>

            </div> <!-- page --> 
            <div class="clearer">&nbsp;</div>

                        
                                    
            <!-- <a class="nolink" href="#dokuwiki__top"><button class="button" onclick="window.scrollTo(0, 0)" title="Back to top">Back to top</button></a>&nbsp;-->

          </div> <!-- csdokuwiki -->
        </div> <!-- content -->
      </div> <!-- x -->
    </div> <!-- no name (underneath container1) -->

    <!-- now inside dokuwiki - container1 -->
    <div id="swm_right-column" class="f-l">
      <div id="rightmenu">
        <ul id="menugauche">
          <li><a href="https://bruda.ca" title="Bruda.CA">Bruda.CA</a></li>
          <li><a href="https://part.bruda.ca" title="Research">Research</a>          <ul id="menugauche_niv2">
            <li>
              <a href="https://part.bruda.ca/publications" title="Publications">Publications</a>
            </li>
          
          </ul></li>
          <li><a href="https://bruda.ca/teaching" title="Teaching">Teaching</a></li>
          <li><a href="https://photography.bruda.ca" title="Photography">Photography</a></li>
          <li><a href="https://bruda.ca/cv" title="CV">Brief CV</a></li>
          <li><a href="https://bruda.ca/contact" title="Contact">Contact</a></li>
        </ul>
      </div> <!-- rightmenu -->
      <div id="cs-search" style="margin-bottom:40px;">
        <form action="https://bruda.ca/?do=search" accept-charset="utf-8" class="search" id="dw__search" method="get"><div class="no"><input type="hidden" name="do" value="search" /><div class="f-l"><input type="text" value="Search bruda.ca" onfocus="this.value=''" id="qsearch__in" accesskey="f" name="id" class="txt-search-cs" title="[F]" /></div><div class="f-l"><input value="" class="btn-search-cs" name="sa" type="submit" /></div><div id="qsearch__out" class="ajax_qsearch JSpopup"></div></div></form>      </div>

      <div id="under-secondary-menu">

        
        
      </div> <!-- under-secondary-menu -->
    </div> <!-- swm_right-column -->

    <!-- now inside dokuwiki - container1 -->
    <div class="c-b"></div>
          </div> <!-- container1 -->


  <div id="footer">
    <div id="footer-container">
      <div id="box-address" class="f-l">
        <div id="c8015" class="csc-default">
          <div class="csc-header csc-header-n1">
            <h3 class="csc-firstHeader">Location</h3>
          </div>
          <p>Bishop's University<br />
             2600 College St<br />
             Sherbrooke, Quebec&nbsp; J1M&nbsp;1Z7<br />
             Canada<br />
          </p>
          <p>Office: Johnson 114B</p>
        </div> <!-- c8015 -->
      </div> <!-- box-address -->

      <div id="box-contact" class="f-l">
        <div id="c8017" class="csc-default">
          <div class="csc-header csc-header-n1">
            <h3 class="csc-firstHeader">Contact</h3>
          </div>
          <p><a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#115;&#116;&#101;&#102;&#097;&#110;&#064;&#098;&#114;&#117;&#100;&#097;&#046;&#099;&#097;" class="internal-link">&#115;&#116;&#101;&#102;&#097;&#110;&#064;&#098;&#114;&#117;&#100;&#097;&#046;&#099;&#097;</a>
          </p>
          <p>Voice: +1-819-822-9600 x2374<br />
          Fax: +1-819-822-9661
          </p>
          <p><a href="https://bruda.ca/contact">More...</a></p>
        </div> <!-- c8017 -->
      </div> <!-- box-contact -->


      <div id="box-changes" class="f-l">
        <div id="c8016" class="csc-default">
          <div class="csc-header csc-header-n1">
            <h3 class="csc-firstHeader">Changes</h3>
          </div>
          <p>Last modified: 
             Fri 29 May 2020 10:21 am -0400          </p>
          <p>
            <img src="/images/RTEmagicC_873661657b.png" alt="" border="0" height="16" width="16" />
            &nbsp;
            <a href="https://bruda.ca/feed.php?linkto=current&amp;content=htmldiff&amp;num=5">Recent site changes</a>
          </p>
        </div> <!-- c8016 -->
      </div> <!-- box-changes -->

      <div id="box-site" class="f-l">
        <div id="c8018" class="csc-default">
          <div class="csc-header csc-header-n1">
            <h3 class="csc-firstHeader">Site</h3>
          </div>
            <p>(c) Stefan D. Bruda
            </p>
            <p>
               <a href="https://bruda.ca/?do=index">Sitemap</a>
               <!-- <a href="?do=index">Sitemap</a> -->
            </p>
            <p>&nbsp;</p>
            <p>
            <a href="http://validator.w3.org/check/referer" title="Valid XHTML 1.0">
            <img src="/images/button-xhtml.png" width="80" height="15" alt="Valid XHTML 1.0" /></a>
            <a href="https://bruda.ca/one-man_wiki"><img src="/images/button-dw.png" alt="One-man wiki" /></a>
            <a href="https://bruda.ca/one-man_wiki">More...</a></p>
        </div> <!-- c8018 -->
      </div> <!-- box-site -->


      <div class="c-b"></div>
    </div> <!-- footer-container -->
  </div> <!-- footer -->
</div> <!-- dokuwiki -->

<div class="no">
  <img src="/lib/exe/taskrunner.php?id=emacs%3Aprolog_mode_for_emacs&amp;1645368023" width="2" height="1" alt="" /></div>
</body>
</html>
