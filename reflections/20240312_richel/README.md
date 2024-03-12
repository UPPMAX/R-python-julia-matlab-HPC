# Reflection

I prepared well for the lessons, as I remembered from the
previous course iteration that my material was not blended
in with the others. This iteration, my material was 100% part of the
course website and I removed the presentation slides from the
previous iteration.

Although I did invest 10 + 2 + 16 + 2 = 30 hours, 
with little sleep, the day of teaching went fine.

The most obvious problem during teaching 
was that Zoom did not allow me to speak
or show video, in the main room, 
when breakout rooms are active.

I think we dealt with this technical problem 
as good as we reasonably could.

However, due to it, I cannot properly evaluate my own lessons.
I was annoyed with being this blind as a teacher:
how can I know if the learners understood, 
if I cannot see their exercises?
Also, I did not do a half-way-during-the-exercise feedback,
nor a nearly-the-end-of-the-hour feedback.
And I was unable to see if the exercise lengths 
matched the time allocated.

There were some mistakes:

- [Fixed] The exercises on venv failed due to the install of a package
  in the session before. Next time, ruthlessly 
  delete the `/home/richel/.local/lib/python3.11` folder.
  I've added this to the course material
- I could not demo going into the remote desktop website of Rackham.
  Repeat this next time!

I feel that is as much as I have to reflect on.
I think it went quite smoothly when correcting for the
technical error.

## Discussion on other sections

### Pre-requirements

I feel the pre-requirements page, https://uppmax.github.io/R-python-julia-HPC/prereqs.html, is too extensive.
I feel it should link to regular documentation and mostly show
how to determine you fullfilled all pre-requirements.

## Interactive

The session on starting an interactive session feels too fancy twice:
- create an interactice session 
  - with 1 node
  - with more nodes <--- feels beyond the teaching goals
- run 2 Python scripts, 1 of which is unsuitable for an interactive session
  with more nodes.

I think, for 15 minutes, one can only do 1 node and no Python script,
to achieve the teaching goals.

## Impressed by Birgitte

I think it was impressive that Birgitte logs in into both clusters at the start.
I want that too!

## Why ssh `-Y`

Unrelated to the course, Birgitte does so.

## Loading Python

If the session is about loading Python,
maybe seeing module dependencies can removed.

Also, don't care about python3?

Also, don't care about IPython?

## Suggest to Arvid

The Bianca portal is great. Could you do the same for Rackham?
Not every user understands one needs to use 2FA now, and how

## More time for sbatch

There was no time for an exercise.

I would have enjoy to be sure that the learners have been able
to submit a job and see the results.

## More time for GPU

There was no time for an exercise.

## More time for UPPMAX interactive and Jupyter

There was no time for an exercise.

## Parallel programming

I feel that making a script suitable (with `**FIX**` in it) 
for a parallel run is at the 'Synthesis' level of Blooms taxonomy.
I feel that some levels lower, e.g. 'Apply' with a step-by-step
guide would be more suitable.
