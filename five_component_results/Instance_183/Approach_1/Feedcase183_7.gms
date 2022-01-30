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

$GDXIN 'Feedcase183_7_data.gdx' 
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
    +(7.562500*x('c9')/(7.562500-x('c544'))) 
    +(3.025000*x('c10')/(3.025000-x('c544'))) 
    -x('c448') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,2,3,3] & Theta(2) 
nl2..  
    +(7.562500*x('c45')/(7.562500-x('c546'))) 
    +(3.025000*x('c46')/(3.025000-x('c546'))) 
    +(2.750000*x('c47')/(2.750000-x('c546'))) 
    -x('c454') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,3,2,4] & Theta(1) 
nl3..  
    +(7.562500*x('c103')/(7.562500-x('c547'))) 
    +(3.025000*x('c104')/(3.025000-x('c547'))) 
    +(2.750000*x('c105')/(2.750000-x('c547'))) 
    +(1.100000*x('c106')/(1.100000-x('c547'))) 
    -x('c462') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,3,2,4] & Theta(2) 
nl4..  
    +(7.562500*x('c103')/(7.562500-x('c548'))) 
    +(3.025000*x('c104')/(3.025000-x('c548'))) 
    +(2.750000*x('c105')/(2.750000-x('c548'))) 
    +(1.100000*x('c106')/(1.100000-x('c548'))) 
    -x('c462') =e= 0; 

Equation  nl5;  
* Feed eqn. for [1,3,2,4] & Theta(3) 
nl5..  
    +(7.562500*x('c103')/(7.562500-x('c549'))) 
    +(3.025000*x('c104')/(3.025000-x('c549'))) 
    +(2.750000*x('c105')/(2.750000-x('c549'))) 
    +(1.100000*x('c106')/(1.100000-x('c549'))) 
    -x('c462') =e= 0; 

Equation  nl6;  
* Feed eqn. for [2,2,3,4] & Theta(2) 
nl6..  
    +(3.025000*x('c275')/(3.025000-x('c555'))) 
    +(2.750000*x('c276')/(2.750000-x('c555'))) 
    +(1.100000*x('c277')/(1.100000-x('c555'))) 
    -x('c470') +x('c480') =e= 0; 

Equation  nl7;  
* Feed eqn. for [2,4,3,5] & Theta(2) 
nl7..  
    +(3.025000*x('c358')/(3.025000-x('c557'))) 
    +(2.750000*x('c359')/(2.750000-x('c557'))) 
    +(1.100000*x('c360')/(1.100000-x('c557'))) 
    +(1.000000*x('c361')/(1.000000-x('c557'))) 
    +x('c492') =e= 0; 

Equation  nl8;  
* Feed eqn. for [2,4,3,5] & Theta(3) 
nl8..  
    +(3.025000*x('c358')/(3.025000-x('c558'))) 
    +(2.750000*x('c359')/(2.750000-x('c558'))) 
    +(1.100000*x('c360')/(1.100000-x('c558'))) 
    +(1.000000*x('c361')/(1.000000-x('c558'))) 
    +x('c492') =e= 0; 

Equation  nl9;  
* Feed eqn. for [2,4,3,5] & Theta(4) 
nl9..  
    +(3.025000*x('c358')/(3.025000-x('c559'))) 
    +(2.750000*x('c359')/(2.750000-x('c559'))) 
    +(1.100000*x('c360')/(1.100000-x('c559'))) 
    +(1.000000*x('c361')/(1.000000-x('c559'))) 
    +x('c492') =e= 0; 

Equation  nl10;  
* Feed eqn. for [3,3,4,4] & Theta(3) 
nl10..  
    +(2.750000*x('c399')/(2.750000-x('c560'))) 
    +(1.100000*x('c400')/(1.100000-x('c560'))) 
    -x('c476') +x('c498') =e= 0; 

Equation  nl11;  
* Feed eqn. for [3,4,4,5] & Theta(3) 
nl11..  
    +(2.750000*x('c423')/(2.750000-x('c561'))) 
    +(1.100000*x('c424')/(1.100000-x('c561'))) 
    +(1.000000*x('c425')/(1.000000-x('c561'))) 
    +x('c502') =e= 0; 

