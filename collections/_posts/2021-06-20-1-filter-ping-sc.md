---
layout: post
title: "Strikes and Resonance"
date: 2021-06-20
content_id: 5
author: "Ryan"
type: "Praxis"
ascii: "+"
x: 2
y: 2
class: red
attributes: ["filter", "resonance", "comb", "karplus-strong"]
---
# Splash

Pinging resonant bandpass, low pass, or high pass filters creates a sine-like ringing as the filter sculpts an incoming peak into its native rippling, just as the surface of a pond does to sudden interruption by a rock. The relationship of a quick strike agitating a vibrating, ringing body can be found in abundance elsewhere in the physical and sonic universe.

## SuperCollider Example One: Two sides of a coin
![Filter Ping IRL](/assets/content/sc-pings-scope.png)

Here is an example in SuperCollider of a [pinged filter](#4) alongside a simple [Karplus-Strong](https://en.wikipedia.org/wiki/Karplus%E2%80%93Strong_string_synthesis) model. The two filters differ both in ringing and excitation. The mix between is controlled by the X-axis of the mouse, so the further left, the more bandpass filter, and the less the comb filter. 

```SuperCollider
({
  // variables
  var trig, note, env, fade, bpf, comb;

  // rhythm: 8th notes @ 120bpm
  trig = Impulse.kr(4);

  // note: randomly, from a scale
  note = Demand.kr(trig: trig,
    reset: 0,
    demandUGens: Drand(
      list: [48,60,72] +.x [0,2,7,9], // 3 octaves
      repeats: inf));

  // exciter: a simple, fast envelope
  env = EnvGen.ar(
    envelope: Env.perc(
      releaseTime: 0.01,
      level: 50,
      curve: 0),
    gate: trig);

  // mix control: mouse
  fade = MouseX.kr(minval: 0, maxval: 1);

  // filters: bandpass + comb
  bpf = Resonz.ar(
    in: env,
    freq: note.midicps,
    bwr: 0.01, // lower is ringier
    mul: (1 - fade) * 5).tanh; // soft clip
  comb = CombL.ar(
    in: env * PinkNoise.ar(0.03),
    delaytime: note.midicps.reciprocal,
    decaytime: 0.5,
    mul: fade * 0.2);

  // output: sum, remove bias, stereoize
  LeakDC.ar(bpf + comb) ! 2
}.scope);
```
<audio controls src="/assets/content/sc-pings-1.mp3"></audio>


## SuperCollider Example Two: Geometric Ripples
This example uses the same filter types, but there are some important differences:
1. The bpf is now in serial before the comb.
2. The comb is now tuned statically to 55Hz.
3. The bpf now plays harmonics of 55Hz.

```SuperCollider
({
  // variables
  var trig, harmonic, env, bpf, comb;

  // rhythm: 8th notes @ 120bpm
  trig = Impulse.kr(4);

  // harmonics: random from 1 to 12
  harmonic = Demand.kr(trig: trig,
    reset: 0,
    demandUGens: Diwhite(lo: 1, hi: 12, length: inf));

  // exciter: a simple, fast envelope
  env = EnvGen.ar(
    envelope: Env.perc(
      releaseTime: 0.001,
      level: 50,
      curve: 0),
    gate: trig);

  // filters: bandpass, comb
  bpf = Resonz.ar(
    in: env,
    freq: 55 * harmonic,
    bwr: 0.1,
    mul: 0.2
  );
  comb = CombL.ar(
    in: bpf,
    delaytime: 55.reciprocal,
    decaytime: 1);

  // output: soft-clip, remove bias, stereoize
  LeakDC.ar(comb).tanh ! 2
}.scope);
```
<audio controls src="/assets/content/sc-pings-2.mp3"></audio>

## SuperCollider Example Three: Simple Allpass Reverb
This example is quite a bit different from the other two. Now, the tuning is completely random, and instead of a bandpass or comb filter, we have 10 allpass filters. This creates a primitive reverb. As in the first example, the mouse X axis controls the audio - this time, it is the maximum length of the allpass delay, as sampled each strike.

This sounds much different from the previous two but is another example of a strike exciting a resonator to create a percussive sound with a natural decay.

```SuperCollider
({
  // variables
  var trig, reverb, maxTime;

  // rhythm: once every four seconds
  trig = Impulse.kr(1/4);

  // maxTime: sampled on each strike
  maxTime = MouseX.kr(minval: 0.001, maxval: 0.2, warp: 1);

  // filters: allpass
  reverb = Mix.ar(((1..10)).collect({
    var delayTime = Demand.kr(
      trig: trig,
      reset: 0,
      demandUGens: Dwhite(lo: 0.01, hi: maxTime));
    var pan = Demand.kr(
      trig: trig,
      reset: 0,
      demandUGens: Dwhite(lo: -1, hi: 1));
    var filter = AllpassC.ar(
      in: trig,
      delaytime: delayTime,
      decaytime: 4);
    Pan2.ar(in: filter, pos: pan, mul: 2);
  }));
  // amplify
  reverb = reverb * 5;

  // output: mix, soft clip
  (reverb + trig).tanh;
}.scope);
```
<audio controls src="/assets/content/sc-pings-3.mp3"></audio>

## Observations
* How do the filters' timbre differ?
* How do the filters' low/high end differ?
* How do the filters' dynamics differ?
* How does their behavior change based on frequency?
* How does seeing or hiding the scope feel different?
* What other configurations come to mind?

---