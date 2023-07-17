x11=out.x11;
x12=out.x12;
w1=out.w1;
w2=out.w2;
e1=out.e1;
e2=out.e2;
ep1=out.ep1;
ep2=out.ep2;
%
T=0:0.01:60;
figure1 = figure;
figure1.Position = [50 50 550 450];
hold on
grid on
plot3(T,x11(:,1)',x12(:,1)','LineWidth',2)
plot3(T,x11(:,2)',x12(:,2)',':','LineWidth',1.5)
plot3(T,x11(:,3)',x12(:,3)',':','LineWidth',1.5)
plot3(T,x11(:,4)',x12(:,4)',':','LineWidth',1.5)
plot3(T,x11(:,5)',x12(:,5)',':','LineWidth',1.5)
plot3(T,x11(:,6)',x12(:,6)',':','LineWidth',1.5)
plot3(T,x11(:,7)',x12(:,7)',':','LineWidth',1.5)
legend('leader','follower1','follower2','follower3','follower4','follower5','follower6','Location','northeast')
xlabel('Time(sec)')
ylabel('x1(t)')
zlabel('x2(t)')
view(50,40)
hold off

% axes('Position',[0.45,0.55,0.38,0.28]);
% hold on
% grid on
% plot3(T,x11(:,1)',x12(:,1)','r','LineWidth',3)
% plot3(T,x11(:,2)',x12(:,2)',':','LineWidth',2)
% plot3(T,x11(:,3)',x12(:,3)',':','LineWidth',2)
% plot3(T,x11(:,4)',x12(:,4)',':','LineWidth',2)
% plot3(T,x11(:,5)',x12(:,5)',':','LineWidth',2)
% plot3(T,x11(:,6)',x12(:,6)',':','LineWidth',2)
% plot3(T,x11(:,7)',x12(:,7)',':','LineWidth',2)
% xlabel('Time(sec)')
% ylabel('x1(t)')
% zlabel('x2(t)')
% xlim([0,2]); 
% ylim([-50,10]);
% zlim([-10,50]);
% hold off

%
figure(2)
subplot(2,1,1);
hold on
grid on
plot(T,w1(:,1)','LineWidth',2)
plot(T,w1(:,2)','LineWidth',2)
plot(T,w1(:,3)','LineWidth',2)
plot(T,w1(:,4)','LineWidth',2)
plot(T,w1(:,5)','LineWidth',2)
plot(T,w1(:,6)','LineWidth',2)
hold off
legend('v_{11}','v_{21}','v_{31}','v_{41}','v_{51}','v_{61}')
xlabel('Time(sec)')
subplot(2,1,2);
hold on 
grid on
plot(T,w2(:,1)','LineWidth',2)
plot(T,w2(:,2)','LineWidth',2)
plot(T,w2(:,3)','LineWidth',2)
plot(T,w2(:,4)','LineWidth',2)
plot(T,w2(:,5)','LineWidth',2)
plot(T,w2(:,6)','LineWidth',2)
legend('v_{12}','v_{22}','v_{32}','v_{42}','v_{52}','v_{62}')
xlabel('Time(sec)')
hold off
%
figure(3)
subplot(2,1,1);
hold on
grid on
plot(T,e1(:,1)','LineWidth',2)
plot(T,e1(:,2)','LineWidth',2)
plot(T,e1(:,3)','LineWidth',2)
plot(T,e1(:,4)','LineWidth',2)
plot(T,e1(:,5)','LineWidth',2)
plot(T,e1(:,6)','LineWidth',2)
hold off
legend('e_{11}','e_{21}','e_{31}','e_{41}','e_{51}','e_{61}')
xlabel('Time(sec)')
subplot(2,1,2);
hold on 
grid on
plot(T,e2(:,1)','LineWidth',2)
plot(T,e2(:,2)','LineWidth',2)
plot(T,e2(:,3)','LineWidth',2)
plot(T,e2(:,4)','LineWidth',2)
plot(T,e2(:,5)','LineWidth',2)
plot(T,e2(:,6)','LineWidth',2)
legend('e_{12}','e_{22}','e_{32}','e_{42}','e_{52}','e_{62}')
xlabel('Time(sec)')
hold off


figure4 = figure;
figure4.Position = [50 50 550 505];
ax(1)=subplot(2,1,1);
hold on
grid on
plot(T,x11(:,1)','LineWidth',2)
plot(T,x11(:,2)',':','LineWidth',1.5)
plot(T,x11(:,3)',':','LineWidth',1.5)
plot(T,x11(:,4)',':','LineWidth',1.5)
plot(T,x11(:,5)',':','LineWidth',1.5)
plot(T,x11(:,6)',':','LineWidth',1.5)
plot(T,x11(:,7)',':','LineWidth',1.5)
hold off
legend('x_{11}','x_{21}','x_{31}','x_{41}','x_{51}','x_{61}','x_{71}','Orientation','horizontal','Location','northoutside')
xlabel('Time(sec)')
ylim([-20 25])
ax(2)=subplot(2,1,2);
hold on 
grid on
plot(T,x12(:,1)','LineWidth',2)
plot(T,x12(:,2)',':','LineWidth',1.5)
plot(T,x12(:,3)',':','LineWidth',1.5)
plot(T,x12(:,4)',':','LineWidth',1.5)
plot(T,x12(:,5)',':','LineWidth',1.5)
plot(T,x12(:,6)',':','LineWidth',1.5)
plot(T,x12(:,7)',':','LineWidth',1.5)
legend('x_{12}','x_{22}','x_{32}','x_{42}','x_{52}','x_{62}','x_{72}','Orientation','horizontal','Location','northoutside')
xlabel('Time(sec)')
ylim([-20 30])
MagInset(figure4, ax(1), [30 60 10 15], [15 45 -13 2], {'NE','SE';'SW','NW'});
MagInset(figure4, ax(2), [30 60 10 15], [15 45 -13 2], {'NE','SE';'SW','NW'});
hold off

figure5 = figure;
figure5.Position = [50 50 550 520];
ax(1)=subplot(2,1,1);
hold on
grid on
plot(T,ep1(:,1)','LineWidth',1)
plot(T,ep1(:,2)','LineWidth',1)
plot(T,ep1(:,3)','LineWidth',1)
plot(T,ep1(:,4)','LineWidth',1)
plot(T,ep1(:,5)','LineWidth',1)
plot(T,ep1(:,6)','LineWidth',1)
hold off
legend('\epsilon_{11}','\epsilon_{21}','\epsilon_{31}','\epsilon_{41}','\epsilon_{51}','\epsilon_{61}','Orientation','horizontal','Location','northoutside')
xlabel('Time(sec)')
ylim([-55 35])
ax(2)=subplot(2,1,2);
hold on 
grid on
plot(T,ep2(:,1)','LineWidth',1)
plot(T,ep2(:,2)','LineWidth',1)
plot(T,ep2(:,3)','LineWidth',1)
plot(T,ep2(:,4)','LineWidth',1)
plot(T,ep2(:,5)','LineWidth',1)
plot(T,ep2(:,6)','LineWidth',1)
legend('\epsilon_{12}','\epsilon_{22}','\epsilon_{32}','\epsilon_{42}','\epsilon_{52}','\epsilon_{62}','Orientation','horizontal','Location','northoutside')
xlabel('Time(sec)')
ylim([-25 25])
MagInset(figure5, ax(1), [30 60 -6 6], [15 45 12 32], {'NE','NE';'SW','SW'});
MagInset(figure5, ax(2), [30 60 -4 4], [15 45 12 22], {'NE','NE';'SW','SW'});
hold off

