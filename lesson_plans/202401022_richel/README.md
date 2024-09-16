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
09:15-10:00|First login                                |.
10:00-10:15|Break                                      |.
10:15-11:00|Session 1                                  |45
11:00-11:15|Break                                      |.
11:15-12:00|Session 2                                  |45
12:00-13:00|Lunch                                      |.
13:00-14:00|Session 3                                  |60
14:00-14:15|Break                                      |.
14:15-15:00|Session 4                                  |45
15:00-15:15|Break                                      |.
15:15-16:00|Session 5                                  |45
Total                                                  |240

This means I can add 35 minutes. Here I distribute these from the notes:

Topic                                      |Current duration (mins)
-------------------------------------------|---------------
Syllabus                                   |10
Python in general                          |10
Load modules and run                       |25
Packages                                   |30
Isolated environments (ML, venv, **conda**)|60
Batch                                      |20 + 10
GPU                                        |10 + 10
Kebnekaise: Jupyter                        |15 + 15
Rackham: Interactive session and Jupyter   |. (parallel with Kebnekaise)
Parallel and multithreaded functions       |25
Total                                      |205

Now fitting this into the schedule:

Time       |Topic                                                 |Teacher
-----------|------------------------------------------------------|-------
09:15-10:00|First login                                           |?RB
10:00-10:15|Break                                                 |.
10:15-10:25|Syllabus                                              |RP
10:25-10:35|Python in general                                     |RP
10:35-11:00|Load modules and run                                  |RP
11:00-11:15|Break                                                 |.
11:15-11:45|Packages                                              |RB
11.45-12:00|Isolated environments (ML, venv, **conda**) 15/60 mins|RB
12:00-13:00|Lunch                                                 |.
13:00-13:45|Isolated environments (ML, venv, **conda**) 45/60 mins|RB
13:45-14:00|Batch 15/30 mins                                      |BB
14:00-14:15|Break                                                 |.
14:15-14:30|Batch 15/30 mins                                      |BB
14:30-14:50|GPU                                                   |BB
14:50-15:00|Parallel session 10/30 mins                           |BB * RB
15:00-15:15|Break                                                 |.
15:15-15:35|Parallel session 20/30 mins                           |BB * RB
15:35-16:00|Parallel and multithreaded functions                  |PO
