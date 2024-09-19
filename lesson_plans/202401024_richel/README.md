# Lesson plan R by Richel

- Date: Tuesday 2024-10-24
- Course: R, part of [R, Python, Julia, and Matlab in HPC](https://github.com/UPPMAX/R-python-julia-matlab-HPC/)

## Suggest new draft schedule

### Old schedule

Time     |Topic                            |Teacher
---------|---------------------------------|-------
9:00 |Syllabus                         |Richel
9:10 |R in general                     |Richel
9:20 |Load modules and run             |Richel
9:45 |Break                            |.
10:00|Packages                         |Birgitte
10:30|Break                            |.
10:45|Kebnekaise, ThinLinc & RStudio   |Pedro
.        |UPPMAX: ThinLinc, RStudio, inter-|Richel <--- NEW
11:15|Parallel                         |Pedro
11:50|Break or informal chat           |All
12:00|Lunch                            |.
13:00|Isolated environments            |Birgitte
13:20|Batch                            |Birgitte
13:50|Break                            |.
14:00|ML                               |Birgitte or Pedro <--- NEW
14:35|Conclusion & Q/A                 |All
14:45|Evaluation                       |.
15:00|END                              |.

Notes:

- 9:15-10:00 is first login
- 10:00-10:15 is first break
- Day ends at 16.00
- interactive must get 15 more minutes to do 1 core + 2 core
- more time for parallel
- more time for questions

### Suggestion

Current durations:

Topic                            |Current duration (mins)
---------------------------------|---------------
Syllabus                         |10
R in general                     |10
Load modules and run             |25
Packages                         |30
Kebnekaise, ThinLinc & RStudio   |30
UPPMAX: ThinLinc, RStudio, inter-|. (in parallel)
Parallel                         |35
Isolated environments            |20
Batch                            |30
Machine learning                 |35
Total                            |225

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

This means I can add 30 minutes. Here I distribute these from the notes:

Topic                            |Current duration (mins)
---------------------------------|---------------
Syllabus                         |10
R in general                     |10
Load modules and run             |25
Packages                         |30
Kebnekaise, ThinLinc & RStudio   |30 + 15
UPPMAX: ThinLinc, RStudio, inter-|. (in parallel)
Parallel                         |35 + 10
Isolated environments            |20 + 5
Batch                            |30
Machine learning                 |35
Total                            |225 + 30 = 255

Now fitting this into the schedule:

Time       |Topic                          |Teacher
-----------|-------------------------------|-------
09:00-09:45|First login                    |?RB
09:45-10:00|Break                          |.
10:00-10:10|Syllabus                       |RB
10:10-10:20|R in general                   |RB
10:20-10:45|Load modules and run           |RB
10:45-11:00|Packages 15/30                 |BB
11:00-11:15|Break                          |.
11:15-11:30|Packages 15/30                 |BB
11:30-12:00|Parallel session 30/45 mins    |PO * RB
12:00-13:00|Lunch                          |.
13:00-13:15|Parallel session 15/45 mins    |PO * RB
13:15-14:00|Parallel                       |PO
14:00-14:15|Break                          |.
14:15-14:40|Isolated                       |BB
14:40-14:55|Batch 15/30 mins               |BB
14:55-15:10|Break                          |.
15:10-15:25|Batch 15/30 mins               |BB
15:25-16:00|Machine learning               |BB or PO

Parallel session:
 - Kebnekaise: ThinLinc & RStudio, by PO
 - UPPMAX: ThinLinc, RStudio, interactive, by RB

Discussion points:

- For this schedule, 10 mins was reduced from ML. Do we agree?
  - If yes: no problemo
  - If no: where else will 10 mins be subtracted from? 
- For this schedules, breaks were scheduled first, so that
  (1) schedule is simple, and (2) all session lengths are 45 or 60 mins.
  However, assuming all durations are correct (!), some sessions will be
  cut by a break. Is that acceptable?
  - If yes: no problemo
  - No: where should the breaks be instead? Who makes a new schedule?
- R: There is no time for evaluation at the end. I feel 5 minutes
  is enough and the time is worth it. I suggest to add it.
