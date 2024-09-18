# Lesson plan Python by Richel

- Date: Tuesday 2024-10-22
- Course: Python, part of [R, Python, Julia, and Matlab in HPC](https://github.com/UPPMAX/R-python-julia-matlab-HPC/)

## Suggest new schedule

### Old schedule

Time     |Topic                                      |Teacher
---------|-------------------------------------------|-------
**9.00** |Syllabus                                   |Rebecca
**9.10** |Python in general                          |Rebecca
**9.20** |Load modules and run                       |Rebecca
**9.45** |Break                                      |.
**10:00**|Packages                                   |Richel
**10.30**|Break                                      |.
**10.45**|Isolated environments (ML, venv, **conda**)|Richel
**11:45**|Break or informal chat                     |Richel 
**12.00**|Lunch                                      |.
**13.00**|Batch                                      |Birgitte
**13:20**|GPU                                        |Birgitte
**13.30**|Kebnekaise: Jupyter                        |Birgitte
.        |Rackham: Interactive session and Jupyter   |Richel
**13.45**|Break                                      |.
**14.00**|Parallel and multithreaded functions       |Pedro
**14.25**|Conclusion & Q/A                           |Birgitte
**14.45**|.                                          |.
**15.00**|END 

Notes:

- 9:15-10:00 is first login
- 10:00-10:15 is first break
- Day ends at 16.00
- interactive must get 15 more minutes to do 1 core + 2 core
- more time for sbatch and GPU

### Suggestion

Current durations:

Topic                                      |Current duration (mins)
-------------------------------------------|---------------
Syllabus                                   |10
Python in general                          |10
Load modules and run                       |25
Packages                                   |30
Isolated environments (ML, venv, **conda**)|60
Batch                                      |20
GPU                                        |10
Kebnekaise: Jupyter                        |15
Rackham: Interactive session and Jupyter   |. (parallel with Kebnekaise)
Parallel and multithreaded functions       |25
Total                                      |205

Session durations in time:

Time       |Topic                                      |Duration (mins)
-----------|-------------------------------------------|-------
09:00-09:45|First login                                |(45)
09:45-10:00|Break                                      |.
10:00-11:00|Session 1                                  |60
11:00-11:15|Break                                      |.
11:15-12:00|Session 2                                  |45
12:00-13:00|Lunch                                      |.
13:00-14:00|Session 3                                  |60
14:00-14:15|Break                                      |.
14:15-15:00|Session 4                                  |45
15:00-15:15|Break                                      |.
15:15-16:00|Session 5                                  |45
Total                                                  |255

This means I can add 50 minutes. Here I distribute these from the notes:

Topic                                      |Current duration (mins)
-------------------------------------------|---------------
Syllabus                                   |10
Python in general                          |10
Load modules and run                       |25 + 5
Packages                                   |30
Isolated environments (ML, venv, **conda**)|60
Batch                                      |20 + 10
GPU                                        |10 + 10
Kebnekaise: Jupyter                        |15 + 15
Rackham: Interactive session and Jupyter   |. (parallel with Kebnekaise)
Parallel and multithreaded functions       |25 + 10
Total                                      |205

Now fitting this into the schedule:

Time       |Topic                                                 |Teacher
-----------|------------------------------------------------------|-------
09:00-09:45|First login                                           |?RB
09:45-10:00|Break                                                 |.
10:00-10:10|Syllabus                                              |RP
10:10-10:20|Python in general                                     |RP
10:20-10:50|Load modules and run                                  |RP
10:50-11:00|Packages 10/30                                        |RB
11:00-11:15|Break                                                 |.
11:15-11:35|Packages 20/30                                        |RB
11:35-12:00|Isolated environments (ML, venv, **conda**) 25/60 mins|RB
12:00-13:00|Lunch                                                 |.
13:00-13:35|Isolated environments (ML, venv, **conda**) 35/60 mins|RB
13:35-14:05|Batch 30/30 mins                                      |BB
14:05-14:20|Break                                                 |.
14:20-14:40|GPU                                                   |BB
14:40-15:00|Parallel session 20/30 mins                           |BB * RB
15:00-15:15|Break                                                 |.
15:15-15:25|Parallel session 10/30 mins                           |BB * RB
15:25-16:00|Parallel and multithreaded functions                  |PO

Discussion points:

- For this schedules, breaks were scheduled first, so that
  (1) schedule is simple, and (2) all session lengths are 45 or 60 mins.
  However, assuming all durations are correct (!), some sessions will be
  cut by a break. Is that acceptable?
  - If yes: no problemo
  - No: where should the breaks be instead? Who makes a new schedule?
- I picked to discuss batch (by BB) from 13:35-14:05, 
  over having a break at 14:00 and having a 5 minute session
  with a schedule like below. Agreed?

Time       |Topic                                                 |Teacher
-----------|------------------------------------------------------|-------
13:35-14:00|Batch 25/30 mins                                      |BB
14:00-14:15|Break                                                 |.
14:15-14:20|Batch 5/30 mins                                       |BB
