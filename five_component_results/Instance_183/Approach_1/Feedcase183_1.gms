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

$GDXIN 'Feedcase183_1_data.gdx' 
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
* Feed eqn. for [1,2,2,3] & Theta(1) 
nl2..  
    +(7.562500*x('c33')/(7.562500-x('c545'))) 
    +(3.025000*x('c34')/(3.025000-x('c545'))) 
    +(2.750000*x('c35')/(2.750000-x('c545'))) 
    -x('c452') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,2,2,3] & Theta(2) 
nl3..  
    +(7.562500*x('c33')/(7.562500-x('c546'))) 
    +(3.025000*x('c34')/(3.025000-x('c546'))) 
    +(2.750000*x('c35')/(2.750000-x('c546'))) 
    -x('c452') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,3,3,4] & Theta(2) 
nl4..  
    +(7.562500*x('c118')/(7.562500-x('c548'))) 
    +(3.025000*x('c119')/(3.025000-x('c548'))) 
    +(2.750000*x('c120')/(2.750000-x('c548'))) 
    +(1.100000*x('c121')/(1.100000-x('c548'))) 
    -x('c464') =e= 0; 

Equation  nl5;  
* Feed eqn. for [1,3,3,4] & Theta(3) 
nl5..  
    +(7.562500*x('c118')/(7.562500-x('c549'))) 
    +(3.025000*x('c119')/(3.025000-x('c549'))) 
    +(2.750000*x('c120')/(2.750000-x('c549'))) 
    +(1.100000*x('c121')/(1.100000-x('c549'))) 
    -x('c464') =e= 0; 

Equation  nl6;  
* Feed eqn. for [2,2,3,3] & Theta(2) 
nl6..  
    +(3.025000*x('c264')/(3.025000-x('c554'))) 
    +(2.750000*x('c265')/(2.750000-x('c554'))) 
    -x('c468') +x('c478') =e= 0; 

Equation  nl7;  
* Feed eqn. for [2,3,3,5] & Theta(2) 
nl7..  
    +(3.025000*x('c328')/(3.025000-x('c557'))) 
    +(2.750000*x('c329')/(2.750000-x('c557'))) 
    +(1.100000*x('c330')/(1.100000-x('c557'))) 
    +(1.000000*x('c331')/(1.000000-x('c557'))) 
    +x('c488') =e= 0; 

Equation  nl8;  
* Feed eqn. for [2,3,3,5] & Theta(3) 
nl8..  
    +(3.025000*x('c328')/(3.025000-x('c558'))) 
    +(2.750000*x('c329')/(2.750000-x('c558'))) 
    +(1.100000*x('c330')/(1.100000-x('c558'))) 
    +(1.000000*x('c331')/(1.000000-x('c558'))) 
    +x('c488') =e= 0; 

Equation  nl9;  
* Feed eqn. for [3,3,4,4] & Theta(3) 
nl9..  
    +(2.750000*x('c399')/(2.750000-x('c560'))) 
    +(1.100000*x('c400')/(1.100000-x('c560'))) 
    -x('c476') +x('c498') =e= 0; 

Equation  nl10;  
* Feed eqn. for [3,4,5,5] & Theta(4) 
nl10..  
    +(2.750000*x('c435')/(2.750000-x('c562'))) 
    +(1.100000*x('c436')/(1.100000-x('c562'))) 
    +(1.000000*x('c437')/(1.000000-x('c562'))) 
    +x('c504') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl11;   
* Rectifying section equation for [1,1,2,2] & Theta(1) 
nl11..  
    +(7.562500*x('c7')/(7.562500-x('c544'))) 
    -x('c3') =l= 0; 

Equation  nl12;   
* Stripping section equation for [1,1,2,2] & Theta(1) 
nl12..  
    -(3.025000*x('c8')/(3.025000-x('c544'))) 
    -x('c4') =l= 0; 

Equation  nl13;   
* Rectifying section equation for [1,2,2,3] & Theta(1) 
nl13..  
    +(7.562500*x('c29')/(7.562500-x('c545'))) 
    +(3.025000*x('c30')/(3.025000-x('c545'))) 
    -x('c25') =l= 0; 

Equation  nl14;   
* Stripping section equation for [1,2,2,3] & Theta(1) 
nl14..  
    -(3.025000*x('c31')/(3.025000-x('c545'))) 
    -(2.750000*x('c32')/(2.750000-x('c545'))) 
    -x('c26') =l= 0; 

