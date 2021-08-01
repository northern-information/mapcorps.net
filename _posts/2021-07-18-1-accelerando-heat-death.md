---
layout: post
title: "Accelerando Heat Death"
date: 2021-07-18
content_id: 13
author: "Ben"
type: "Praxis"
ascii: "B"
x: 0
y: 17
class: neutrino
attributes: ["tempo", "metro", "haiku", "generative"]
---
As the universe expands, iterations of its thermodynamic swan song are simultaneously calculated and performed by Galaxy Clusters 1 through 6, accelerando.

A generative mixolydian ode to the axiom that everything that begins, so too, must end. A firm nod to Telepoet `@scannerdarkly` and the Map Corps. Paired for Just Friends, but easily reinvisioned.

![CC Nebula](/assets/content/accelerando-heat-death-cc-nebula.jpg)


![Heat Death Dotgrid](/assets/content/accelerando-heat-death-dotgrid.png)

Above: A beautiful nebula via NASA and Heat Death imagined in [Dotgrid](https://hundredrabbits.itch.io/dotgrid).

---

## Ingredients

1. Teletype
2. Just Friends
3. Audio interface

With Teletype and Just Friends connected via i2c, simply patch the MIX output to your audio interface. This is a 'dry' patch. Ideas for a 'wet' patch are captured below.

---

## The Code

In live mode on Teletype, please begin by activating `JF.MODE 1`.

Then enter the following in the `METRO` / `M` script:

```
#M
IF EQ M 30: JF.VOX 0 0 0; KILL
K RRND 2 10; A M; B RRND 1 6
J QT.S N RRND K 36 0 7; CV 1 J
M + -1 M; M WRAP M 30 500
SKIP K: JF.VOX B J V K
PROB K: JF.SHIFT V TOSS
```

---

## Play

`ctrl + f9` reincarnates the heat death experience. Each tick of the metro counts the starting tempo backwards from `500` to `30` (slower heat deaths replicable at user's own discretion), at which point maximum entropy is achieved and the Universe can now longer sustain its expansion. 

The Teletype HUD (toggled via the `~` key) lets users track the countdown to death through the scope of `A`, while `B` corresponds to the current Galaxy Cluster in performance.

Teletype's `CV 1` is designed to assist the modulation of Galaxy Clusters' frequency. 

For greater sense of ennui, this experiment sounds best carried out through an emulation of the echo of space, shit tons of space. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/3n9bYyZ9K1U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

This performance routes the 6 Just Friends voice outputs summed in [Nearness](https://www.modulargrid.net/e/takaab-nearness), warmed via a [Mini Drive](https://www.modulargrid.net/e/music-thing-modular-mini-drive), while [Clouds](https://www.modulargrid.net/e/mutable-instruments-clouds) and [Lubadh](https://www.modulargrid.net/e/instruo-lubadh) add decaying tape repeats.
