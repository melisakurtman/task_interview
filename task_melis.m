%RANGE AND ENDURANCE: PROPELLER-DRIVEN AIRPLANE
%Constant angle of attack flight will give constant lift and drag coefficients and constant altitude will give constant density. We will also assume constant specific fuel consumption.
%Additional info: The maximum range of the piston-prop aircraft Bonanza is 1692 km,
%Maximum Range at:
 %Flight Schedule A and B: Angle-of-Attack constant, a = const, and either airspeed constant V=const, or altitude constant, p= const. 
  %i.	Constant Velocity
%For find mass of fuel;
clc;
clear;
clear all;
df=800; %kg/m^3      
Vf=1.2;  %1m^3=1000l Vf=1200l
Wf=df*Vf; %df=mf/v  
W1=2500; %kg %Max weight: 
%The empty weight is
%W2=W1-Wf   W2=2500-960=1540kg but we will take 1640 kg due to the fact that there are 100 litres of fuel remaining on aircraft.
W2=1640;
SFCcruise=0.2; %kg/kw/h %The specific fuel consumption, in consistent units, is 1kg=2,205lb   1KW=737,8 ft.lb/s  1h=3600s
C=2.723e-3;  %C=8,301e-7ft^(-1)=2,723x10^(-3) km^-1                   
%Maximum Range - requires minimum drag (or maximum L/D) conditions.
%CDmin is the zero lift (friction/parasitic) drag.
%The maximum range is achieved when the aircraft is cruising with a speed corresponding to the maximum lift-to-drag ratio
K=0.035;        
Cdmin=0.022;
Cd0=Cdmin;
Sref=20; %m^2      
np=0.8;

a=(1)/((2)*(sqrt(K*Cd0)))%a=L/Dmax value
R=(np/C)*a*log(W1/W2)

%ii.	Constant Altitude

W_1=24516.625; %Newton=25000kg
c=1.463; %Value of SFC calculated kg/kw/h   to   N/h/hp unit. So c=1,463 for below equation
rho=0.65; %kg/m^3
Em=a
zeta=860/2500
V_BR=sqrt((2*(W_1/Sref))/(rho))*(((3*K)/(Cd0))^(1/4))*3.6 %multiplied by 3.6 to convert to km/h.
X_BR=((1.732*Em*V_BR)/c)*(1-sqrt(1-zeta)) %range for constant altitude form Hayri Acar's notes

%(b)	Maximum Endurance at
%C_L^(3∕2))/C_D   max endurance for propeller aircrafts

	%i.Constant Velocity
%The following text and information about max endurance at constant velocity and constant altitude are taken from the book of Sadraey; Aircraft Performance.
%For a flight program where speed and lift coefficient are held constant, an expression for the maximum endurance will be readily obtained from Equation 6.111. Assuming ηP, C, and G to be constant, the endurance in this fl¬ight program is only a function of lift-to-drag ratio (L/D) and velocity (V), but independent of altitude. However, lift-to-drag ratio is a function of airspeed. Therefore, in order to maximize the endurance, one must ¬y at a velocity that maximizes the ratio (L/D)/V. Thus, the maximum endurance will be obtained from the following expression:
%For a typical aircraft, the ratio (L/D)/V is maximized, when it is cruising with a speed equal to minimum power speed (Equation 6.117). As we derived earlier (Equation 6.119), the minimum power lift-to-drag ratio is 86.6% of the maximum lift-to-drag ratio. Thus,
g=9.81;
Vminp=sqrt((2*W1*g)/(rho*Sref*sqrt(3*Cd0/K))) %m/s
Emax=((0.866*np*a)/(Vminp*C))*log(W1/W2) %s=10.242h

    %ii.	Constant Altitude
W_2=W2*9.81;
b=0.57/(K^(3/4)*Cd0^(1/4)) %b=(Cl^(3/2)/Cd)max    
E2=(np/C)*sqrt(2*rho*Sref)*b*((1/sqrt(W_2))-(1/sqrt(W_1))) %s=11.404h

%task1 wanted me to Show how the best angle of attack for maximum range and for maximum endurance were selected.
Cl_0=0.4; 
Cl_a=5.7/57.3; % 1/rad to degree 
Cl=sqrt(Cd0/K) %L/Dmax ratio is significant for max range so ı calculated according to this ratio
alpha=(Cl-Cl_0)/Cl_a    
