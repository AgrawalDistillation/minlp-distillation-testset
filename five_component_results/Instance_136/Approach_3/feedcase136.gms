$OnEolCom

Sets 
    b                  Track binary variables              /b1*b21/ 
    c                  Track continuous variables          /c22*c313/ 
    i                  Track linear equality constraints   /i1*i178/ 
    j                  Track linear inequality constraints /j1*j439/ 
    stat               Model and Solver status   /modelstat,solvestat/; 

Binary Variables 
    y(b)                List of binary variables; 

Variables 
    x(c)                List of continuous variables 
    mvd                 Objective function -- Minimum vapor duty; 

Parameters 
    objf(c)             Contains coefficients of variables in objective 
    Aeqbi(i,b)          Binary var coefficients in equality constraints 
    Aineqbi(j,b)        Binary var coefficients in inequality constraints 
    Aeqco(i,c)          Continuous var coefficients in equality constraints 
    Aineqco(j,c)        Continuous var coefficients in inequality constraints 
    beq(i)              RHS of equality constraints 
    bineq(j)            RHS of inequality constraints 
    xlb(c)              Lower bound on continuous variables 
    xub(c)              Upper bound on continuous variables 
    ylb(b)              Lower bound on binary variables 
    yub(b)              Upper bound on binary variables; 

$GDXIN 'feedcase136_data.gdx' 
$LOADDC objf Aeqbi Aineqbi Aeqco Aineqco beq bineq xlb xub ylb yub 
$GDXIN 

Equations 
    vapduty             Objective function 
    leqcon(i)           Linear equality constraints 
    lineqcon(j)         Linear inequality constraints; 

vapduty..   mvd =e= sum(c,objf(c)*x(c));
leqcon(i)..   sum(b,Aeqbi(i,b)*y(b))+sum(c,Aeqco(i,c)*x(c)) =e= beq(i);
lineqcon(j)..   sum(b,Aineqbi(j,b)*y(b))+sum(c,Aineqco(j,c)*x(c)) =l= bineq(j);

$OnText 
Nonlinear constraints begins 
First, Underwood feed equations are imposed followed by minimum vapor 
constraints and Distillation constraints 
$OffText 

Equation  nl1;  
* Feed eqn. for [1,2] & Theta(1) 
nl1..  
    +(17.187500*x('c220')/(17.187500-x('c176'))) 
    +(6.875000*x('c221')/(6.875000-x('c176'))) 
    -x('c284') =e= 0; 

Equation  nl2;  
* Feed eqn. for [1,3] & Theta(1) 
nl2..  
    +(17.187500*x('c222')/(17.187500-x('c177'))) 
    +(6.875000*x('c223')/(6.875000-x('c177'))) 
    +(6.250000*x('c224')/(6.250000-x('c177'))) 
    -x('c285') =e= 0; 

Equation  nl3;  
* Feed eqn. for [1,3] & Theta(2) 
nl3..  
    +(17.187500*x('c222')/(17.187500-x('c178'))) 
    +(6.875000*x('c223')/(6.875000-x('c178'))) 
    +(6.250000*x('c224')/(6.250000-x('c178'))) 
    -x('c285') =e= 0; 

Equation  nl4;  
* Feed eqn. for [1,4] & Theta(1) 
nl4..  
    +(17.187500*x('c225')/(17.187500-x('c179'))) 
    +(6.875000*x('c226')/(6.875000-x('c179'))) 
    +(6.250000*x('c227')/(6.250000-x('c179'))) 
    +(2.500000*x('c228')/(2.500000-x('c179'))) 
    -x('c286') =e= 0; 

Equation  nl5;  
* Feed eqn. for [1,4] & Theta(2) 
nl5..  
    +(17.187500*x('c225')/(17.187500-x('c180'))) 
    +(6.875000*x('c226')/(6.875000-x('c180'))) 
    +(6.250000*x('c227')/(6.250000-x('c180'))) 
    +(2.500000*x('c228')/(2.500000-x('c180'))) 
    -x('c286') =e= 0; 