Equation  nl15;   
* Rectifying section equation for [1,2,2,3] & Theta(2) 
nl15..  
    +(7.562500*x('c29')/(7.562500-x('c546'))) 
    +(3.025000*x('c30')/(3.025000-x('c546'))) 
    -x('c25') =l= 0; 

Equation  nl16;   
* Stripping section equation for [1,2,2,3] & Theta(2) 
nl16..  
    -(3.025000*x('c31')/(3.025000-x('c546'))) 
    -(2.750000*x('c32')/(2.750000-x('c546'))) 
    -x('c26') =l= 0; 

Equation  nl17;   
* Rectifying section equation for [1,3,3,4] & Theta(2) 
nl17..  
    +(7.562500*x('c113')/(7.562500-x('c548'))) 
    +(3.025000*x('c114')/(3.025000-x('c548'))) 
    +(2.750000*x('c115')/(2.750000-x('c548'))) 
    -x('c109') =l= 0; 

Equation  nl18;   
* Stripping section equation for [1,3,3,4] & Theta(2) 
nl18..  
    -(2.750000*x('c116')/(2.750000-x('c548'))) 
    -(1.100000*x('c117')/(1.100000-x('c548'))) 
    -x('c110') =l= 0; 

Equation  nl19;   
* Rectifying section equation for [1,3,3,4] & Theta(3) 
nl19..  
    +(7.562500*x('c113')/(7.562500-x('c549'))) 
    +(3.025000*x('c114')/(3.025000-x('c549'))) 
    +(2.750000*x('c115')/(2.750000-x('c549'))) 
    -x('c109') =l= 0; 

Equation  nl20;   
* Stripping section equation for [1,3,3,4] & Theta(3) 
nl20..  
    -(2.750000*x('c116')/(2.750000-x('c549'))) 
    -(1.100000*x('c117')/(1.100000-x('c549'))) 
    -x('c110') =l= 0; 

Equation  nl21;   
* Rectifying section equation for [2,2,3,3] & Theta(2) 
nl21..  
    +(3.025000*x('c262')/(3.025000-x('c554'))) 
    -x('c258') =l= 0; 

Equation  nl22;   
* Stripping section equation for [2,2,3,3] & Theta(2) 
nl22..  
    -(2.750000*x('c263')/(2.750000-x('c554'))) 
    -x('c259') =l= 0; 

Equation  nl23;   
* Rectifying section equation for [2,3,3,5] & Theta(2) 
nl23..  
    +(3.025000*x('c323')/(3.025000-x('c557'))) 
    +(2.750000*x('c324')/(2.750000-x('c557'))) 
    -x('c319') =l= 0; 

Equation  nl24;   
* Stripping section equation for [2,3,3,5] & Theta(2) 
nl24..  
    -(2.750000*x('c325')/(2.750000-x('c557'))) 
    -(1.100000*x('c326')/(1.100000-x('c557'))) 
    -(1.000000*x('c327')/(1.000000-x('c557'))) 
    -x('c320') =l= 0; 

Equation  nl25;   
* Rectifying section equation for [2,3,3,5] & Theta(3) 
nl25..  
    +(3.025000*x('c323')/(3.025000-x('c558'))) 
    +(2.750000*x('c324')/(2.750000-x('c558'))) 
    -x('c319') =l= 0; 

Equation  nl26;   
* Stripping section equation for [2,3,3,5] & Theta(3) 
nl26..  
    -(2.750000*x('c325')/(2.750000-x('c558'))) 
    -(1.100000*x('c326')/(1.100000-x('c558'))) 
    -(1.000000*x('c327')/(1.000000-x('c558'))) 
    -x('c320') =l= 0; 

Equation  nl27;   
* Rectifying section equation for [3,3,4,4] & Theta(3) 
nl27..  
    +(2.750000*x('c397')/(2.750000-x('c560'))) 
    -x('c393') =l= 0; 

Equation  nl28;   
* Stripping section equation for [3,3,4,4] & Theta(3) 
nl28..  
    -(1.100000*x('c398')/(1.100000-x('c560'))) 
    -x('c394') =l= 0; 

Equation  nl29;   
* Rectifying section equation for [3,4,5,5] & Theta(4) 
nl29..  
    +(2.750000*x('c432')/(2.750000-x('c562'))) 
    +(1.100000*x('c433')/(1.100000-x('c562'))) 
    -x('c428') =l= 0; 

Equation  nl30;   
* Stripping section equation for [3,4,5,5] & Theta(4) 
nl30..  
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
Execute_unload 'Feedcase183_1_sol', x, mvd, returnStat 

