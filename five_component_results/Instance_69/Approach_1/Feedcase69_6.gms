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

$GDXIN 'Feedcase69_6_data.gdx' 
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
* Feed eqn. for [1,1,2,2] & Theta(1) 
nl1..  
    +(17.187500*x('c9')/(17.187500-x('c544'))) 
    +(6.875000*x('c10')/(6.875000-x('c544'))) 
    -x('c448') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,2,2,3] & Theta(1) 
nl2..  
    +(17.187500*x('c33')/(17.187500-x('c545'))) 
    +(6.875000*x('c34')/(6.875000-x('c545'))) 
    +(2.750000*x('c35')/(2.750000-x('c545'))) 
    -x('c452') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,2,2,3] & Theta(2) 
nl3..  
    +(17.187500*x('c33')/(17.187500-x('c546'))) 
    +(6.875000*x('c34')/(6.875000-x('c546'))) 
    +(2.750000*x('c35')/(2.750000-x('c546'))) 
    -x('c452') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,3,2,4] & Theta(1) 
nl4..  
    +(17.187500*x('c103')/(17.187500-x('c547'))) 
    +(6.875000*x('c104')/(6.875000-x('c547'))) 
    +(2.750000*x('c105')/(2.750000-x('c547'))) 
    +(2.500000*x('c106')/(2.500000-x('c547'))) 
    -x('c462') =e= 0; 

Equation  nl5;  
* Feed eqn. for [1,3,2,4] & Theta(2) 
nl5..  
    +(17.187500*x('c103')/(17.187500-x('c548'))) 
    +(6.875000*x('c104')/(6.875000-x('c548'))) 
    +(2.750000*x('c105')/(2.750000-x('c548'))) 
    +(2.500000*x('c106')/(2.500000-x('c548'))) 
    -x('c462') =e= 0; 

Equation  nl6;  
* Feed eqn. for [1,3,2,4] & Theta(3) 
nl6..  
    +(17.187500*x('c103')/(17.187500-x('c549'))) 
    +(6.875000*x('c104')/(6.875000-x('c549'))) 
    +(2.750000*x('c105')/(2.750000-x('c549'))) 
    +(2.500000*x('c106')/(2.500000-x('c549'))) 
    -x('c462') =e= 0; 

Equation  nl7;  
* Feed eqn. for [2,2,3,3] & Theta(2) 
nl7..  
    +(6.875000*x('c264')/(6.875000-x('c554'))) 
    +(2.750000*x('c265')/(2.750000-x('c554'))) 
    -x('c468') +x('c478') =e= 0; 

Equation  nl8;  
* Feed eqn. for [2,3,4,4] & Theta(3) 
nl8..  
    +(6.875000*x('c300')/(6.875000-x('c556'))) 
    +(2.750000*x('c301')/(2.750000-x('c556'))) 
    +(2.500000*x('c302')/(2.500000-x('c556'))) 
    -x('c474') +x('c484') =e= 0; 

Equation  nl9;  
* Feed eqn. for [3,3,4,5] & Theta(3) 
nl9..  
    +(2.750000*x('c410')/(2.750000-x('c561'))) 
    +(2.500000*x('c411')/(2.500000-x('c561'))) 
    +(1.000000*x('c412')/(1.000000-x('c561'))) 
    +x('c500') =e= 0; 

Equation  nl10;  
* Feed eqn. for [4,4,5,5] & Theta(4) 
nl10..  
    +(2.500000*x('c446')/(2.500000-x('c563'))) 
    +(1.000000*x('c447')/(1.000000-x('c563'))) 
    +x('c506') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl11;   
* Rectifying section equation for [1,1,2,2] & Theta(1) 
nl11..  
    +(17.187500*x('c7')/(17.187500-x('c544'))) 
    -x('c3') =l= 0; 

Equation  nl12;   
* Stripping section equation for [1,1,2,2] & Theta(1) 
nl12..  
    -(6.875000*x('c8')/(6.875000-x('c544'))) 
    -x('c4') =l= 0; 

Equation  nl13;   
* Rectifying section equation for [1,2,2,3] & Theta(1) 
nl13..  
    +(17.187500*x('c29')/(17.187500-x('c545'))) 
    +(6.875000*x('c30')/(6.875000-x('c545'))) 
    -x('c25') =l= 0; 

Equation  nl14;   
* Stripping section equation for [1,2,2,3] & Theta(1) 
nl14..  
    -(6.875000*x('c31')/(6.875000-x('c545'))) 
    -(2.750000*x('c32')/(2.750000-x('c545'))) 
    -x('c26') =l= 0; 

