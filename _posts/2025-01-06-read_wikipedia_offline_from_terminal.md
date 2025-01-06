---
layout: post
title: "Read Wikipedia offline from terminal"
city: Suzhou
date: 2025-01-06
---

I like wikipedia. It's the most valuable web resource
for me.

So I want to read it all the time no matter whether I
have a fast Internet connection.

I want to read it fast with any computer device I have.

To address these two requirements I try to find a solution
to read it offline in terminal.

# offline

Kiwix provide a great solution to make Wikipedia offline.

I just need to download a 110G zim file from its website.

Then I can read whole English Wikipedia offline.

# terminal

Kiwix also provide a command line tool called kiwix-serve
which can load zim files and start a local web service to
access it.

So I just need a terminal web browser like w3m to read it.

kiwix-serve also provide a search function so you don't
have to remember the full path for article.

Combine all these information, I write a bash funciton and put
it into .bashrc:

```bash
function wiki() {
	kiwix-serve -d -p 8080 /media/xp/wikipedia/wikipedia_en_all_maxi_2024-01.zim 2> /dev/null
	w3m "http://localhost:8080/search?pattern=$*"
}
```

Now I can read Wikipedia from command line with single command like:

wiki linux kernel

I'm quite satisfie with this setup and enjoy read wikipedia all day alone.

Hope this article will help you acess wikipedia more easily.

Thanks a lot for kiwix project to make all this possible.

