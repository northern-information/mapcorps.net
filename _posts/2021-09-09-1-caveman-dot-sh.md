---
layout: post
title: "caveman.sh"
date: 2021-09-09
content_id: 19
author: "Tyler"
type: "Praxis"
ascii: "#"
x: 3
y: 12
class: rock_bash
attributes: ["shell", "fish", "zsh", "bash", "rock", "stone", "fire"]
---
Keen-eyed cartographers may have heard susurrations of `caveman.sh` lately - a ponderous and potentially pejorative term, especially when coupled with decrees of "apes" and other such nonsense. Fear not. Apes and caveman shell scripting are your friends. They're here to help. In this post, I'm going to attempt to sketch out some design implications of `caveman.sh`, what it means for technology, how it intersects with music, and why `caveman.sh` may be the panacea you've been searching for.

From my lived experience, there are two main schools of thought when it comes to technology, particularly in the open source world. One is idealism. The other is pragmatism.

---

## School 1: Idealism

The first school is that of the idealists. Idealists are gatekeepers. Code ought not be pushed to production until all unit tests pass, every edge case is considered, the latest syntax/library/frameworks are used. There is a time and place for this (such as mission critical systems like spacecraft or remote-surgery) but most of the time, I find it to be overkill. I've seen many a young apprentice's creativity dashed with increasingly impossible and mutable goalposts. "Oh that works, but you didn't consider this edge case. Back to the drawing board, sonny." This toxic mentality hinders progress and can be a major turn off to exploring and building your own tooling.

> What’s more important than idealism is getting shit done - especially when it comes to art.

What we forget is that we are already more technically competent than... I can't put a number on it, but think about everyone in your non-music/tech social sphere and tell me what percentage you could have an engaging conversation with about your current music/code/tech/scripting project. I don't offer this thought experiment as some type of communal aggrandizement ("we're smarter than you!" blah.) No! I offer it as an an opportunity to see things for how they are: you know *a lot* about technology. Your ideas are valid. Your skills are valid. There is always more to learn, sure. (And I know less every day.) Know there are those out there who enjoy keeping you down, enjoy staying on top of their crumbling totem pole of superiority.

What's more important than idealism is *getting shit done* - especially when it comes to art. Fuck gatekeepers.

---

## School 2: The Pragmatists

The other school is that of pragmatism: whatever gets the job done is "good enough for metal" as we used to say in my band. Nasty, dirty `grep` and `sed` and `regex` and a whole myriad of unix tools chained together to accomplish some task. One time, I was consulting for a major distributor of printed materials. Their ecommerce site was about to be pulled offline due to a lapse in the license agreement. We needed a stopgap. It would be months until the new site was ready. What did I do? Wrote one of the most disgusting and beautiful shell scripts ever - recursively scrape their site, save each page as a raw `.html` file, build up a  directory structure that mirrored the URL schema so there were no dead links, and scoop up all the assets (images, etc.) to dump them in a directory. Hardlink everything. Replace all "buy now" buttons with a `mailto:orders@company.com`. The shell script was maybe 30 lines. I fired the script off and to my glee, it worked with only one or two adjustments. I symlinked the static site from the live one and no one was the wiser. It was *gross* - but it is still something I'm immensely proud of. It took me one sitting to complete. This is `caveman.sh`. No idealist would ever have arrived at this solution.

---

## caveman.sh

While "mapcore" is a *philosophy*, `caveman.sh` is a *strategy*. Philosophies shape how you see the world. Strategies inform how you approach tactical goals. And tactics are the least common denominator of action your actions.

> Philosophies shape how you see reality which lead to strategy for negotiating with the world. Strategies inform how you approach tactical goals.

An example: my *philosophy* for Song X is to let the technology guide the music. As Marshall McLuhan said, "the medium is the message." How do you get there though? With a strategy. My *strategy* for Song X is to build a specialized configuration of guitar pedals and a small norns script that has aspects of my intuition encoded. My *tactics* for performing the piece are pressing keys on my grid and turning the filter cutoff knob.

So what the hell is `caveman.sh`? It's radical acceptance of your self. It is radical acceptance that your "dumb" idea to "just store the chords in a list" or "just write as few lines as possible to get softcut going" or "just bounce everything to Ableton and clean it up later" is 100% okay and valid. `caveman.sh` is not comparing yourself to the great ones. `caveman.sh` is not worrying about "if you're doing it the right way." `caveman.sh` is taking a rock, smashing it into the coconut, and drinking deeply.

---

## Conclusion

Make art with what you have right now. Make code with what you know right now. The path is endless. Do not hold your work in abeyance for the day when you know "how to do it right." There are millions of ways to do it right. There is only one way to do it wrong, and that's to not do it at all.

`caveman.sh` make bang.

Apes together strong.