Equation  nl15;   
* Rectifying section equation for [1,2,2,3] & Theta(2) 
nl15..  
    +(17.187500*x('c29')/(17.187500-x('c546'))) 
    +(6.875000*x('c30')/(6.875000-x('c546'))) 
    -x('c25') =l= 0; 

Equation  nl16;   
* Stripping section equation for [1,2,2,3] & Theta(2) 
nl16..  
    -(6.875000*x('c31')/(6.875000-x('c546'))) 
    -(2.750000*x('c32')/(2.750000-x('c546'))) 
    -x('c26') =l= 0; 

Equation  nl17;   
* Rectifying section equation for [1,3,2,4] & Theta(1) 
nl17..  
    +(17.187500*x('c97')/(17.187500-x('c547'))) 
    +(6.875000*x('c98')/(6.875000-x('c547'))) 
    +(2.750000*x('c99')/(2.750000-x('c547'))) 
    -x('c93') =l= 0; 

Equation  nl18;   
* Stripping section equation for [1,3,2,4] & Theta(1) 
nl18..  
    -(6.875000*x('c100')/(6.875000-x('c547'))) 
    -(2.750000*x('c101')/(2.750000-x('c547'))) 
    -(2.500000*x('c102')/(2.500000-x('c547'))) 
    -x('c94') =l= 0; 

Equation  nl19;   
* Rectifying section equation for [1,3,2,4] & Theta(2) 
nl19..  
    +(17.187500*x('c97')/(17.187500-x('c548'))) 
    +(6.875000*x('c98')/(6.875000-x('c548'))) 
    +(2.750000*x('c99')/(2.750000-x('c548'))) 
    -x('c93') =e= 0; 

Equation  nl20;   
* Stripping section equation for [1,3,2,4] & Theta(2) 
nl20..  
    -(6.875000*x('c100')/(6.875000-x('c548'))) 
    -(2.750000*x('c101')/(2.750000-x('c548'))) 
    -(2.500000*x('c102')/(2.500000-x('c548'))) 
    -x('c94') =e= 0; 

Equation  nl21;   
* Rectifying section equation for [1,3,2,4] & Theta(3) 
nl21..  
    +(17.187500*x('c97')/(17.187500-x('c549'))) 
    +(6.875000*x('c98')/(6.875000-x('c549'))) 
    +(2.750000*x('c99')/(2.750000-x('c549'))) 
    -x('c93') =l= 0; 

Equation  nl22;   
* Stripping section equation for [1,3,2,4] & Theta(3) 
nl22..  
    -(6.875000*x('c100')/(6.875000-x('c549'))) 
    -(2.750000*x('c101')/(2.750000-x('c549'))) 
    -(2.500000*x('c102')/(2.500000-x('c549'))) 
    -x('c94') =l= 0; 

Equation  nl23;   
* Rectifying section equation for [2,2,3,3] & Theta(2) 
nl23..  
    +(6.875000*x('c262')/(6.875000-x('c554'))) 
    -x('c258') =l= 0; 

Equation  nl24;   
* Stripping section equation for [2,2,3,3] & Theta(2) 
nl24..  
    -(2.750000*x('c263')/(2.750000-x('c554'))) 
    -x('c259') =l= 0; 

Equation  nl25;   
* Rectifying section equation for [2,3,4,4] & Theta(3) 
nl25..  
    +(6.875000*x('c297')/(6.875000-x('c556'))) 
    +(2.750000*x('c298')/(2.750000-x('c556'))) 
    -x('c293') =l= 0; 

Equation  nl26;   
* Stripping section equation for [2,3,4,4] & Theta(3) 
nl26..  
    -(2.500000*x('c299')/(2.500000-x('c556'))) 
    -x('c294') =l= 0; 

Equation  nl27;   
* Rectifying section equation for [3,3,4,5] & Theta(3) 
nl27..  
    +(2.750000*x('c407')/(2.750000-x('c561'))) 
    -x('c403') =l= 0; 

Equation  nl28;   
* Stripping section equation for [3,3,4,5] & Theta(3) 
nl28..  
    -(2.500000*x('c408')/(2.500000-x('c561'))) 
    -(1.000000*x('c409')/(1.000000-x('c561'))) 
    -x('c404') =l= 0; 

Equation  nl29;   
* Rectifying section equation for [4,4,5,5] & Theta(4) 
nl29..  
    +(2.500000*x('c444')/(2.500000-x('c563'))) 
    -x('c440') =l= 0; 

Equation  nl30;   
* Stripping section equation for [4,4,5,5] & Theta(4) 
nl30..  
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
Execute_unload 'Feedcase69_6_sol', x, mvd, returnStat 

