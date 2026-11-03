// LOAD AUDIO FILE
[signal, sampling_rate] = wavread("C:\Users\Akshay\Downloads\file_example_WAV_1MG.wav");
 
// IF STEREO, CONVERT TO MONO
if size(signal, 1) == 2 then
    signal = mean(signal, 1);
end
 
// NORMALIZE THE SIGNAL
signal = signal / max(abs(signal));
 
// DEFINE A SMOOTHING KERNEL (MOVING AVERAGE)
kernel = ones(1, 1000) / 1000;
 
// PERFORM CONVOLUTION
convolved_signal = conv(signal, kernel, 'same');
 
// TIME VECTOR
t = linspace(0, length(signal)/sampling, length(signal));
 
// PLOT ORIGINAL AND CONVOLVED SIGNALS
figure();
subplot(2,1,1);
plot(t, signal);
title('Original Sound Signal');
 
subplot(2,1,2);
plot(t, convolved_signal);
title('Convolved Signal (Smoothed)');
 
// SAVE CONVOLVED SIGNAL AS NEW AUDIO FILE
wavwrite(convolved_signal, sampling, "C:\Users\Akshay\Downloads\file_example_WAV_1MG.wav");
