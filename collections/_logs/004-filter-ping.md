---
content_id: 4
author: "Tyler"
type: "Praxis"
ascii: "!"
x: 1
y: 1
class: red
attributes: ["transistor", "filter"]
---
## The Filter Ping

This log describes how to create a percussive sound with an envelope and a filter. Any envelope and filter will do. You'll also need a way to trigger the envelope, along with a way to listen to the output of the filter.

![Filter Ping IRL](/assets/logs/filter-ping-irl.jpg)

---

### Ingredients

1. Envelope generator
2. Filter
3. Envelope trigger
4. Audio interface

---

### Filter Ping Example

1. Set your envelope to a very short attack. Something between `0ms` and `10ms` should do. Set your decay and/or release (depending on your instrument) to have a smooth curve.
![Filter Envelope IRL](/assets/logs/filter-ping-envelope.jpg)
2. Route this envelope's output to the filter's input. (This may feel counter-intuitive as typical use of a filter has the synthesist routing audio-rate signals here.) Route the filter's output to your audio interface so you can hear it.
3. Increase your filter's resonance to the maximum.
4. Trigger the envelope.

It may look like this:
![Modular Example](/assets/logs/filter-ping-example.jpg)

 - **Yellow Cable:** clock output (here randomized) to envelope trigger input.
 - **Red Cable:** envelope ouput to filter input.
 - **Blue Cable:** Filter output (here band pass) to audio interface.

And it may sound like this:

<audio controls src="/assets/logs/filter-ping-example.mp3"></audio>

---

### Advanced Filter Ping Example

Following the same concept as before, now add modulation. Here, we use a [Teletype](https://monome.org/docs/teletype) but something like a [Maths](https://www.makenoisemusic.com/modules/maths) or any other envelope generator/follower will suffice. Teletype is standard issue at the University of Maps for its versatility and ability to "self-document" behavior in patch photographs.

![Modular Advanced Example](/assets/logs/filter-ping-advanced-example.jpg)

 - **White Cable:** clock output (here randomized) to buff mult.
 - **Green Cable:** clock buff mult to Teletype in #1.
 - **Grey Cable:** Teletype CV #1 output to filter frequency modulation input.
 - **Yellow Cable:** clock buff mult to envelope trigger input.
 - **Red Cable:** envelope ouput to filter input.
 - **Blue Cable:** Filter output (here band pass) to audio interface.

It may sound like this:

<audio controls src="/assets/logs/filter-ping-advanced-example.mp3"></audio>

---

### Conclusion

Generating percussive sounds with filter pinging ruptures and problematizes our usual relationship with filters. Filters are tools of subtraction. With this simple electrical "hack" the synthesist instead gives voice to the silencer.