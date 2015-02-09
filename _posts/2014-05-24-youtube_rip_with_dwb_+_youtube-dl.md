---
layout: post
title: youtube rip with dwb + youtube-dl
---

Just finished a snippet that can be used in combination with dwb(or many other browsers, probably) to auto download a youtube video and convert it to audio using [youtube-dl](rg3.github.io/youtube-dl).

{% highlight bash %}
#!/bin/bash
#dwb: xf
download_dir=/my/media/dir
youtube-dl -x -o $download_dir'/%(uploader)s/%(title)s.%(ext)s' $DWB_URI
{% endhighlight %}

It can probably be noted that I had some trouble with the youtube-dl naming syntax at first - the '%(title)s' and such needs to be in a string or else bash freaks out. Also this will fail without ffmpeg, as that is a dep for audio conversion with youtube-dl.