Equation  nl12;  
* Feed eqn. for [3,4,4,5] & Theta(4) 
nl12..  
    +(2.750000*x('c423')/(2.750000-x('c562'))) 
    +(1.100000*x('c424')/(1.100000-x('c562'))) 
    +(1.000000*x('c425')/(1.000000-x('c562'))) 
    +x('c502') =e= 0; 

Equation  nl13;  
* Feed eqn. for [4,4,5,5] & Theta(4) 
nl13..  
    +(1.100000*x('c446')/(1.100000-x('c563'))) 
    +(1.000000*x('c447')/(1.000000-x('c563'))) 
    +x('c506') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl14;   
* Rectifying section equation for [1,1,2,2] & Theta(1) 
nl14..  
    +(7.562500*x('c7')/(7.562500-x('c544'))) 
    -x('c3') =l= 0; 

Equation  nl15;   
* Stripping section equation for [1,1,2,2] & Theta(1) 
nl15..  
    -(3.025000*x('c8')/(3.025000-x('c544'))) 
    -x('c4') =l= 0; 

Equation  nl16;   
* Rectifying section equation for [1,2,3,3] & Theta(2) 
nl16..  
    +(7.562500*x('c42')/(7.562500-x('c546'))) 
    +(3.025000*x('c43')/(3.025000-x('c546'))) 
    -x('c38') =l= 0; 

Equation  nl17;   
* Stripping section equation for [1,2,3,3] & Theta(2) 
nl17..  
    -(2.750000*x('c44')/(2.750000-x('c546'))) 
    -x('c39') =l= 0; 

Equation  nl18;   
* Rectifying section equation for [1,3,2,4] & Theta(1) 
nl18..  
    +(7.562500*x('c97')/(7.562500-x('c547'))) 
    +(3.025000*x('c98')/(3.025000-x('c547'))) 
    +(2.750000*x('c99')/(2.750000-x('c547'))) 
    -x('c93') =l= 0; 

Equation  nl19;   
* Stripping section equation for [1,3,2,4] & Theta(1) 
nl19..  
    -(3.025000*x('c100')/(3.025000-x('c547'))) 
    -(2.750000*x('c101')/(2.750000-x('c547'))) 
    -(1.100000*x('c102')/(1.100000-x('c547'))) 
    -x('c94') =l= 0; 

Equation  nl20;   
* Rectifying section equation for [1,3,2,4] & Theta(2) 
nl20..  
    +(7.562500*x('c97')/(7.562500-x('c548'))) 
    +(3.025000*x('c98')/(3.025000-x('c548'))) 
    +(2.750000*x('c99')/(2.750000-x('c548'))) 
    -x('c93') =e= 0; 

Equation  nl21;   
* Stripping section equation for [1,3,2,4] & Theta(2) 
nl21..  
    -(3.025000*x('c100')/(3.025000-x('c548'))) 
    -(2.750000*x('c101')/(2.750000-x('c548'))) 
    -(1.100000*x('c102')/(1.100000-x('c548'))) 
    -x('c94') =e= 0; 

Equation  nl22;   
* Rectifying section equation for [1,3,2,4] & Theta(3) 
nl22..  
    +(7.562500*x('c97')/(7.562500-x('c549'))) 
    +(3.025000*x('c98')/(3.025000-x('c549'))) 
    +(2.750000*x('c99')/(2.750000-x('c549'))) 
    -x('c93') =l= 0; 

Equation  nl23;   
* Stripping section equation for [1,3,2,4] & Theta(3) 
nl23..  
    -(3.025000*x('c100')/(3.025000-x('c549'))) 
    -(2.750000*x('c101')/(2.750000-x('c549'))) 
    -(1.100000*x('c102')/(1.100000-x('c549'))) 
    -x('c94') =l= 0; 

Equation  nl24;   
* Rectifying section equation for [2,2,3,4] & Theta(2) 
nl24..  
    +(3.025000*x('c272')/(3.025000-x('c555'))) 
    -x('c268') =l= 0; 

Equation  nl25;   
* Stripping section equation for [2,2,3,4] & Theta(2) 
nl25..  
    -(2.750000*x('c273')/(2.750000-x('c555'))) 
    -(1.100000*x('c274')/(1.100000-x('c555'))) 
    -x('c269') =l= 0; 

