Sets 
    c                  Track continuous variables          /c1*c563/ 
    i                  Track linear equality constraints   /i1*i366/ 
    j                  Track linear inequality constraints /j1*j74/ 
    stat               Model and Solver status   /modelstat,solvestat/; 

Variables 
    x(c)                List of continuous variables 
    mvd                 Objective function -- Minimum vapor duty; 

Parameters 
    objf(c)             Contains coefficients of variables in objective 
    Aeq(i,c)            Continuous var coefficients in equality constraints 
    Aineq(j,c)          Continuous var coefficients in inequality constraints 
    beq(i)              RHS of equality constraints 
    bineq(j)            RHS of inequality constraints 
    xlb(c)              Lower bound on continuous variables 
    xub(c)              Upper bound on continuous variables 
    xip(c)              Initial point for local search; 

$GDXIN 'Feedcase81_1_data.gdx' 
$LOADDC objf Aeq Aineq beq bineq xlb xub xip
$GDXIN 

Equations 
    vapduty             Objective function 
    leqcon(i)           Linear equality constraints 
    lineqcon(j)         Linear inequality constraints; 

vapduty..       mvd =e= sum(c,objf(c)*x(c));
leqcon(i)..     sum(c,Aeq(i,c)*x(c)) =e= beq(i);
lineqcon(j)..   sum(c,Aineq(j,c)*x(c)) =l= bineq(j);

$OnText 
Nonlinear constraints begins 
First, Underwood feed equations are imposed followed by minimum vapor 
constraints and Distillation constraints 
$OffText 

Equation  nl1;  
* Feed eqn. for [1,1,2,3] & Theta(1) 
nl1..  
    +(17.187500*x('c20')/(17.187500-x('c545'))) 
    +(6.875000*x('c21')/(6.875000-x('c545'))) 
    +(2.750000*x('c22')/(2.750000-x('c545'))) 
    -x('c450') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,3,4,4] & Theta(3) 
nl2..  
    +(17.187500*x('c132')/(17.187500-x('c549'))) 
    +(6.875000*x('c133')/(6.875000-x('c549'))) 
    +(2.750000*x('c134')/(2.750000-x('c549'))) 
    +(2.500000*x('c135')/(2.500000-x('c549'))) 
    -x('c466') =e= 0; 

Equation  nl3;  
* Feed eqn. for [2,2,3,3] & Theta(2) 
nl3..  
    +(6.875000*x('c264')/(6.875000-x('c554'))) 
    +(2.750000*x('c265')/(2.750000-x('c554'))) 
    -x('c468') +x('c478') =e= 0; 

Equation  nl4;  
* Feed eqn. for [3,3,4,5] & Theta(3) 
nl4..  
    +(2.750000*x('c410')/(2.750000-x('c561'))) 
    +(2.500000*x('c411')/(2.500000-x('c561'))) 
    +(1.000000*x('c412')/(1.000000-x('c561'))) 
    +x('c500') =e= 0; 

Equation  nl5;  
* Feed eqn. for [4,4,5,5] & Theta(4) 
nl5..  
    +(2.500000*x('c446')/(2.500000-x('c563'))) 
    +(1.000000*x('c447')/(1.000000-x('c563'))) 
    +x('c506') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl6;   
* Rectifying section equation for [1,1,2,3] & Theta(1) 
nl6..  
    +(17.187500*x('c17')/(17.187500-x('c545'))) 
    -x('c13') =l= 0; 

Equation  nl7;   
* Stripping section equation for [1,1,2,3] & Theta(1) 
nl7..  
    -(6.875000*x('c18')/(6.875000-x('c545'))) 
    -(2.750000*x('c19')/(2.750000-x('c545'))) 
    -x('c14') =l= 0; 

Equation  nl8;   
* Rectifying section equation for [1,3,4,4] & Theta(3) 
nl8..  
    +(17.187500*x('c128')/(17.187500-x('c549'))) 
    +(6.875000*x('c129')/(6.875000-x('c549'))) 
    +(2.750000*x('c130')/(2.750000-x('c549'))) 
    -x('c124') =l= 0; 

Equation  nl9;   
* Stripping section equation for [1,3,4,4] & Theta(3) 
nl9..  
    -(2.500000*x('c131')/(2.500000-x('c549'))) 
    -x('c125') =l= 0; 

Equation  nl10;   
* Rectifying section equation for [2,2,3,3] & Theta(2) 
nl10..  
    +(6.875000*x('c262')/(6.875000-x('c554'))) 
    -x('c258') =l= 0; 

Equation  nl11;   
* Stripping section equation for [2,2,3,3] & Theta(2) 
nl11..  
    -(2.750000*x('c263')/(2.750000-x('c554'))) 
    -x('c259') =l= 0; 

Equation  nl12;   
* Rectifying section equation for [3,3,4,5] & Theta(3) 
nl12..  
    +(2.750000*x('c407')/(2.750000-x('c561'))) 
    -x('c403') =l= 0; 

Equation  nl13;   
* Stripping section equation for [3,3,4,5] & Theta(3) 
nl13..  
    -(2.500000*x('c408')/(2.500000-x('c561'))) 
    -(1.000000*x('c409')/(1.000000-x('c561'))) 
    -x('c404') =l= 0; 

Equation  nl14;   
* Rectifying section equation for [4,4,5,5] & Theta(4) 
nl14..  
    +(2.500000*x('c444')/(2.500000-x('c563'))) 
    -x('c440') =l= 0; 

Equation  nl15;   
* Stripping section equation for [4,4,5,5] & Theta(4) 
nl15..  
    -(1.000000*x('c445')/(1.000000-x('c563'))) 
    -x('c441') =l= 0; 

Model qp /all/;

x.lo(c) = xlb(c); x.up(c) = xub(c); x.l(c) = xip(c);
Option nlp=ipopt;
Option Reslim = 60;
Solve qp minimizing mvd using nlp;


Parameter returnStat(stat);
returnStat('modelstat') = qp.modelstat;
returnStat('solvestat') = qp.solvestat;
Execute_unload 'Feedcase81_1_sol', x, mvd, returnStat 

