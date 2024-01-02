---
title: "Turn mac mini into a cd player"
date: 2024-01-02
---
<style>
body { max-width: 800px; margin: 40px; }
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">

## Why CD?

I love music, after reading [this article](https://www.nytimes.com/2023/09/19/magazine/music-not-streaming.html) from NYtimes, I just realize that it's time for me to start a physical music collection.

After some search and thought, I think CD is the perfect media to do it:

* It's easy and cheap: Once you purchase a CD burner (which costs about $10), you can burn any music you like with a click, and CD-R discs are cheap (about $0.30 per disc);
* a lot of music to choose: you can purchase music from iTunes Store which has latest and many old recordings;
* All the major record companies still sell CDs;
* It has very high audio quality;
* I still have a car with a built-in CD player, I can simply take the music I like for a trip;

## Enjoy music without GUI

I want to enjoy music without any disruptions, including a GUI.

So I decide to turn my daily computer(a mac mini) into a cd player.

I have an external CD burner connected to the Mac Mini, to make it a cd player, I need to implement these features:

* autoplay any CD I insert into external cd burner;
* Control it by keyboard to:
  * skip forware/backward
  * Turn the volume up/down
  * eject CD

### Autoplay Audio CD

Seems like it's a once built-in feature for Music app, but now for some reason it's gone, although the feature still has a support page:

[https://support.apple.com/lv-lv/guide/music/mus2935/1.4/mac/14.0#mus56cc61e
](https://support.apple.com/lv-lv/guide/music/mus2935/1.4/mac/14.0#mus56cc61e
)

You can now implement this feature with:

* macOS: [handle CDs settings](https://support.apple.com/lv-lv/guide/mac-help/mchlp1354/mac)
* [Automator App](https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player/auto_play_using_mpv.app/Contents)
* mpv
  
<img width="497" alt="Screenshot 2024-01-02 at 22 07 42" src="https://github.com/wangw469/wangw469.github.io/assets/3417025/49298049-8968-4735-a03d-79a7a836efbe">

The basic idea is to config macOS to launch a Automator App when a audio cd inserted which launch mpv to play CD.

### control playback by keyboard

I have a HHKB keyboard which don't come with any media playback key, so I'll need to create some global keybinds.

First, I tried the built-in solution like: Shortcuts, looks like it's not very stable and the shortcuts don't work every time.

Then I find [karabiner-elements](https://karabiner-elements.pqrs.org/) which works very well and even have built-in config to map function keys as media playback keys:

* f7: rewind
* f8: play/pause
* f9: fast foward
* f10: mute
* f11: volume down
* f12: volume up

The only configuration I need is to [make the eject function work](https://github.com/wangw469/wangw469.github.io/blob/master/blog/cd-player/eject-config.json):

* f6: eject cd

The trick part here is to first [stop](https://github.com/wangw469/wangw469.github.io/blob/master/blog/cd-player/stop.sh) mpv before calling diskutil to [eject](https://github.com/wangw469/wangw469.github.io/blob/master/blog/cd-player/eject.sh) CD.

You can find all the scripts here:

[https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player](https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player)

That's it, enjoy your CDs now!

[https://famichiki.jp/@xiaopi/111668021062749011
](https://famichiki.jp/@xiaopi/111668021062749011
)
