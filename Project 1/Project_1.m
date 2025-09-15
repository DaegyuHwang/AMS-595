%
% Simulation to approximate the value of π.
%
% Using three different approach to approxiate the value 
% David Hwang Sep 2025

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 1: Using "for" loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameter
N=10000; % fixed number of random points
count=0; % counter % the number of points inside the circle with radius 1
com_pi=zeros(1,N); % vector for computed value of π
Num=1:1:N; % Number vector % vector of number point
time=zeros(1,N); % excution time vector
T=0; % T is a number to save the excution time for each step.

dots=rand(2,N); % generate N-coupled random dots
x=dots(1,:); y=dots(2,:); % use 1st row as x-coordinate and 2nd row as y-coordinate

% main equation
for i=Num
    tic;
    if sqrt(x(i)^2+y(i)^2)<=1 % the condition that random points are inside the circle.
        count = count+1;
    end
    com_pi(i)=count/i*4; % the area of the circle is π/4. the area of the squre is 1. then to get π, we need to muliply 4 here.
    T=T+toc; 
    time(i)=T; % measure the execution time for each point counts
end
error=pi-com_pi; % deviation vector
abs_er=abs(error); % absolute deviation vector
precision=zeros(1,N);
for i = Num
    % The percentage precision is 100 minus the percentage error
    precision(i) = (1 - (abs_er(i)/pi))*100;
end

% plot
figure(1); clf; hold on;
yline(pi,'r--', 'LineWidth', 1.5); plot(Num,com_pi, 'LineWidth',1);
plot(Num, error, 'LineWidth', 1); plot(Num, abs_er, 'LineWidth', 1);
xlabel('Number of Points'); ylabel('Value');
legend('true value of \pi','computed value of \pi', 'deviation', 'absolute deviation')
title('Fig.1: Approximation of \pi using fixed number of Random Points in a For loop');
grid on; hold off;

% I am not quite sure the meaning of "create a plot comparing the precision to the computational cost"
figure(2); 
plot(time, precision); 
xlabel('Computational Cost; Time (0.001 Second)'); ylabel('Precision (percentage)')
title('Fig.2: Precision vs. Computatinoal Cost')
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 2: Using "while" loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameter
v=[]; % vector to contain random dots
count=0; % counter
N=0; % counter to record the number of iteration; the number of created random dots
bool=true; % boolean to run the while loop
com_pi=[]; % vector of computed value of pi


% main equation
while bool==true
    N=N+1;
    dot=rand(2,1); % generate one-coupled random dot
    if sqrt(dot(1)^2+dot(2)^2)<=1
        count=count+1;
    end
    com_pi=[com_pi; count/N*4]; % add a computed pi to the vector
    if N<51 % first condition of precision to use the law of large numbers
    elseif max(com_pi(N-50:N))-min(com_pi(N-50:N))<=0.00005 % second condition of precision
        bool=false;
    end    
end

fprintf("%d iterations are completed",N) % we can check how many iterations are required

% plot
figure(3); clf; hold on;
yline(pi,'r--', 'LineWidth', 1.5); plot(com_pi, 'LineWidth', 1); hold off;
xlabel('Number of Iterations; # of points'); ylabel('Computed Value of \pi');
legend('True value of \pi','Computed \pi');
title('Fig.3: Approximation of \pi using Random Points in a While Loop');
grid on;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Task 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function final_pi=compute_pi()
    
    % parameter
    v=[]; % vector to contain random dots
    count=0; % counter
    N=0; % counter to recodr the number of iteration; the number of created random dots
    bool=true; % boolean to run the while loop
    com_pi=[]; % vector of computed value of pi
    dot_v1=[]; % vector of randomly created dots inside the circle
    dot_v2=[]; % vector of randomly created dots outside the circle
    precision=input('Enter the level of precision: '); % need to revise
    r=1; % radius
    theta=linspace(0,pi/2,50); % we are going to draw a quarter of the circle; we only need from 0 to pi/2 radian
    
    
    % main equation
    while bool==true
        N=N+1;
        dot=rand(2,1); % generate one-coupled random dot
        if sqrt(dot(1)^2+dot(2)^2)<=1
            count=count+1; dot_v1=[dot_v1,dot]; % add a randomly created dot to the vector; maintaining the size of matrix as 2 by N
        else; dot_v2=[dot_v2,dot]; 
        end
        com_pi=[com_pi; count/N*4]; % add a computed pi to the vector
        if N<51
        elseif max(com_pi(N-50:N))-min(com_pi(N-50:N))<=precision
            bool=false;
        end    
    end
    
    fprintf('The computed value of π is: %f\n', com_pi(end));
    txt=sprintf('\\pi: %f',com_pi(end));
    final_pi=com_pi(end); % assign the final computed value to the output
    
    % plot
    figure(4); clf; subplot(1,2,1); hold on;
    yline(pi,'r--', 'LineWidth', 1.5); plot(com_pi, 'LineWidth', 1); 
    text(length(com_pi),com_pi(end)+0.05,txt,'FontWeight', 'bold'); hold off;
    xlabel('Number of Iterations; # of points'); ylabel('Computed Value of \pi');
    legend('True value of \pi','Computed \pi');
    title('Approximation of \pi using Random Points in a While Loop');
    grid on;
    
    subplot(1,2,2); hold on;
    scatter(dot_v1(1,:),dot_v1(2,:),12,'filled','r'); 
    scatter(dot_v2(1,:),dot_v2(2,:),12,'filled','b');
    plot(r*cos(theta),r*sin(theta),'k');
    text(0.68,0.87,txt,'FontWeight', 'bold');
    hold off;
    xlabel('X-axis');ylabel('Y-axis');
    legend('dots inside the cirlce','dots outside the cirlce','quarter line of the circle')
    title('Created random points');
    grid on;
end

Result=compute_pi();


