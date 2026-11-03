periods = 3; 
frequency = 1; 
samples_per_period = 500; 
total_samples = periods * samples_per_period;

t = linspace(0, periods, total_samples);

triangle_wave = 2 * abs(2 * (frequency*t - floor(frequency*t + 0.5))) - 1;

seg_start = 1; 
seg_end   = samples_per_period;
segment   = triangle_wave(seg_start:seg_end);
t_segment = t(seg_start:seg_end);

figure();
subplot(2,1,1);
plot(t, triangle_wave);
title('Original Triangle Wave - ' + string(periods) + ' Periods');
xlabel('Time');
ylabel('Amplitude');
xgrid();

subplot(2,1,2);
plot(t_segment, segment, 'r');
title('Extracted Segment');
xlabel('Time');
ylabel('Amplitude');
xgrid();

padded_segment = zeros(1, total_samples);
padded_segment(1:length(segment)) = segment;

corr_coeff = correl(triangle_wave', padded_segment');
disp('Correlation coefficient between signal and segment:');
disp(corr_coeff);

c = xcorr(triangle_wave, padded_segment);
lags = -(total_samples-1):(total_samples-1);

figure();
plot(lags, c);
title('Cross-Correlation between Signal and Segment');
xlabel('Lag');
ylabel('Correlation');
xgrid();
