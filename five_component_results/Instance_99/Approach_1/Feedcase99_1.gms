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

$GDXIN 'Feedcase99_1_data.gdx' 
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
    +(7.562500*x('c20')/(7.562500-x('c545'))) 
    +(3.025000*x('c21')/(3.025000-x('c545'))) 
    +(1.210000*x('c22')/(1.210000-x('c545'))) 
    -x('c450') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,3,2,4] & Theta(1) 
nl2..  
    +(7.562500*x('c103')/(7.562500-x('c547'))) 
    +(3.025000*x('c104')/(3.025000-x('c547'))) 
    +(1.210000*x('c105')/(1.210000-x('c547'))) 
    +(1.100000*x('c106')/(1.100000-x('c547'))) 
    -x('c462') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,3,2,4] & Theta(2) 
nl3..  
    +(7.562500*x('c103')/(7.562500-x('c548'))) 
    +(3.025000*x('c104')/(3.025000-x('c548'))) 
    +(1.210000*x('c105')/(1.210000-x('c548'))) 
    +(1.100000*x('c106')/(1.100000-x('c548'))) 
    -x('c462') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,3,2,4] & Theta(3) 
nl4..  
    +(7.562500*x('c103')/(7.562500-x('c549'))) 
    +(3.025000*x('c104')/(3.025000-x('c549'))) 
    +(1.210000*x('c105')/(1.210000-x('c549'))) 
    +(1.100000*x('c106')/(1.100000-x('c549'))) 
    -x('c462') =e= 0; 

Equation  nl5;  
* Feed eqn. for [2,2,3,3] & Theta(2) 
nl5..  
    +(3.025000*x('c264')/(3.025000-x('c554'))) 
    +(1.210000*x('c265')/(1.210000-x('c554'))) 
    -x('c468') +x('c478') =e= 0; 

Equation  nl6;  
* Feed eqn. for [2,3,4,4] & Theta(3) 
nl6..  
    +(3.025000*x('c300')/(3.025000-x('c556'))) 
    +(1.210000*x('c301')/(1.210000-x('c556'))) 
    +(1.100000*x('c302')/(1.100000-x('c556'))) 
    -x('c474') +x('c484') =e= 0; 

Equation  nl7;  
* Feed eqn. for [3,3,4,5] & Theta(3) 
nl7..  
    +(1.210000*x('c410')/(1.210000-x('c561'))) 
    +(1.100000*x('c411')/(1.100000-x('c561'))) 
    +(1.000000*x('c412')/(1.000000-x('c561'))) 
    +x('c500') =e= 0; 

Equation  nl8;  
* Feed eqn. for [4,4,5,5] & Theta(4) 
nl8..  
    +(1.100000*x('c446')/(1.100000-x('c563'))) 
    +(1.000000*x('c447')/(1.000000-x('c563'))) 
    +x('c506') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl9;   
* Rectifying section equation for [1,1,2,3] & Theta(1) 
nl9..  
    +(7.562500*x('c17')/(7.562500-x('c545'))) 
    -x('c13') =l= 0; 

Equation  nl10;   
* Stripping section equation for [1,1,2,3] & Theta(1) 
nl10..  
    -(3.025000*x('c18')/(3.025000-x('c545'))) 
    -(1.210000*x('c19')/(1.210000-x('c545'))) 
    -x('c14') =l= 0; 

Equation  nl11;   
* Rectifying section equation for [1,3,2,4] & Theta(1) 
nl11..  
    +(7.562500*x('c97')/(7.562500-x('c547'))) 
    +(3.025000*x('c98')/(3.025000-x('c547'))) 
    +(1.210000*x('c99')/(1.210000-x('c547'))) 
    -x('c93') =l= 0; 

Equation  nl12;   
* Stripping section equation for [1,3,2,4] & Theta(1) 
nl12..  
    -(3.025000*x('c100')/(3.025000-x('c547'))) 
    -(1.210000*x('c101')/(1.210000-x('c547'))) 
    -(1.100000*x('c102')/(1.100000-x('c547'))) 
    -x('c94') =l= 0; 

Equation  nl13;   
* Rectifying section equation for [1,3,2,4] & Theta(2) 
nl13..  
    +(7.562500*x('c97')/(7.562500-x('c548'))) 
    +(3.025000*x('c98')/(3.025000-x('c548'))) 
    +(1.210000*x('c99')/(1.210000-x('c548'))) 
    -x('c93') =e= 0; 

Equation  nl14;   
* Stripping section equation for [1,3,2,4] & Theta(2) 
nl14..  
    -(3.025000*x('c100')/(3.025000-x('c548'))) 
    -(1.210000*x('c101')/(1.210000-x('c548'))) 
    -(1.100000*x('c102')/(1.100000-x('c548'))) 
    -x('c94') =e= 0; 

Equation  nl15;   
* Rectifying section equation for [1,3,2,4] & Theta(3) 
nl15..  
    +(7.562500*x('c97')/(7.562500-x('c549'))) 
    +(3.025000*x('c98')/(3.025000-x('c549'))) 
    +(1.210000*x('c99')/(1.210000-x('c549'))) 
    -x('c93') =l= 0; 

Equation  nl16;   
* Stripping section equation for [1,3,2,4] & Theta(3) 
nl16..  
    -(3.025000*x('c100')/(3.025000-x('c549'))) 
    -(1.210000*x('c101')/(1.210000-x('c549'))) 
    -(1.100000*x('c102')/(1.100000-x('c549'))) 
    -x('c94') =l= 0; 

Equation  nl17;   
* Rectifying section equation for [2,2,3,3] & Theta(2) 
nl17..  
    +(3.025000*x('c262')/(3.025000-x('c554'))) 
    -x('c258') =l= 0; 

Equation  nl18;   
* Stripping section equation for [2,2,3,3] & Theta(2) 
nl18..  
    -(1.210000*x('c263')/(1.210000-x('c554'))) 
    -x('c259') =l= 0; 

Equation  nl19;   
* Rectifying section equation for [2,3,4,4] & Theta(3) 
nl19..  
    +(3.025000*x('c297')/(3.025000-x('c556'))) 
    +(1.210000*x('c298')/(1.210000-x('c556'))) 
    -x('c293') =l= 0; 

Equation  nl20;   
* Stripping section equation for [2,3,4,4] & Theta(3) 
nl20..  
    -(1.100000*x('c299')/(1.100000-x('c556'))) 
    -x('c294') =l= 0; 

Equation  nl21;   
* Rectifying section equation for [3,3,4,5] & Theta(3) 
nl21..  
    +(1.210000*x('c407')/(1.210000-x('c561'))) 
    -x('c403') =l= 0; 

Equation  nl22;   
* Stripping section equation for [3,3,4,5] & Theta(3) 
nl22..  
    -(1.100000*x('c408')/(1.100000-x('c561'))) 
    -(1.000000*x('c409')/(1.000000-x('c561'))) 
    -x('c404') =l= 0; 

Equation  nl23;   
* Rectifying section equation for [4,4,5,5] & Theta(4) 
nl23..  
    +(1.100000*x('c444')/(1.100000-x('c563'))) 
    -x('c440') =l= 0; 

Equation  nl24;   
* Stripping section equation for [4,4,5,5] & Theta(4) 
nl24..  
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
Execute_unload 'Feedcase99_1_sol', x, mvd, returnStat 