Equation  nl6;  
* Feed eqn. for [1,4] & Theta(3) 
nl6..  
    +(17.187500*x('c225')/(17.187500-x('c181'))) 
    +(6.875000*x('c226')/(6.875000-x('c181'))) 
    +(6.250000*x('c227')/(6.250000-x('c181'))) 
    +(2.500000*x('c228')/(2.500000-x('c181'))) 
    -x('c286') =e= 0; 

Equation  nl7;  
* Feed eqn. for [2,5] & Theta(2) 
nl7..  
    +(6.875000*x('c241')/(6.875000-x('c189'))) 
    +(6.250000*x('c242')/(6.250000-x('c189'))) 
    +(2.500000*x('c243')/(2.500000-x('c189'))) 
    +(1.000000*x('c244')/(1.000000-x('c189'))) 
    +x('c292') =e= 0; 

Equation  nl8;  
* Feed eqn. for [2,5] & Theta(3) 
nl8..  
    +(6.875000*x('c241')/(6.875000-x('c190'))) 
    +(6.250000*x('c242')/(6.250000-x('c190'))) 
    +(2.500000*x('c243')/(2.500000-x('c190'))) 
    +(1.000000*x('c244')/(1.000000-x('c190'))) 
    +x('c292') =e= 0; 

Equation  nl9;  
* Feed eqn. for [2,5] & Theta(4) 
nl9..  
    +(6.875000*x('c241')/(6.875000-x('c191'))) 
    +(6.250000*x('c242')/(6.250000-x('c191'))) 
    +(2.500000*x('c243')/(2.500000-x('c191'))) 
    +(1.000000*x('c244')/(1.000000-x('c191'))) 
    +x('c292') =e= 0; 

Equation  nl10;  
* Feed eqn. for [3,5] & Theta(3) 
nl10..  
    +(6.250000*x('c247')/(6.250000-x('c193'))) 
    +(2.500000*x('c248')/(2.500000-x('c193'))) 
    +(1.000000*x('c249')/(1.000000-x('c193'))) 
    +x('c294') =e= 0; 

Equation  nl11;  
* Feed eqn. for [3,5] & Theta(4) 
nl11..  
    +(6.250000*x('c247')/(6.250000-x('c194'))) 
    +(2.500000*x('c248')/(2.500000-x('c194'))) 
    +(1.000000*x('c249')/(1.000000-x('c194'))) 
    +x('c294') =e= 0; 

Equation  nl12;  
* Feed eqn. for [4,5] & Theta(4) 
nl12..  
    +(2.500000*x('c250')/(2.500000-x('c195'))) 
    +(1.000000*x('c251')/(1.000000-x('c195'))) 
    +x('c295') =e= 0; 

Equation  nl13;  
* Feed eqn. for [2,3] & Theta(2) 
nl13..  
    +(6.875000*x('c229')/(6.875000-x('c186'))) 
    +(6.875000*x('c236')/(6.875000-x('c186'))) 
    +(6.250000*x('c230')/(6.250000-x('c186'))) 
    +(6.250000*x('c237')/(6.250000-x('c186'))) 
    -x('c287') +x('c290') =e= 0; 

Equation  nl14;  
* Feed eqn. for [2,4] & Theta(2) 
nl14..  
    +(6.875000*x('c231')/(6.875000-x('c187'))) 
    +(6.875000*x('c238')/(6.875000-x('c187'))) 
    +(6.250000*x('c232')/(6.250000-x('c187'))) 
    +(6.250000*x('c239')/(6.250000-x('c187'))) 
    +(2.500000*x('c233')/(2.500000-x('c187'))) 
    +(2.500000*x('c240')/(2.500000-x('c187'))) 
    -x('c288') +x('c291') =e= 0; 

Equation  nl15;  
* Feed eqn. for [2,4] & Theta(3) 
nl15..  
    +(6.875000*x('c231')/(6.875000-x('c188'))) 
    +(6.875000*x('c238')/(6.875000-x('c188'))) 
    +(6.250000*x('c232')/(6.250000-x('c188'))) 
    +(6.250000*x('c239')/(6.250000-x('c188'))) 
    +(2.500000*x('c233')/(2.500000-x('c188'))) 
    +(2.500000*x('c240')/(2.500000-x('c188'))) 
    -x('c288') +x('c291') =e= 0; 

