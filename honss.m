clc
clear all
close all
a=input('enter the time of a frame from 1st base station = ');
b=input('enter the time of a frame from 2st base station = ');
k=input('Enter the number of attempts= ');      
kmax=input('Enter the maximum number of attempts= ');
Tp=input('enter the propagation time = ');
imax=2^k-1;
ab=randi(imax);
m=[1 0 1 0 ];
n=[0 1 0 1 ];
for i=1:4
    v(1,i)=m(i);
end
for i=1:4
    g(1,i)=n(i);
end

if (a<b)
    { figure(1)
        stairs(m,'r','Linewidth',2); 
        title('Transmitting signal ');
        }
else
    {figure(2)
        stairs(n,'r','Linewidth',2); 
        fprintf('Transmitting signal ');
        }
end
c=isequal(a,b);
if (c==0)
    {fprintf('channel is idle');
        }
else
    {fprintf('channel is busy');
        }
end

%1st persistent
if (c==0)
    {fprintf('information from 1st base station excahnges immediatly');
        }
else
    {fprintf('return to the initial stage');
        }
end

%transmission done

if (c==0 && a<b)
    { figure(3)
        fprintf('Transmission done with no collisions\n');
        fprintf('Received signal ');
        
        fprintf('%d',v);
        stairs(v,'r','Linewidth',2);
        title('Received signal');
        }
    break;
else if (a>b)
        {
        figure(4)
        fprintf('Transmission done with no collisions\n');
        fprintf('Received signal ');
        fprintf('%d',n);
        
        
        stairs(n,'r','Linewidth',2);
        title('Received signal');
        }
    
      break;
    
else if(c==1)
    {fprintf('collision detected\n');
        fprintf('Signal is not transmitted');
        }
    end
    end
end

if c==1
    fprintf('The frame is increased to k+1: %d \n',k+1);
end
    if k>kmax
        fprintf('Exceeded maximum number of attempts....ABORT\n');
    else
        fprintf('Choose a random number between 0 and 2^k-1\n');
        fprintf('The random number is= ')
        disp(ab);
        w=ab*Tp;
        fprintf('waiting time is= ');
        disp(w);
        fprintf('After %d seconds return to the persistent step',w);
        pause(w);
    end

//CSMA simple flow implementation