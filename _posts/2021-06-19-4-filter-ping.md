---
layout: post
title: "Filter Ping"
date: 2021-06-19
content_id: 4
author: "Tyler"
type: "Praxis"
ascii: "!"
x: 5
y: 29
class: red
attributes: ["transistor", "filter"]
---
This log describes how to create a percussive sound with an envelope and a filter. Any envelope and filter will do. You'll also need a way to trigger the envelope, along with a way to listen to the output of the filter.

![Filter Ping IRL](/assets/content/filter-ping-irl.jpg)

---

### Ingredients

1. Envelope generator
2. Filter
3. Envelope trigger
4. Audio interface

---

### Filter Ping Example

1. Set your envelope to a very short attack. Something between `0ms` and `10ms` should do. Set your decay and/or release (depending on your instrument) to have a smooth curve.
![Filter Envelope IRL](/assets/content/filter-ping-envelope.jpg)
2. Route this envelope's output to the filter's input. (This may feel counter-intuitive as typical use of a filter has the synthesist routing audio-rate signals here.) Route the filter's output to your audio interface so you can hear it.
3. Increase your filter's resonance to the maximum, then dial it back until *just after* it quiets down.
4. Trigger the envelope.

It may look like this:

![Modular Example](/assets/content/filter-ping-example.jpg)

 - **Yellow Cable:** clock output (here randomized) to envelope trigger input.
 - **Red Cable:** envelope output to filter input.
 - **Blue Cable:** Filter output (here band pass) to audio interface.

And it may sound like this:

<audio controls src="/assets/content/filter-ping-example.mp3"></audio>

---

### Advanced Filter Ping Example

Following the same concept as before, now add modulation. Here, we use a [Teletype](https://monome.org/docs/teletype) but something like a [Maths](https://www.makenoisemusic.com/modules/maths) or any other envelope generator/follower will suffice. Teletype is standard issue at the University of Maps for its versatility and ability to "self-document" behavior in patch photographs.

1. (Start from the above "Filter Ping" patch.)
2. Send the clock output to a buff mult instead of directly into the envelope input.
3. Route one of the buff mult outputs to the envelope input.
4. Route another buff mult output to Teletype input #1.
5. See photograph for Teletype scene & script implementation.
6. Route Teletype CV #1 output to a modulation target such as filter FM or frequency.

It may look like this:

![Modular Advanced Example](/assets/content/filter-ping-advanced-example.jpg)

 - **White Cable:** clock output (here randomized) to buff mult.
 - **Green Cable:** clock buff mult to Teletype in #1.
 - **Grey Cable:** Teletype CV #1 output to filter frequency modulation input.
 - **Yellow Cable:** clock buff mult to envelope trigger input.
 - **Red Cable:** envelope output to filter input.
 - **Blue Cable:** Filter output (here band pass) to audio interface.

And it may sound like this:

<audio controls src="/assets/content/filter-ping-advanced-example.mp3"></audio>

---

### Conclusion

Generating percussive sounds with filter pinging ruptures and problematizes our usual relationship with filters. Filters are tools of subtraction. With this simple electrical "hack" the synthesist instead gives voice to the silencer.