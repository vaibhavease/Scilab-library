Fs = 100;                 
t = 0:1/Fs:1;            
f = 5;                
x = sin(2*%pi*f*t);      

figure();
subplot(3,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');

D = 2;                       
x_down = x(1:D:$);          
t_down = t(1:D:$);

subplot(3,1,2);
plot(t_down, x_down, 'r');
title('Downsampled Signal (Factor = 2)');
xlabel('Time');
ylabel('Amplitude');
U = 2;                             
x_up = zeros(1, length(x)*U);
x_up(1:U:$) = x;                   
t_up = linspace(0, 1, length(x_up));

subplot(3,1,3);
plot(t_up, x_up, 'g');
title('Upsampled Signal (Factor = 2)');
xlabel('Time');
ylabel('Amplitude');

N = length(x);
X = fft(x);                     
mag = abs(X);                  
freq = (0:N-1)*(Fs/N);         

figure();
plot(freq, mag);
title('Magnitude Spectrum (FFT/DFT)');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
xgrid();
