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

$GDXIN 'Feedcase69_4_data.gdx' 
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
* Feed eqn. for [1,3,3,4] & Theta(2) 
nl2..  
    +(17.187500*x('c118')/(17.187500-x('c548'))) 
    +(6.875000*x('c119')/(6.875000-x('c548'))) 
    +(2.750000*x('c120')/(2.750000-x('c548'))) 
    +(2.500000*x('c121')/(2.500000-x('c548'))) 
    -x('c464') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,3,3,4] & Theta(3) 
nl3..  
    +(17.187500*x('c118')/(17.187500-x('c549'))) 
    +(6.875000*x('c119')/(6.875000-x('c549'))) 
    +(2.750000*x('c120')/(2.750000-x('c549'))) 
    +(2.500000*x('c121')/(2.500000-x('c549'))) 
    -x('c464') =e= 0; 

Equation  nl4;  
* Feed eqn. for [2,2,3,3] & Theta(2) 
nl4..  
    +(6.875000*x('c264')/(6.875000-x('c554'))) 
    +(2.750000*x('c265')/(2.750000-x('c554'))) 
    -x('c468') +x('c478') =e= 0; 

Equation  nl5;  
* Feed eqn. for [2,3,4,5] & Theta(3) 
nl5..  
    +(6.875000*x('c342')/(6.875000-x('c558'))) 
    +(2.750000*x('c343')/(2.750000-x('c558'))) 
    +(2.500000*x('c344')/(2.500000-x('c558'))) 
    +(1.000000*x('c345')/(1.000000-x('c558'))) 
    +x('c490') =e= 0; 

Equation  nl6;  
* Feed eqn. for [3,3,4,4] & Theta(3) 
nl6..  
    +(2.750000*x('c399')/(2.750000-x('c560'))) 
    +(2.500000*x('c400')/(2.500000-x('c560'))) 
    -x('c476') +x('c498') =e= 0; 

Equation  nl7;  
* Feed eqn. for [4,4,5,5] & Theta(4) 
nl7..  
    +(2.500000*x('c446')/(2.500000-x('c563'))) 
    +(1.000000*x('c447')/(1.000000-x('c563'))) 
    +x('c506') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl8;   
* Rectifying section equation for [1,1,2,3] & Theta(1) 
nl8..  
    +(17.187500*x('c17')/(17.187500-x('c545'))) 
    -x('c13') =l= 0; 

Equation  nl9;   
* Stripping section equation for [1,1,2,3] & Theta(1) 
nl9..  
    -(6.875000*x('c18')/(6.875000-x('c545'))) 
    -(2.750000*x('c19')/(2.750000-x('c545'))) 
    -x('c14') =l= 0; 

Equation  nl10;   
* Rectifying section equation for [1,3,3,4] & Theta(2) 
nl10..  
    +(17.187500*x('c113')/(17.187500-x('c548'))) 
    +(6.875000*x('c114')/(6.875000-x('c548'))) 
    +(2.750000*x('c115')/(2.750000-x('c548'))) 
    -x('c109') =l= 0; 

Equation  nl11;   
* Stripping section equation for [1,3,3,4] & Theta(2) 
nl11..  
    -(2.750000*x('c116')/(2.750000-x('c548'))) 
    -(2.500000*x('c117')/(2.500000-x('c548'))) 
    -x('c110') =l= 0; 

Equation  nl12;   
* Rectifying section equation for [1,3,3,4] & Theta(3) 
nl12..  
    +(17.187500*x('c113')/(17.187500-x('c549'))) 
    +(6.875000*x('c114')/(6.875000-x('c549'))) 
    +(2.750000*x('c115')/(2.750000-x('c549'))) 
    -x('c109') =l= 0; 

Equation  nl13;   
* Stripping section equation for [1,3,3,4] & Theta(3) 
nl13..  
    -(2.750000*x('c116')/(2.750000-x('c549'))) 
    -(2.500000*x('c117')/(2.500000-x('c549'))) 
    -x('c110') =l= 0; 

Equation  nl14;   
* Rectifying section equation for [2,2,3,3] & Theta(2) 
nl14..  
    +(6.875000*x('c262')/(6.875000-x('c554'))) 
    -x('c258') =l= 0; 

Equation  nl15;   
* Stripping section equation for [2,2,3,3] & Theta(2) 
nl15..  
    -(2.750000*x('c263')/(2.750000-x('c554'))) 
    -x('c259') =l= 0; 

Equation  nl16;   
* Rectifying section equation for [2,3,4,5] & Theta(3) 
nl16..  
    +(6.875000*x('c338')/(6.875000-x('c558'))) 
    +(2.750000*x('c339')/(2.750000-x('c558'))) 
    -x('c334') =l= 0; 

Equation  nl17;   
* Stripping section equation for [2,3,4,5] & Theta(3) 
nl17..  
    -(2.500000*x('c340')/(2.500000-x('c558'))) 
    -(1.000000*x('c341')/(1.000000-x('c558'))) 
    -x('c335') =l= 0; 

Equation  nl18;   
* Rectifying section equation for [3,3,4,4] & Theta(3) 
nl18..  
    +(2.750000*x('c397')/(2.750000-x('c560'))) 
    -x('c393') =l= 0; 

Equation  nl19;   
* Stripping section equation for [3,3,4,4] & Theta(3) 
nl19..  
    -(2.500000*x('c398')/(2.500000-x('c560'))) 
    -x('c394') =l= 0; 

Equation  nl20;   
* Rectifying section equation for [4,4,5,5] & Theta(4) 
nl20..  
    +(2.500000*x('c444')/(2.500000-x('c563'))) 
    -x('c440') =l= 0; 

Equation  nl21;   
* Stripping section equation for [4,4,5,5] & Theta(4) 
nl21..  
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
Execute_unload 'Feedcase69_4_sol', x, mvd, returnStat 

