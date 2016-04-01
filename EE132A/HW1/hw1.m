n_values = 100000;
p = 9;
n = 4; %unused because it's given in noise sequence.

%read BitSequence.txt and NoiseSequence.txt
fileID = fopen('BitSequence.txt');
read = textscan(fileID, '%f');
fclose(fileID);
in = read{1};

fileID = fopen('NoiseSequence.txt');
read = textscan(fileID, '%f');
fclose(fileID);
noise = read{1};

%important variables for future use. 
x = (in * 2 - 1) * sqrt(p);

%transmission affected by noise.
y = x + noise;

%this is a more efficient way to compute num errors.
out = y > 0;
error = in ~= out;
p_error = mean(error); %find the probability of error. 

p_msg = sprintf('The probability of error is %f', p_error);
disp(p_msg);


% %repeat this computation for each pair of values.
% for i = 1:n_values
%     %encode the binary value. 
%     if in(i) == 0
%         x(i) = -sqrt(p);
%     else %if in(i) == 1
%         x(i) = sqrt(p);
%     end
% end

% %repeat this computation for each pair of values.
% for i = 1:n_values
%     %decode the received value. 
%     if y(i) <= 0
%         out(i) = 0;
%     else % if y > 0
%         out(i) = 1;
%     end
%     
%     %increment the number of errors if it's an error.
%     if in(i) ~= out(i)
%         n_errors = n_errors + 1;
%     end
% end