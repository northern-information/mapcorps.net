---
layout: post
title: "Turing the Tonality Diamonds"
date: 2021-08-01
content_id: 15
author: "Naomi"
type: "Praxis"
ascii: "W"
x: 5
y: 7
class: diamond
attributes: ["just", "intonation"]
---
Adrift on the waves, it just so happened that my boat began rocking in a most delightful manner — rich and yet simple, four smaller crests matched against three larger crests, again and again, then rougher, seven smaller crests for every five larger ones, and then I was thrust ashore on the beach of an island I had not heard the like of before.

---

## Between a Frequency

When you pluck a string, or blow into a wind instrument, it vibrates. Not only does it vibrate in the pitch you hear, it also vibrates in multiples of that — twice the frequency, thrice it, four times it, and so on.

When we hear multiple frequencies at once, we tend to perceive them as "consonant" (con "same"; sonant "sounding") when the number of waves in a period of time is related like a string or wind instrument's harmonics, by some relatively simple fraction (see also Trent's [map](https://www.youtube.com/watch?v=_xw_x4xREGk)) — for example, when there are three waves of this sound in the time it takes to make two waves of that sound, your human (editor: mostly human?) brain perceives them as if they could be part of the same sound, and so they sound "consonant"; they seem like a place you could musically rest. The more high factors you need for your fraction — seven, say, or 11, or even *two* factors of seven (gasp!) the more dissonant (dis- "apart" sonant "sounding") you're likely to find that interval. You can pretty much include as many factors of two as you want, either in the numerator (o(ver)tonality!) or denominator (u(nder)tonality!) for free and your fraction stays equally consonant (or dissonant).

---

_The well-traveled territory of pitch takes the space between a frequency and double that frequency , and divides it into twelve even slices. Take your first frequency and multiply it by the twelfth root of two, you get a "half step" up. Do that eleven more times, and you've multiplied by the twelfth root of two to the power of twelve, and you've got an octave. This is called Equal Temperament._

![Root and Octave](/assets/content/turing-the-tonality-diamonds-root-and-octave.png)

```

SinOsc.kr([1,2])

```

> "In tune" joins gender, government, and marriage as a social construct, though by claiming something a social construct I don't cast any doubt on its reality.

_Equal temperament was initially a simulation, a compromise approximation of musical pitch to allow making a wide variety of consonant intervals starting at any given pitch in the system. From any note in equal temperament you can find 2^(7/12)=1.49830707688 up from it — very close, but not exactly, 3/2, a perfect fifth. You can find 2^(3/12)=1.189207115 — somewhat close, and less exactly 6/5, a minor third. It's not the justly intoned ratios, but at this point most people who listen to it are so used to it they may culturally consider it more consonant than the just tuning. "In tune" joins gender, government, and marriage as a social construct, though by claiming something a social construct I don't cast any doubt on its reality._

---

So anyway how about a map of overtones and undertones?

|       | **1** | **3** | **5** | **7** | **9** |
| ----- | ----- | ----- | ----- | ----- | ----- |
| **1** | 1     | 3     | 5     | 7     | 9     |
| **3** | 1/3   | 1     | 5/3   | 7/3   | 3     |
| **5** | 1/5   | 3/5   | 1     | 7/5   | 9/5   |
| **7** | 1/7   | 3/7   | 5/7   | 1     | 9/7   |
| **9** | 1/9   | 1/3   | 5/9   | 7/9   | 1     |

Remember you can freely scale numerators or denominators by two, and your mind will hear the tone as belonging to the same "note", just in a different octave. Here's all those notes in the same octave:

|       | **1** | **3** | **5** | **7** | **9** |
| ----- | ----- | ----- | ----- | ----- | ----- |
| **1** | 1     | 3/2   | 5/4   | 7/4   | 9/8   |
| **3** | 4/3   | 1     | 5/3   | 7/6   | 3/2   |
| **5** | 8/5   | 6/5   | 1     | 7/5   | 9/5   |
| **7** | 8/7   | 12/7  | 10/7  | 1     | 9/7   |
| **9** | 16/9  | 4/3   | 10/9  | 14/9  | 1     |


If you play pitches from this map you'll get... something interesting! It might be musical! It might not! The lower the non-two factors of the numerator and denominator are, the more consonant it'll sound played against 1/1, the tonic. Fractions with matching numerators or denominators will sound more consonant when played against each other. Draw a small polity on the map by picking some fractions, listen, and hear its tension-elevation in the interplay of the fractions against each other.

---

## Teletype Time

![Alan Turing](/assets/content/turing-the-tonality-diamonds-alan.jpg)

_Alan Turing_


How about... a version of the Music Thing Turing Machine, in Teletype based on these principles? 

Let's make our first two patterns the numerator and denominator, respectively.

Let's have `T` be our counter; we will do something with it in a sec in `M`. Here's some code to output a note of it, both to Just Friends and CV. Using Just Friends, it's in `PLUME` mode, set to sound/sustain and in `RUN` mode. I have this in `$ 4`:

```

Z + 1 % T 6                 # Just Friends has six 1-indexed outputs; assign each a step of a pattern
J PN 0 % T 6; K PN 1 % T 6  # Make J our numerator, K our denominator
W < / J K Z: J * 2 J        # Scales the fraction to be "near" the standard JF note
W > / J K Z: K * 2 K        # Ditto above.
JF.TUNE Z J K               # Set the output of Just Friends to the fraction we picked
                            # Alternate for any VCO: CV 4 JI J K

```

And here's what's in `$ M` to play this sequence:

```

T % + T 1 6000        # TIME MARCHES ON
$ 4                   # Remember 4? We call it here.
$ 3                   # We'll use this in a sec
JF.TR Z 1             # We set Z over in 4 to be a JF input number. Ping it here.
DEL / M 8: JF.TR 0 0  # Always shut off all the JF outputs after a short time.
                      # Alternate for any VCO: TR.P 4

```

To be a Turing machine-like, we want some knob to turn to "lock in" patterns we like, or allow variance. But using our map, maybe we'd like to have a directed walk of the space, where we can decide whether to walk uphill (increasing our musical tension by making our fractions less related to each other), or walk downhill (resolving musical tension by relating our fractions to each other more). 

To walk uphill, `$ 1`:

```

P.N TOSS                # Pick a pattern any pattern if it's 0 or 1
P - Z 1 + 1 * 2 % R 5   # Add a random odd number to the pattern at our Z-index

```

To walk downhill, `$ 2`:

```

P.N TOSS        # Same deal, pick a pattern.
J P % R 6       # Random member
IF > J 5: J 1   # Keep the fractions simpler
P.N TOSS        # Pick a pattern again.
P - Z 1 J       # Add it back at the Z-index

```

To choose, first put `PARAM.SCALE -100 100` in `$ I`.

Then in `$ 3`: 

```

J ABS PARAM                    # Probability of taking an action.
K ? < RRAND -99 99 PARAM 1 2   # Which action to take. CCW walks more downhill, CW up.
PROB J: $ K                    # Potentially run the script.

```

You should now have a just intonation arpeggio running out of JF (or `CV 4` and `TR 4`) turing-machine style. Experiment with param knob position. The middle locks your sequence; counter clockwise increases musical tension, and CCW decreases musical tension. I like having it set around 15, and then occasionally turning it CCW to release tension. Careful with that CCW; too-far-too-long and you'll end up sliding down the mountain of musical tension into the sea of all-notes-the-same.

With the amount of `JF.RUN` quite `DRUNK`, one path through the map sounds something like this:

<audio controls src="/assets/content/turing-the-tonality-diamonds-example.mp3"></audio>


---

## Tonality Diamonds are Forever

> These maps have no key, and the pictograms scrawled over the ocean have been meaningless for centuries.
>
> &mdash; nonverbalpoetry (they/ them)

This is where I have been lately, and where I have been able to sketch a map. The maps have no key. The maps have every key, and are made of keys. When I return I hope to find the keys within the map, and explore the effects of your speed on your tonal location.

In the meantime, I have learned these islands I've visited are known as the [Tonality Diamonds](https://en.wikipedia.org/wiki/Tonality_diamond), should you want to read more about them.

