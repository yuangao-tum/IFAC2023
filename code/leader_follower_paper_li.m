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
L1=L(2:7,2:7)
lamda=eig(L1)
%
% Q2 = eye(2);
% G2 = -(C1)'*C1;
% [Qq,Kq,Lq] = icare(A',[],Q2,[],[],[],G2);
% Qq
% G=Qq*C1'
% p=[-0.5 -1];
% G= place(A',C1',p)'
%%Compute feedback gains of protocols
setlmis([])
Qq = lmivar(1,[2 1]);
lmiterm([-1 1 1 Qq],1 ,1);
lmiterm([2 1 1 Qq],1,A,'s') 
lmiterm([2 1 1 0],-2*C1'*C1)
lmis1 = getlmis;
[tmin,xfeas] = feasp(lmis1);
Qq = dec2mat(lmis1,xfeas,Qq)
F =-9.2*inv(Qq)*C1'
eig(A+F*C1)

% setlmis([])
% Pp = lmivar(1,[2 1]);
% lmiterm([-1 1 1 Pp],1 ,1);
% lmiterm([2 1 1 Pp],1,A','s') 
% lmiterm([2 1 1 0],-2*B*B.')
% lmis1 = getlmis;
% [tmin,xfeas] = feasp(lmis1);
% Pp = dec2mat(lmis1,xfeas,Pp)
% K =-B'*inv(Pp)
% 
% eig(A+B*K)
p=[-2.7 -2.5];
K= -place(A,B,p)
eig(A+B*K)
%mas
%%compact papameter for simulink
IN_1=eye(6);
Ak=kron(IN_1,A);
Bk=kron(IN_1,B);
Ek=kron(IN_1,E);
Ck1=kron(IN_1,C1);
Dk1=kron(IN_1,D1);
Ck2=kron(IN_1,C2);
Dk2=kron(IN_1,D2);

%%controller
Aw= kron(IN_1,A+B*K)+kron(L1,F*C1);
Fk=kron(L1,F);
Kk=kron(IN_1,K);

%%initial values of agent dynamics
xint=[2.5 7.5 -13 10 5 12 -9 -15 18 11 -2 -4 12 12]';
Xint=zeros(1,10);
Xint(1:2:12)=xint(3:2:14)-xint(1);
Xint(2:2:12)=xint(4:2:14)-xint(2);

%%Compute the gamma of controlled system
A0=[Ak,kron(IN_1,B*K);-kron(L1,F*C1), Aw];
eig(A0)
C0=[Ck2,kron(IN_1,D2*K)];
E0=[Ek;-kron(L1,F*D1)];

%%Compute the actuated H2 norm of controlled system
sys = ss(A0,E0,C0,zeros(12,12));
n = norm(sys,2)