Sets 
    c                  Track continuous variables          /c1*c563/ 
    i                  Track linear equality constraints   /i1*i368/ 
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

$GDXIN 'Feedcase139_7_data.gdx' 
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
* Feed eqn. for [1,2,3,3] & Theta(2) 
nl2..  
    +(17.187500*x('c45')/(17.187500-x('c546'))) 
    +(6.875000*x('c46')/(6.875000-x('c546'))) 
    +(6.250000*x('c47')/(6.250000-x('c546'))) 
    -x('c454') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,3,2,4] & Theta(1) 
nl3..  
    +(17.187500*x('c103')/(17.187500-x('c547'))) 
    +(6.875000*x('c104')/(6.875000-x('c547'))) 
    +(6.250000*x('c105')/(6.250000-x('c547'))) 
    +(2.500000*x('c106')/(2.500000-x('c547'))) 
    -x('c462') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,3,2,4] & Theta(2) 
nl4..  
    +(17.187500*x('c103')/(17.187500-x('c548'))) 
    +(6.875000*x('c104')/(6.875000-x('c548'))) 
    +(6.250000*x('c105')/(6.250000-x('c548'))) 
    +(2.500000*x('c106')/(2.500000-x('c548'))) 
    -x('c462') =e= 0; 

Equation  nl5;  
* Feed eqn. for [1,3,2,4] & Theta(3) 
nl5..  
    +(17.187500*x('c103')/(17.187500-x('c549'))) 
    +(6.875000*x('c104')/(6.875000-x('c549'))) 
    +(6.250000*x('c105')/(6.250000-x('c549'))) 
    +(2.500000*x('c106')/(2.500000-x('c549'))) 
    -x('c462') =e= 0; 

Equation  nl6;  
* Feed eqn. for [2,2,3,4] & Theta(2) 
nl6..  
    +(6.875000*x('c275')/(6.875000-x('c555'))) 
    +(6.250000*x('c276')/(6.250000-x('c555'))) 
    +(2.500000*x('c277')/(2.500000-x('c555'))) 
    -x('c470') +x('c480') =e= 0; 

Equation  nl7;  
* Feed eqn. for [2,4,3,5] & Theta(2) 
nl7..  
    +(6.875000*x('c358')/(6.875000-x('c557'))) 
    +(6.250000*x('c359')/(6.250000-x('c557'))) 
    +(2.500000*x('c360')/(2.500000-x('c557'))) 
    +(1.000000*x('c361')/(1.000000-x('c557'))) 
    +x('c492') =e= 0; 

Equation  nl8;  
* Feed eqn. for [2,4,3,5] & Theta(3) 
nl8..  
    +(6.875000*x('c358')/(6.875000-x('c558'))) 
    +(6.250000*x('c359')/(6.250000-x('c558'))) 
    +(2.500000*x('c360')/(2.500000-x('c558'))) 
    +(1.000000*x('c361')/(1.000000-x('c558'))) 
    +x('c492') =e= 0; 

Equation  nl9;  
* Feed eqn. for [2,4,3,5] & Theta(4) 
nl9..  
    +(6.875000*x('c358')/(6.875000-x('c559'))) 
    +(6.250000*x('c359')/(6.250000-x('c559'))) 
    +(2.500000*x('c360')/(2.500000-x('c559'))) 
    +(1.000000*x('c361')/(1.000000-x('c559'))) 
    +x('c492') =e= 0; 

Equation  nl10;  
* Feed eqn. for [3,3,4,4] & Theta(3) 
nl10..  
    +(6.250000*x('c399')/(6.250000-x('c560'))) 
    +(2.500000*x('c400')/(2.500000-x('c560'))) 
    -x('c476') +x('c498') =e= 0; 

Equation  nl11;  
* Feed eqn. for [3,4,5,5] & Theta(4) 
nl11..  
    +(6.250000*x('c435')/(6.250000-x('c562'))) 
    +(2.500000*x('c436')/(2.500000-x('c562'))) 
    +(1.000000*x('c437')/(1.000000-x('c562'))) 
    +x('c504') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl12;   
* Rectifying section equation for [1,1,2,2] & Theta(1) 
nl12..  
    +(17.187500*x('c7')/(17.187500-x('c544'))) 
    -x('c3') =l= 0; 

Equation  nl13;   
* Stripping section equation for [1,1,2,2] & Theta(1) 
nl13..  
    -(6.875000*x('c8')/(6.875000-x('c544'))) 
    -x('c4') =l= 0; 

Equation  nl14;   
* Rectifying section equation for [1,2,3,3] & Theta(2) 
nl14..  
    +(17.187500*x('c42')/(17.187500-x('c546'))) 
    +(6.875000*x('c43')/(6.875000-x('c546'))) 
    -x('c38') =l= 0; 

Equation  nl15;   
* Stripping section equation for [1,2,3,3] & Theta(2) 
nl15..  
    -(6.250000*x('c44')/(6.250000-x('c546'))) 
    -x('c39') =l= 0; 

Equation  nl16;   
* Rectifying section equation for [1,3,2,4] & Theta(1) 
nl16..  
    +(17.187500*x('c97')/(17.187500-x('c547'))) 
    +(6.875000*x('c98')/(6.875000-x('c547'))) 
    +(6.250000*x('c99')/(6.250000-x('c547'))) 
    -x('c93') =l= 0; 

Equation  nl17;   
* Stripping section equation for [1,3,2,4] & Theta(1) 
nl17..  
    -(6.875000*x('c100')/(6.875000-x('c547'))) 
    -(6.250000*x('c101')/(6.250000-x('c547'))) 
    -(2.500000*x('c102')/(2.500000-x('c547'))) 
    -x('c94') =l= 0; 