Equation  nl26;   
* Rectifying section equation for [2,4,3,5] & Theta(2) 
nl26..  
    +(3.025000*x('c352')/(3.025000-x('c557'))) 
    +(2.750000*x('c353')/(2.750000-x('c557'))) 
    +(1.100000*x('c354')/(1.100000-x('c557'))) 
    -x('c348') =l= 0; 

Equation  nl27;   
* Stripping section equation for [2,4,3,5] & Theta(2) 
nl27..  
    -(2.750000*x('c355')/(2.750000-x('c557'))) 
    -(1.100000*x('c356')/(1.100000-x('c557'))) 
    -(1.000000*x('c357')/(1.000000-x('c557'))) 
    -x('c349') =l= 0; 

Equation  nl28;   
* Rectifying section equation for [2,4,3,5] & Theta(3) 
nl28..  
    +(3.025000*x('c352')/(3.025000-x('c558'))) 
    +(2.750000*x('c353')/(2.750000-x('c558'))) 
    +(1.100000*x('c354')/(1.100000-x('c558'))) 
    -x('c348') =e= 0; 

Equation  nl29;   
* Stripping section equation for [2,4,3,5] & Theta(3) 
nl29..  
    -(2.750000*x('c355')/(2.750000-x('c558'))) 
    -(1.100000*x('c356')/(1.100000-x('c558'))) 
    -(1.000000*x('c357')/(1.000000-x('c558'))) 
    -x('c349') =e= 0; 

Equation  nl30;   
* Rectifying section equation for [2,4,3,5] & Theta(4) 
nl30..  
    +(3.025000*x('c352')/(3.025000-x('c559'))) 
    +(2.750000*x('c353')/(2.750000-x('c559'))) 
    +(1.100000*x('c354')/(1.100000-x('c559'))) 
    -x('c348') =l= 0; 

Equation  nl31;   
* Stripping section equation for [2,4,3,5] & Theta(4) 
nl31..  
    -(2.750000*x('c355')/(2.750000-x('c559'))) 
    -(1.100000*x('c356')/(1.100000-x('c559'))) 
    -(1.000000*x('c357')/(1.000000-x('c559'))) 
    -x('c349') =l= 0; 

Equation  nl32;   
* Rectifying section equation for [3,3,4,4] & Theta(3) 
nl32..  
    +(2.750000*x('c397')/(2.750000-x('c560'))) 
    -x('c393') =l= 0; 

Equation  nl33;   
* Stripping section equation for [3,3,4,4] & Theta(3) 
nl33..  
    -(1.100000*x('c398')/(1.100000-x('c560'))) 
    -x('c394') =l= 0; 

Equation  nl34;   
* Rectifying section equation for [3,4,4,5] & Theta(3) 
nl34..  
    +(2.750000*x('c419')/(2.750000-x('c561'))) 
    +(1.100000*x('c420')/(1.100000-x('c561'))) 
    -x('c415') =l= 0; 

Equation  nl35;   
* Stripping section equation for [3,4,4,5] & Theta(3) 
nl35..  
    -(1.100000*x('c421')/(1.100000-x('c561'))) 
    -(1.000000*x('c422')/(1.000000-x('c561'))) 
    -x('c416') =l= 0; 

Equation  nl36;   
* Rectifying section equation for [3,4,4,5] & Theta(4) 
nl36..  
    +(2.750000*x('c419')/(2.750000-x('c562'))) 
    +(1.100000*x('c420')/(1.100000-x('c562'))) 
    -x('c415') =l= 0; 

Equation  nl37;   
* Stripping section equation for [3,4,4,5] & Theta(4) 
nl37..  
    -(1.100000*x('c421')/(1.100000-x('c562'))) 
    -(1.000000*x('c422')/(1.000000-x('c562'))) 
    -x('c416') =l= 0; 

Equation  nl38;   
* Rectifying section equation for [4,4,5,5] & Theta(4) 
nl38..  
    +(1.100000*x('c444')/(1.100000-x('c563'))) 
    -x('c440') =l= 0; 

Equation  nl39;   
* Stripping section equation for [4,4,5,5] & Theta(4) 
nl39..  
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
Execute_unload 'Feedcase183_7_sol', x, mvd, returnStat 

