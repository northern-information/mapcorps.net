---
layout: post
title: "Let's Talk About M"
date: 2021-07-15
content_id: 11
author: "Zeke"
type: "Praxis"
ascii: "M"
x: 4
y: 11
class: orange
attributes: ["mouth"]
---

Advanced Teletype hackers probably (definitely) have a firm grasp of the concepts I'm going to cover, so this is definitely aimed at those folks just getting started, or those folks like me who may be struggling to connect some dots.

For other members of the [TT Study Group Discord](https://discord.gg/f5AWwvUkt8), that title may be funny because it is a play on the name of my current thesis/focus of study, which is "Let's Talk About P". Before I get into my topic, I would love to encourage you to engage with other cartographically-minded folks at the [Lines forum](https://llllllll.co). I would also like to thank folks there and in the Discord for all of the help they've given me in understanding Teletype—community is a sacred thing.

So, today I'd like to talk about `M`. My understanding of the importance of `M` took some time. (By `M` I'm referring to the Metronome script in each scene on Teletype for those who aren't aware.) In the interest of full-disclosure, I am not a dev and do not take to coding naturally. Sure, I've done some courses on [CodeAcademy](https://codeacademy.com) to explore if that was something I could awaken in myself, but nothing ever took or stuck. I share this because my journey with Teletype has been a labor of love, emphasis on the labor. ☺

I did the excellent [Teletype studies](https://monome.org/docs/teletype/studies-1/) provided by Monome, and the [Just Type studies](https://monome.org/docs/teletype/jt-1/) as well. And I even did them again (because not coder). These are excellent and I highly recommend you check them out. I still reference them when I'm working on a scene. The [Teletype Command](https://monome.org/docs/teletype/manual) sheet is also super-helpful. These will fill in gaps in what I discuss around `M`.

---

## Attowatt's FC210605 Set

<iframe width="560" height="315" src="https://www.youtube.com/embed/F-aVx8VQhYw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I watched the first [Flash Crash](https://flashcrash.net) and had my face melted. Watching those sets gave me the idea to figure out some specific goals/musical maneuvers/tricks with Teletype and I'll share how I achieved them with you all today. These came as a result of several failings and help from my friends—in other words, a good time.

For technical context here, I am solely focusing on Teletype + Just Friends (connected via i2c), aka JustType, and Just Friends is in synthesis mode (`JF.MODE 1`) with switches set to Sound/Cycle. I cannot overstate how expansive and creative a sonic landscape one can create and explore with these two modules paired this way.

---


> Goal 1: Move the read head of a pattern in tracker so that I could assign the value to a `JF.VOX` command.

The ability to grab notes from `P` seemed to me like fire must have to our ancestors — I was fascinated by it, but couldn't figure out how to hack the basic concept. I could make it work manually (hich wasn't what I wanted to do) but I couldn't make the read head of a pattern move on it's own. This is where `M` came in to play, and I have both `@Obakegaku` and `@DesolationJones` to thank for guiding me to this knowledge.

I put the following values into the first two columns of tracker or `P`:

```
 0       0
 4       3
 7       7
12      11
-8      -9
-5      -6
```

The note in column 1 (or Pattern 0) are values I wanted to pull from the following in `Script 1`:

```
#1
X PN.NEXT 0
JF.VOX 0 N X V 5
```

This input meant that every time I hit the `F1` key on my keyboard, I would advance the read head of the first column and the value would play through the command `JF.NOTE N X V 5`... but I wanted it to arpeggiate! This is where `M` comes in, and the solution is so simple, I daresay it's elegant. In `M` we put:

```
#M
$ 1
```

That's it! Every beat of the metronome, `M` will call `Script 1`, which will advance and read the playhead of the first pattern and output it via the command `JF.NOTE N X V 5`! I was ecstatic to figure this out! (Note here: arpeggios for JustType really need the time knob turned way down. Like around the `60s` mark.)

<audio controls src="/assets/content/lets-talk-about-m.mp3"></audio>

This is super simple, but it shows the power of `M`. Use it to call something every beat, or add logic to divide or change probability that `M` will do something on each beat. I have been exploring this concept alone for quite some time. It is JustFun™.

---

> Goal 2: Use a knob on Telexi (TXi) to control the BPM of `M`.

This is fun. I also think it is like trying to invent a wheel. But it is a wheel I made, so I'm into it.

One of my goals with the [TXi expander](https://store.bpcmusic.com/products/telexi) for Teletype was to use the first knob to control BPM. Implementing this was not as clear cut as I thought it would be. Figuring out the code was easy enough by referencing the command sheet, but execution is a different thing. The first thing to do is calibrate the knob and define the ranges you want it to cover. Through trial and error, I arrived at `400` as the low value and `600` as the high value. This gave me a noticeable difference in BPM, but not something that would be super-drastic and make for awkward looks from the dance floor if I over-rotated.

To calibrate knob 1 of TXi to only read values in this range, we use the command:

```
TI.PRM MAP 1 400 600
```

I put this in `Script I` because that is a good place for it. But having this in `I` didn't not mean that `I` could simply change the BPM of `M` by turning the knob. All I've done is change the parameters of the knob. In order to read the value of the knob as the new BPM, we need another command:

```
M TI.PRM 1
```

This says `M` is now the value of the first knob on TXi, which we've already said will only be a value between `400` and `600`. I put this in `I` and it didn't work like I thought it would. BPM didn't change whenever I turned the knob, but it would change if I turned the knob then hit `F10`, calling `I` manually. 

So, in the same scene as before, I removed `M TI.PRM 1` from `I` and put it in `Script 1`. Because remember what we have in M?

```
#M
$ 1
```

Every beat, `M` is calling `Script 1`, and if every beat we are telling `M` that it's value is the value of knob 1 on TXi, it will adjust its behavior. Now `Script 1` looks like this:

```
#1
X PN.NEXT 0
JF.NOTE N X V 5
M TI.PRM 1
```

Now, granted, these changes will have some latency because `Script 1` isn't being called in nanoseconds, but to the ear, it sounds like real-time. Now when I turn the knob on TXi, my BPM changes and I feel like a Super Amadeus.

There is so much to expand on from here, and frankly, I would probably give some not-great explanations of `M`, so I will refrain. But you can see from my examples how useful `M` can be in making things that you want to happen, happen. I hope that this is exciting or useful knowledge for you and that you make some magic all your own.

`M` is metronome is time.
`M` is movement is melody.
`M` is magic is mapcore.