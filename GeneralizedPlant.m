% defining generalized plant


systemnames= 'G Wp Wu Wn M';
inputvar= '[r ; d ; n ; u]' ;
outputvar= '[ Wp ; Wu ;  r-Wn-G ]' ;
input_to_G='[d;u]';
input_to_Wn='[n]';
input_to_M='[r]';
input_to_Wp='[G-M]' ;
input_to_Wu='[u]' ;
sysoutname='P'; 
cleanupsysic='yes';
sysic;
 

Pnom=P.Nominalvalue;



