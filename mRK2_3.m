function [Tn,Wn] = mRK2_3(f,y0,I,tol)
%mEuler Método de Runge Kutta 2/3 explícito
%   resuelve el PVI y'=f(t,y), y(t0)=y0
% donde el vector I=[t0,t0+T] y tol es la tolereancia relativa

%inicializa valores
t=I(1);
Tn(1)=t;
Wn(1)=y0;
i=1;
h=1;
theta=0.0000001;

while t<I(2)
[w_nuevo, Erel]=paso_RK2_3(f, Wn(i),Tn(i), h);
  if(Erel>tol)
    h=(tol*(max(abs(Wn(i)),theta))/Erel)^(1/3)*h;
  else
    Wn(i+1)=w_nuevo;
    t=t+h;
    Tn(i+1)=t;
    i++;
  end
end
end

function [w_nuevo, Erel]= paso_RK2_3(f, w_viejo,t_viejo, h)
theta=0.0000001;
  S=zeros(1,3);
  S(1)=f(t_viejo,w_viejo);
  S(2)=f(t_viejo+h,w_viejo+h*S(1));
  S(3)=f(t_viejo+h/2,w_viejo+h/2*(S(1)+S(2)));
w_nuevo=w_viejo+h/2*(S(1)+S(2)); %Metodo del trapecio
  z=w_viejo+h/6*(S(1)+4*S(3)+S(2));
  ei=abs(w_nuevo-z); %aprox. error local
Erel=ei/(max(abs(w_viejo),theta));
end
