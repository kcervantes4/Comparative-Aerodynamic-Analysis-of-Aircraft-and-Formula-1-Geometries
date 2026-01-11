# Comparative-Aerodynamic-Analysis-of-Aircraft-and-Formula-1-Geometries
This project compares the aerodynamic performance of a conventional aircraft wing with Formula 1 front and rear wings.
# Aircraft vs Formula 1 Wing Aerodynamics

## Overview
Although both systems rely on the same aerodynamic principles, they are optimized for fundamentally different objectives:
- Aircraft wings maximize lift-to-drag efficiency
- Formula 1 wings maximize downforce for vehicle handling

Wing geometries were modeled in SolidWorks and analyzed using simplified aerodynamic theory implemented in MATLAB.

## Geometry Modeling (SolidWorks)
### Aircraft Wing
- Airfoil: NACA 2412
- High aspect ratio
- Optimized for aerodynamic efficiency

![Aircraft Wing Geometry (PDF)](aircraft_wing.pdf)

### Formula 1 Wings
- Airfoil: NACA 0012 (symmetric)
- Low aspect ratio
- Optimized for downforce generation

![F1 Front Wing (PDF)](f1_front_wing.pdf)
![F1 Rear Wing (PDF)](f1_rear_wing.pdf)


## Aerodynamic Modeling (MATLAB)

The aerodynamic analysis uses:
- Thin airfoil theory for 2D lift
- Lifting-line correction for finite-wing effects
- A simplified drag polar to estimate induced drag

Assumptions:
- Low-speed, incompressible flow
- Pre-stall conditions
- No ground effect or multi-element modeling


## Results
### Lift / Downforce vs Angle of Attack
![Lift vs AoA](figures/lift_vs_aoa.png)

- Aircraft wing generates positive lift
- F1 wings generate negative lift (downforce)
- Rear wing produces greater force magnitude

### Aerodynamic Efficiency Comparison
![Efficiency Comparison](efficiency_comparison.png)

- Aircraft wing achieves significantly higher efficiency (L/D)
- F1 wings sacrifice efficiency to generate force

### Aspect Ratio Sensitivity
![AR Sensitivity](ar_sensitivity.png)

- Increasing aspect ratio improves lift-to-drag ratio
- Confirms dominant influence of wing geometry


## Key Takeaways
- Identical aerodynamic principles lead to different designs based on performance objectives
- High aspect ratio is critical for efficiency
- Low aspect ratio and aggressive angles of attack enable high downforce at the cost of drag
  
## MATLAB Analysis
[aero_comparison.m](aero_comparison.m)

## Full Report
A detailed report with complete methodology, results, and discussion is available here:
[Full Project Report (PDF)](aircraft_vs_f1_aero_report.pdf)

## Tools Used
- SolidWorks (CAD)
- MATLAB (aerodynamic modeling)