Equation  nl16;  
* Feed eqn. for [3,4] & Theta(3) 
nl16..  
    +(6.250000*x('c234')/(6.250000-x('c192'))) 
    +(6.250000*x('c245')/(6.250000-x('c192'))) 
    +(2.500000*x('c235')/(2.500000-x('c192'))) 
    +(2.500000*x('c246')/(2.500000-x('c192'))) 
    -x('c289') +x('c293') =e= 0; 

$OnText 
End of Underwood Feed equations.
Underwood minimum vapor constraints section begins 
$OffText 

Equation  nl17;   
* Rectifying section equation for [1,2] & Theta(1) 
nl17..  
    +(17.187500*x('c252')/(17.187500-x('c176')))
    -x('c196') =l= 0; 

Equation  nl18;  
* Stripping section equation for [1,2] & Theta(1) 
nl18..  
    -(6.875000*x('c253')/(6.875000-x('c176')))
    -x('c197') =l= 0; 

Equation  nl19;   
* Rectifying section equation for [1,2] & Theta(1) 
nl19..  
    +(17.187500*x('c252')/(17.187500-x('c176')))
    -x('c196') =l= 0; 

Equation  nl20;  
* Stripping section equation for [1,2] & Theta(1) 
nl20..  
    -(6.875000*x('c253')/(6.875000-x('c176')))
    -x('c197') =l= 0; 

Equation  nl21;   
* Rectifying section equation for [1,3] & Theta(1) 
nl21..  
    +(17.187500*x('c254')/(17.187500-x('c177')))
    +(6.875000*x('c255')/(6.875000-x('c177')))
    -x('c198') =l= 0; 

Equation  nl22;  
* Stripping section equation for [1,3] & Theta(1) 
nl22..  
    -(6.875000*x('c256')/(6.875000-x('c177')))
    -(6.250000*x('c257')/(6.250000-x('c177')))
    -x('c199') =l= 0; 

Equation  nl23;   
* Rectifying section equation for [1,3] & Theta(2) 
nl23..  
    +(17.187500*x('c254')/(17.187500-x('c178')))
    +(6.875000*x('c255')/(6.875000-x('c178')))
    -x('c198') =l= 0; 

Equation  nl24;  
* Stripping section equation for [1,3] & Theta(2) 
nl24..  
    -(6.875000*x('c256')/(6.875000-x('c178')))
    -(6.250000*x('c257')/(6.250000-x('c178')))
    -x('c199') =l= 0; 

Equation  nl25;   
* Rectifying section equation for [1,4] & Theta(1) 
nl25..  
    +(17.187500*x('c258')/(17.187500-x('c179')))
    +(6.875000*x('c259')/(6.875000-x('c179')))
    +(6.250000*x('c260')/(6.250000-x('c179')))
    -x('c200') =l= 0; 

Equation  nl26;  
* Stripping section equation for [1,4] & Theta(1) 
nl26..  
    -(6.875000*x('c261')/(6.875000-x('c179')))
    -(6.250000*x('c262')/(6.250000-x('c179')))
    -(2.500000*x('c263')/(2.500000-x('c179')))
    -x('c201') =l= 0; 

Equation  nl27;   
* Rectifying section equation for [1,4] & Theta(3) 
nl27..  
    +(17.187500*x('c258')/(17.187500-x('c181')))
    +(6.875000*x('c259')/(6.875000-x('c181')))
    +(6.250000*x('c260')/(6.250000-x('c181')))
    -x('c200') =l= 0; 

Equation  nl28;  
* Stripping section equation for [1,4] & Theta(3) 
nl28..  
    -(6.875000*x('c261')/(6.875000-x('c181')))
    -(6.250000*x('c262')/(6.250000-x('c181')))
    -(2.500000*x('c263')/(2.500000-x('c181')))
    -x('c201') =l= 0; 

