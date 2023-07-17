clc
clear all
%%system parameters
%A=[0 1;-1 0]
%A = [-2, 1.5;-1 1];
%A = [0.0001, 0.01;-0.1 0.0003];
%A = [0.1 0.1;0 0.1];
A = [-2, 2;-1 1];
eig(A)
B = [0;1];
C1= [1 0];
C2=[1 1.2; 0 0];
E =[0.6 0;1 0];
D1= [0 1];
D2= [0 1]';
D1*E'
D2'*C2
D1*D1'
D2'*D2
rank(ctrb(A,B))
rank(obsv(A,C1))
L=[0 0 0 0 0 0 0;-1 3 -1 0 0 0 -1;0 -1 2 -1 0 0 0;0 0 -1 2 -1 0 0 ;0 0 0 -1 2 -1 0;0 0 0 0 -1 2 -1; 0 -1 0 0 0 -1 2];
%L=[ 3 -1 0 0 0 -1 -1;-1 2 -1 0 0 0 0; 0 -1 2 -1 0 0 0; 0 0 -1 2 -1 0 0; 0 0 0 -1 2 -1 0;  -1 0 0 0 -1 2 0; 0 0 0 0 0 0 0];
L1=L(2:7,2:7)
lamda=eig(L1)
c=2/(lamda(1)+lamda(6));

%%Compute feedback gains of protocols
G1=(c^2*lamda(6)^2-2*c*lamda(6))*B*B.'
delta=0.001;
Q1=C2'*C2+delta*eye(2);
[Pp,Kp,Lp] = icare(A,[],Q1,[],[],[],G1);
Pp
F=-c*B'*Pp
%
eta=0.001;
Q2 = E*E'+eta*eye(2);
G2 = -(C1)'*C1;
[Qq,Kq,Lq] = icare(A',[],Q2,[],[],[],G2);
Qq
G=Qq*C1'

%%compact papameter for simulink
IN_1=eye(6);
Ak=kron(IN_1,A);
Bk=kron(IN_1,B);
Ek=kron(IN_1,E);
Ck1=kron(IN_1,C1);
Dk1=kron(IN_1,D1);
Ck2=kron(IN_1,C2);
Dk2=kron(IN_1,D2);
%G = [1.5 1.5];
%F = 
%%controller
Aw= kron(IN_1,A-G*C1)+kron(L1,B*F);
Gk=kron(L1,G);
Fk=kron(IN_1,F);

%%initial values of agent dynamics
xint=[2.5 7.5 -13 10 5 12 -9 -15 18 11 -2 -4 12 12]';
Xint=zeros(1,10);
Xint(1:2:12)=xint(3:2:14)-xint(1);
Xint(2:2:12)=xint(4:2:14)-xint(2);

A0=[Ak,kron(IN_1,B*F);kron(L1,G*C1), Aw];
eig(A0)
C0=[Ck2,kron(IN_1,D2*F)];
E0=[Ek;kron(L1,G*D1)];
%%Compute the gamma of controlled system
gamma=6*(trace(C1*Qq*Pp*Qq*C1')+trace(C2*Qq*C2'))
sqrt(92)
%%Compute the actuated H2 norm of controlled system
sys = ss(A0,E0,C0,zeros(12,12));
n = norm(sys,2)



