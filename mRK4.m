function [Tn,Wn] = mRK4(f,y0,I,n)
%mEuler Método de Runge-Kutta de orden 4
%   resuelve el PVI y'=f(t,y), y(t0)=y0
% donde el vector I=[t0,t0+T] y n es el numero de pasos

Tn=linspace(I(1),I(2),n); %la malla del tiempo
Wn=zeros(1,size(Tn,2)); %preset Wn
Wn(1)=y0; %Condicion inicial
for i=1:size(Tn,2)-1
    Wn(i+1)=paso_RK4(f,Wn(i), Tn(i), Tn(i+1));
end
end

function [w_nuevo]= paso_RK4(f,w_viejo, t_viejo,t_nuevo)
h=t_nuevo-t_viejo;
S=zeros(1,4); %vector donde guardo las aproximaciones que usa el metodo
  S(1)=f(t_viejo, w_viejo); %pendiente izquierda
  S(2)=f(t_viejo+h/2,w_viejo+h/2*S(1)); %pendiente punto medio
  S(3)=f(t_viejo+h/2,w_viejo+h/2*S(2)); %mejor aproximacion de la pendiente en el punto medio
  S(4)=f(t_viejo+h, w_viejo+h*S(3)); %pendiente mejorada a la derecha
w_nuevo=w_viejo+h/6*(S(1)+2*S(2)+2*S(3)+S(4)); %El paso
end
