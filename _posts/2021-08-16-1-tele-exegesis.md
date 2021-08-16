---
layout: post
title: "tele-exegesis"
date: 2021-08-16
content_id: 17
author: "tehn"
type: "historical record"
ascii: "."
x: 4
y: 9
class: evolution
attributes: ["ash", "stars"]
---

the year was maybe 2013 but maybe not.

despite having grown up typing code we'd fallen into graphical
patching. the pre-2k appeal was strong: max just got msp, os's were a
take-it-leave-it black box, and we were primarily concerned with what
came from tools, not the tools themselves. so in 2013ish meadowphysics
emerged with embedded javascript, creating brain sparks soon to ignite
lazily-accepted and too-dearly-held doctrines alike. it was an
algo-grid thing that generated triggers, and we were left to make
that musical by our own wits.

after assigning each trigger to a midi note (which is some sort of
standard practice) we could no longer tolerate what sounded like a
depressing casino. a trigger should be able to change timbre or a
progression of all sorts of other parameters to allow something
actually generative.

the first incarnation of teletype was born, with some minor abuse of
max's semicolon message system:

![](/assets/content/tele-exegesis-teletype.png)

meadowphysics now routed its triggers through 8 little "scripts" that
could create a note, advance a note in a sequence, send CC, and change
parameters. but what made this different was the ability to modulate,
with code. a probability operator set chance of execution, and a
random operator gave back a value within a given range. slews for
params could be set dynamically, along with note transposition.

```
note 4;
cc a rand 50 100;
p 50 note rand note;
```

is this programming? maybe? it sounded good, thanks to trent gill's
synth engine stolen from sum. a short time on the meta-programmable
event responder seemed a good fit for modular, with its agnostic to
whatever-happens triggers on wires.

it's safe to assume the original patch has been alienated and abandoned by the
speed of technology updates, but for historical interest it still
lives in the [reaches](https://github.com/monome/teletype-maxpat).

safe travels.
