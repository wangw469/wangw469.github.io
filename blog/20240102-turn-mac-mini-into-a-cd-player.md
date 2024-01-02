# Turn mac mini into a cd player

## Why CD?

I love music, after reading [this article](https://www.nytimes.com/2023/09/19/magazine/music-not-streaming.html) from NYtimes, I just realize that it's time to for me to have
a physical collection of music.

After some search and thought, I think CD is the perfect media to do it:

* It's easy and cheap: after you purchase a cd burner(which cost like 10$ ), you can burn any music you like with a click, and cdr disc is cheap(0.3 $ per disc);
* a lot of music to choose: you can purchase music from iTunes Store which has latest and many old recordings;
* All those big records company still sale CDs
* It has very high audio quality
* I still has a car with cd player builtin, I can simply take the music I like for a trip

## Enjoy music without GUI

Then I want to enjoy music without any disrupte, without any GUI.

So I decide to turn my daily computer(a mac mini) into a cd player.

I have a external CD burner connect with the mac mini, to make it a cd player, these features has to implement:

* autoplay any CD I insert into external cd burner;
* can controled by keyboard to:
  * skip forware/backward
  * volumn up
  * volumn down
  * eject CD

### autoplay audio CD

Seems like it's a once built-in feature for Music app, but now for some reason it's gone, the feature still has a support page:

[https://support.apple.com/lv-lv/guide/music/mus2935/1.4/mac/14.0#mus56cc61e
](https://support.apple.com/lv-lv/guide/music/mus2935/1.4/mac/14.0#mus56cc61e
)

You can now implement this feature with:

* macOS: [handle CDs settings](https://support.apple.com/lv-lv/guide/mac-help/mchlp1354/mac)
* [Automator App](https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player/auto_play_using_mpv.app/Contents)
* mpv
  
<img width="497" alt="Screenshot 2024-01-02 at 22 07 42" src="https://github.com/wangw469/wangw469.github.io/assets/3417025/49298049-8968-4735-a03d-79a7a836efbe">

The basic ideal is to config macOS to launch a Automator App when a audio cd inserted which launch mpv to play CD.

### control playback by keyboard

I have a HHKB keyboard which don't come with any media playback key, so I'll need to create some global keybinds.

First I tried build-in solution like: Shortcuts, looks like it's not very stable and the shortcuts not work everytime.

Then I find [karabiner-elements](https://karabiner-elements.pqrs.org/) which works very well and even have built-in config to map function keys as media playback keys:

* f7: rewind
* f8: play/pause
* f9: fast foward
* f10: mute
* f11: volume down
* f12: volume up

Only config I need is to [make eject work](https://github.com/wangw469/wangw469.github.io/blob/master/blog/cd-player/eject-config.json).

The trick part here is to first stop mpv before call diskutil to eject CD.

You can find all the scripts here:

[https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player](https://github.com/wangw469/wangw469.github.io/tree/master/blog/cd-player)

[https://famichiki.jp/@xiaopi/111668021062749011
](https://famichiki.jp/@xiaopi/111668021062749011
)