Equation  nl29;   
* Rectifying section equation for [2,3] & Theta(2) 
nl29..  
    +(6.875000*x('c264')/(6.875000-x('c186')))
    -x('c204') =l= 0; 

Equation  nl30;  
* Stripping section equation for [2,3] & Theta(2) 
nl30..  
    -(6.250000*x('c265')/(6.250000-x('c186')))
    -x('c205') =l= 0; 

Equation  nl31;   
* Rectifying section equation for [2,3] & Theta(2) 
nl31..  
    +(6.875000*x('c264')/(6.875000-x('c186')))
    -x('c204') =l= 0; 

Equation  nl32;  
* Stripping section equation for [2,3] & Theta(2) 
nl32..  
    -(6.250000*x('c265')/(6.250000-x('c186')))
    -x('c205') =l= 0; 

Equation  nl33;   
* Rectifying section equation for [2,4] & Theta(2) 
nl33..  
    +(6.875000*x('c266')/(6.875000-x('c187')))
    +(6.250000*x('c267')/(6.250000-x('c187')))
    -x('c206') =l= 0; 

Equation  nl34;  
* Stripping section equation for [2,4] & Theta(2) 
nl34..  
    -(6.250000*x('c268')/(6.250000-x('c187')))
    -(2.500000*x('c269')/(2.500000-x('c187')))
    -x('c207') =l= 0; 

Equation  nl35;   
* Rectifying section equation for [2,4] & Theta(3) 
nl35..  
    +(6.875000*x('c266')/(6.875000-x('c188')))
    +(6.250000*x('c267')/(6.250000-x('c188')))
    -x('c206') =l= 0; 

Equation  nl36;  
* Stripping section equation for [2,4] & Theta(3) 
nl36..  
    -(6.250000*x('c268')/(6.250000-x('c188')))
    -(2.500000*x('c269')/(2.500000-x('c188')))
    -x('c207') =l= 0; 

Equation  nl37;   
* Rectifying section equation for [2,5] & Theta(2) 
nl37..  
    +(6.875000*x('c270')/(6.875000-x('c189')))
    +(6.250000*x('c271')/(6.250000-x('c189')))
    +(2.500000*x('c272')/(2.500000-x('c189')))
    -x('c208') =l= 0; 

Equation  nl38;  
* Stripping section equation for [2,5] & Theta(2) 
nl38..  
    -(6.250000*x('c273')/(6.250000-x('c189')))
    -(2.500000*x('c274')/(2.500000-x('c189')))
    -(1.000000*x('c275')/(1.000000-x('c189')))
    -x('c209') =l= 0; 

Equation  nl39;   
* Rectifying section equation for [2,5] & Theta(4) 
nl39..  
    +(6.875000*x('c270')/(6.875000-x('c191')))
    +(6.250000*x('c271')/(6.250000-x('c191')))
    +(2.500000*x('c272')/(2.500000-x('c191')))
    -x('c208') =l= 0; 

Equation  nl40;  
* Stripping section equation for [2,5] & Theta(4) 
nl40..  
    -(6.250000*x('c273')/(6.250000-x('c191')))
    -(2.500000*x('c274')/(2.500000-x('c191')))
    -(1.000000*x('c275')/(1.000000-x('c191')))
    -x('c209') =l= 0; 

Equation  nl41;   
* Rectifying section equation for [3,4] & Theta(3) 
nl41..  
    +(6.250000*x('c276')/(6.250000-x('c192')))
    -x('c210') =l= 0; 

Equation  nl42;  
* Stripping section equation for [3,4] & Theta(3) 
nl42..  
    -(2.500000*x('c277')/(2.500000-x('c192')))
    -x('c211') =l= 0; 

Equation  nl43;   
* Rectifying section equation for [3,4] & Theta(3) 
nl43..  
    +(6.250000*x('c276')/(6.250000-x('c192')))
    -x('c210') =l= 0; 

Equation  nl44;  
* Stripping section equation for [3,4] & Theta(3) 
nl44..  
    -(2.500000*x('c277')/(2.500000-x('c192')))
    -x('c211') =l= 0; 

