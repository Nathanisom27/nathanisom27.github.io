---
layout: post
title: add local font files linux
---

If you have a local ttf or other type of font that wasn't available via your package manager, you can just place it in the `.local/share/fonts` directory. And of course reload all the fonts with `fc-cache -f -v`.