Equation  nl18;   
* Rectifying section equation for [1,3,2,4] & Theta(2) 
nl18..  
    +(17.187500*x('c97')/(17.187500-x('c548'))) 
    +(6.875000*x('c98')/(6.875000-x('c548'))) 
    +(6.250000*x('c99')/(6.250000-x('c548'))) 
    -x('c93') =e= 0; 

Equation  nl19;   
* Stripping section equation for [1,3,2,4] & Theta(2) 
nl19..  
    -(6.875000*x('c100')/(6.875000-x('c548'))) 
    -(6.250000*x('c101')/(6.250000-x('c548'))) 
    -(2.500000*x('c102')/(2.500000-x('c548'))) 
    -x('c94') =e= 0; 

Equation  nl20;   
* Rectifying section equation for [1,3,2,4] & Theta(3) 
nl20..  
    +(17.187500*x('c97')/(17.187500-x('c549'))) 
    +(6.875000*x('c98')/(6.875000-x('c549'))) 
    +(6.250000*x('c99')/(6.250000-x('c549'))) 
    -x('c93') =l= 0; 

Equation  nl21;   
* Stripping section equation for [1,3,2,4] & Theta(3) 
nl21..  
    -(6.875000*x('c100')/(6.875000-x('c549'))) 
    -(6.250000*x('c101')/(6.250000-x('c549'))) 
    -(2.500000*x('c102')/(2.500000-x('c549'))) 
    -x('c94') =l= 0; 

Equation  nl22;   
* Rectifying section equation for [2,2,3,4] & Theta(2) 
nl22..  
    +(6.875000*x('c272')/(6.875000-x('c555'))) 
    -x('c268') =l= 0; 

Equation  nl23;   
* Stripping section equation for [2,2,3,4] & Theta(2) 
nl23..  
    -(6.250000*x('c273')/(6.250000-x('c555'))) 
    -(2.500000*x('c274')/(2.500000-x('c555'))) 
    -x('c269') =l= 0; 

Equation  nl24;   
* Rectifying section equation for [2,4,3,5] & Theta(2) 
nl24..  
    +(6.875000*x('c352')/(6.875000-x('c557'))) 
    +(6.250000*x('c353')/(6.250000-x('c557'))) 
    +(2.500000*x('c354')/(2.500000-x('c557'))) 
    -x('c348') =l= 0; 

Equation  nl25;   
* Stripping section equation for [2,4,3,5] & Theta(2) 
nl25..  
    -(6.250000*x('c355')/(6.250000-x('c557'))) 
    -(2.500000*x('c356')/(2.500000-x('c557'))) 
    -(1.000000*x('c357')/(1.000000-x('c557'))) 
    -x('c349') =l= 0; 

Equation  nl26;   
* Rectifying section equation for [2,4,3,5] & Theta(3) 
nl26..  
    +(6.875000*x('c352')/(6.875000-x('c558'))) 
    +(6.250000*x('c353')/(6.250000-x('c558'))) 
    +(2.500000*x('c354')/(2.500000-x('c558'))) 
    -x('c348') =e= 0; 

Equation  nl27;   
* Stripping section equation for [2,4,3,5] & Theta(3) 
nl27..  
    -(6.250000*x('c355')/(6.250000-x('c558'))) 
    -(2.500000*x('c356')/(2.500000-x('c558'))) 
    -(1.000000*x('c357')/(1.000000-x('c558'))) 
    -x('c349') =e= 0; 

Equation  nl28;   
* Rectifying section equation for [2,4,3,5] & Theta(4) 
nl28..  
    +(6.875000*x('c352')/(6.875000-x('c559'))) 
    +(6.250000*x('c353')/(6.250000-x('c559'))) 
    +(2.500000*x('c354')/(2.500000-x('c559'))) 
    -x('c348') =l= 0; 

Equation  nl29;   
* Stripping section equation for [2,4,3,5] & Theta(4) 
nl29..  
    -(6.250000*x('c355')/(6.250000-x('c559'))) 
    -(2.500000*x('c356')/(2.500000-x('c559'))) 
    -(1.000000*x('c357')/(1.000000-x('c559'))) 
    -x('c349') =l= 0; 

Equation  nl30;   
* Rectifying section equation for [3,3,4,4] & Theta(3) 
nl30..  
    +(6.250000*x('c397')/(6.250000-x('c560'))) 
    -x('c393') =l= 0; 

Equation  nl31;   
* Stripping section equation for [3,3,4,4] & Theta(3) 
nl31..  
    -(2.500000*x('c398')/(2.500000-x('c560'))) 
    -x('c394') =l= 0; 

Equation  nl32;   
* Rectifying section equation for [3,4,5,5] & Theta(4) 
nl32..  
    +(6.250000*x('c432')/(6.250000-x('c562'))) 
    +(2.500000*x('c433')/(2.500000-x('c562'))) 
    -x('c428') =l= 0; 

Equation  nl33;   
* Stripping section equation for [3,4,5,5] & Theta(4) 
nl33..  
    -(1.000000*x('c434')/(1.000000-x('c562'))) 
    -x('c429') =l= 0; 

Model qp /all/;

x.lo(c) = xlb(c); x.up(c) = xub(c); x.l(c) = xip(c);
Option nlp=ipopt;
Option Reslim = 60;
Solve qp minimizing mvd using nlp;


Parameter returnStat(stat);
returnStat('modelstat') = qp.modelstat;
returnStat('solvestat') = qp.solvestat;
Execute_unload 'Feedcase139_7_sol', x, mvd, returnStat 