Equation  nl45;   
* Rectifying section equation for [3,5] & Theta(3) 
nl45..  
    +(6.250000*x('c278')/(6.250000-x('c193')))
    +(2.500000*x('c279')/(2.500000-x('c193')))
    -x('c212') =l= 0; 

Equation  nl46;  
* Stripping section equation for [3,5] & Theta(3) 
nl46..  
    -(2.500000*x('c280')/(2.500000-x('c193')))
    -(1.000000*x('c281')/(1.000000-x('c193')))
    -x('c213') =l= 0; 

Equation  nl47;   
* Rectifying section equation for [3,5] & Theta(4) 
nl47..  
    +(6.250000*x('c278')/(6.250000-x('c194')))
    +(2.500000*x('c279')/(2.500000-x('c194')))
    -x('c212') =l= 0; 

Equation  nl48;  
* Stripping section equation for [3,5] & Theta(4) 
nl48..  
    -(2.500000*x('c280')/(2.500000-x('c194')))
    -(1.000000*x('c281')/(1.000000-x('c194')))
    -x('c213') =l= 0; 

Equation  nl49;   
* Rectifying section equation for [4,5] & Theta(4) 
nl49..  
    +(2.500000*x('c282')/(2.500000-x('c195')))
    -x('c214') =l= 0; 

Equation  nl50;  
* Stripping section equation for [4,5] & Theta(4) 
nl50..  
    -(1.000000*x('c283')/(1.000000-x('c195')))
    -x('c215') =l= 0; 

Equation  nl51;   
* Rectifying section equation for [4,5] & Theta(4) 
nl51..  
    +(2.500000*x('c282')/(2.500000-x('c195')))
    -x('c214') =l= 0; 

Equation  nl52;  
* Stripping section equation for [4,5] & Theta(4) 
nl52..  
    -(1.000000*x('c283')/(1.000000-x('c195')))
    -x('c215') =l= 0; 

Equation  nl53;   
* Rectifying section equation for [1,4] & Theta(2) 
nl53..  
    +(17.187500*x('c258')/(17.187500-x('c180')))
    +(6.875000*x('c259')/(6.875000-x('c180')))
    +(6.250000*x('c260')/(6.250000-x('c180')))
    +x('c216')-x('c200') =e= 0; 

Equation  nl54;  
* Stripping section equation for [1,4] & Theta(2) 
nl54..  
    -(6.875000*x('c261')/(6.875000-x('c180')))
    -(6.250000*x('c262')/(6.250000-x('c180')))
    -(2.500000*x('c263')/(2.500000-x('c180')))
    +x('c216')-x('c201') =l= 0; 

Equation  nl55;   
* Rectifying section equation for [2,5] & Theta(3) 
nl55..  
    +(6.875000*x('c270')/(6.875000-x('c190')))
    +(6.250000*x('c271')/(6.250000-x('c190')))
    +(2.500000*x('c272')/(2.500000-x('c190')))
    +x('c219')-x('c208') =e= 0; 

Equation  nl56;  
* Stripping section equation for [2,5] & Theta(3) 
nl56..  
    -(6.250000*x('c273')/(6.250000-x('c190')))
    -(2.500000*x('c274')/(2.500000-x('c190')))
    -(1.000000*x('c275')/(1.000000-x('c190')))
    +x('c219')-x('c209') =l= 0; 

Model qp /all/;

$onecho > baron.136
SumName   "feedcase136bar.lst"
$offecho

qp.OptFile = 136;
x.lo(c) = xlb(c); x.up(c) = xub(c); 
y.lo(b) = ylb(b); y.up(b) = yub(b); 
* mvd.lo = 17.972704763938; mvd.up = 26.959057145906; 
Option minlp=baron;
Option OptCr = 0.01;
Option Reslim = 18000;
Solve qp minimizing mvd using minlp;


Parameter returnStat(stat), lower_bnd;
returnStat('modelstat') = qp.modelstat;
returnStat('solvestat') = qp.solvestat;
lower_bnd = qp.objEst;
Execute_unload 'feedcase136_sol', x, y, mvd, returnStat, lower_bnd 

