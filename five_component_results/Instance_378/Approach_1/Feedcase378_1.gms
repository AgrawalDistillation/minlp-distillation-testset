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

$GDXIN 'Feedcase378_1_data.gdx' 
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
    +(6.875000*x('c10')/(6.875000-x('c544'))) 
    -x('c448') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,2,3,3] & Theta(2) 
nl2..  
    +(7.562500*x('c45')/(7.562500-x('c546'))) 
    +(6.875000*x('c46')/(6.875000-x('c546'))) 
    +(6.250000*x('c47')/(6.250000-x('c546'))) 
    -x('c454') =e= 0; 

Equation  nl3;  
* Feed eqn. for [2,2,3,4] & Theta(2) 
nl3..  
    +(6.875000*x('c275')/(6.875000-x('c555'))) 
    +(6.250000*x('c276')/(6.250000-x('c555'))) 
    +(2.500000*x('c277')/(2.500000-x('c555'))) 
    -x('c470') +x('c480') =e= 0; 

Equation  nl4;  
* Feed eqn. for [2,4,3,5] & Theta(2) 
nl4..  
    +(6.875000*x('c358')/(6.875000-x('c557'))) 
    +(6.250000*x('c359')/(6.250000-x('c557'))) 
    +(2.500000*x('c360')/(2.500000-x('c557'))) 
    +(1.000000*x('c361')/(1.000000-x('c557'))) 
    +x('c492') =e= 0; 

Equation  nl5;  
* Feed eqn. for [2,4,3,5] & Theta(3) 
nl5..  
    +(6.875000*x('c358')/(6.875000-x('c558'))) 
    +(6.250000*x('c359')/(6.250000-x('c558'))) 
    +(2.500000*x('c360')/(2.500000-x('c558'))) 
    +(1.000000*x('c361')/(1.000000-x('c558'))) 
    +x('c492') =e= 0; 

Equation  nl6;  
* Feed eqn. for [2,4,3,5] & Theta(4) 
nl6..  
    +(6.875000*x('c358')/(6.875000-x('c559'))) 
    +(6.250000*x('c359')/(6.250000-x('c559'))) 
    +(2.500000*x('c360')/(2.500000-x('c559'))) 
    +(1.000000*x('c361')/(1.000000-x('c559'))) 
    +x('c492') =e= 0; 

Equation  nl7;  
* Feed eqn. for [3,3,4,4] & Theta(3) 
nl7..  
    +(6.250000*x('c399')/(6.250000-x('c560'))) 
    +(2.500000*x('c400')/(2.500000-x('c560'))) 
    -x('c476') +x('c498') =e= 0; 

Equation  nl8;  
* Feed eqn. for [3,4,5,5] & Theta(4) 
nl8..  
    +(6.250000*x('c435')/(6.250000-x('c562'))) 
    +(2.500000*x('c436')/(2.500000-x('c562'))) 
    +(1.000000*x('c437')/(1.000000-x('c562'))) 
    +x('c504') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl9;   
* Rectifying section equation for [1,1,2,2] & Theta(1) 
nl9..  
    +(7.562500*x('c7')/(7.562500-x('c544'))) 
    -x('c3') =l= 0; 

Equation  nl10;   
* Stripping section equation for [1,1,2,2] & Theta(1) 
nl10..  
    -(6.875000*x('c8')/(6.875000-x('c544'))) 
    -x('c4') =l= 0; 

Equation  nl11;   
* Rectifying section equation for [1,2,3,3] & Theta(2) 
nl11..  
    +(7.562500*x('c42')/(7.562500-x('c546'))) 
    +(6.875000*x('c43')/(6.875000-x('c546'))) 
    -x('c38') =l= 0; 

Equation  nl12;   
* Stripping section equation for [1,2,3,3] & Theta(2) 
nl12..  
    -(6.250000*x('c44')/(6.250000-x('c546'))) 
    -x('c39') =l= 0; 

Equation  nl13;   
* Rectifying section equation for [2,2,3,4] & Theta(2) 
nl13..  
    +(6.875000*x('c272')/(6.875000-x('c555'))) 
    -x('c268') =l= 0; 

Equation  nl14;   
* Stripping section equation for [2,2,3,4] & Theta(2) 
nl14..  
    -(6.250000*x('c273')/(6.250000-x('c555'))) 
    -(2.500000*x('c274')/(2.500000-x('c555'))) 
    -x('c269') =l= 0; 

Equation  nl15;   
* Rectifying section equation for [2,4,3,5] & Theta(2) 
nl15..  
    +(6.875000*x('c352')/(6.875000-x('c557'))) 
    +(6.250000*x('c353')/(6.250000-x('c557'))) 
    +(2.500000*x('c354')/(2.500000-x('c557'))) 
    -x('c348') =l= 0; 

Equation  nl16;   
* Stripping section equation for [2,4,3,5] & Theta(2) 
nl16..  
    -(6.250000*x('c355')/(6.250000-x('c557'))) 
    -(2.500000*x('c356')/(2.500000-x('c557'))) 
    -(1.000000*x('c357')/(1.000000-x('c557'))) 
    -x('c349') =l= 0; 

Equation  nl17;   
* Rectifying section equation for [2,4,3,5] & Theta(3) 
nl17..  
    +(6.875000*x('c352')/(6.875000-x('c558'))) 
    +(6.250000*x('c353')/(6.250000-x('c558'))) 
    +(2.500000*x('c354')/(2.500000-x('c558'))) 
    -x('c348') =e= 0; 

Equation  nl18;   
* Stripping section equation for [2,4,3,5] & Theta(3) 
nl18..  
    -(6.250000*x('c355')/(6.250000-x('c558'))) 
    -(2.500000*x('c356')/(2.500000-x('c558'))) 
    -(1.000000*x('c357')/(1.000000-x('c558'))) 
    -x('c349') =e= 0; 

Equation  nl19;   
* Rectifying section equation for [2,4,3,5] & Theta(4) 
nl19..  
    +(6.875000*x('c352')/(6.875000-x('c559'))) 
    +(6.250000*x('c353')/(6.250000-x('c559'))) 
    +(2.500000*x('c354')/(2.500000-x('c559'))) 
    -x('c348') =l= 0; 

Equation  nl20;   
* Stripping section equation for [2,4,3,5] & Theta(4) 
nl20..  
    -(6.250000*x('c355')/(6.250000-x('c559'))) 
    -(2.500000*x('c356')/(2.500000-x('c559'))) 
    -(1.000000*x('c357')/(1.000000-x('c559'))) 
    -x('c349') =l= 0; 

Equation  nl21;   
* Rectifying section equation for [3,3,4,4] & Theta(3) 
nl21..  
    +(6.250000*x('c397')/(6.250000-x('c560'))) 
    -x('c393') =l= 0; 

Equation  nl22;   
* Stripping section equation for [3,3,4,4] & Theta(3) 
nl22..  
    -(2.500000*x('c398')/(2.500000-x('c560'))) 
    -x('c394') =l= 0; 

Equation  nl23;   
* Rectifying section equation for [3,4,5,5] & Theta(4) 
nl23..  
    +(6.250000*x('c432')/(6.250000-x('c562'))) 
    +(2.500000*x('c433')/(2.500000-x('c562'))) 
    -x('c428') =l= 0; 

Equation  nl24;   
* Stripping section equation for [3,4,5,5] & Theta(4) 
nl24..  
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
Execute_unload 'Feedcase378_1_sol', x, mvd, returnStat 

