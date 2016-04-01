num_bits = 100000;
var = 1;

Eb_dB = -5:5;
Eb = var * 10.^(Eb_dB / 10);
A = sqrt(Eb);
%A = [1 2 3 4 5 6 7 8 9 10 11];

state = 0;

%incoming bits. 
incoming = floor(rand(1, num_bits) + 0.5);

%error correction code. 
conv = zeros(1, 2*num_bits);
for i = 1:num_bits
    if state == 0
        if incoming(i) == 0
            conv(2*i-1) = 0;
            conv(2*i) = 0; %technically unnecessary.
            state = 0; %technically unnecessary. 
        else
            conv(2*i-1) = 1;
            conv(2*i) = 1;
            state = 1;
        end
    elseif state == 1
        if incoming(i) == 0
            conv(2*i-1) = 0;
            conv(2*i) = 1;
            state = 2;
        else
            conv(2*i-1) = 1;
            conv(2*i) = 0;
            state = 3;
        end
    elseif state == 2
        if incoming(i) == 0
            conv(2*i-1) = 1;
            conv(2*i) = 0;
            state = 0;
        else
            conv(2*i-1) = 0;
            conv(2*i) = 1;
            state = 1;
        end
    else
        if incoming(i) == 0
            conv(2*i-1) = 1;
            conv(2*i) = 1;
            state = 2;
        else
            conv(2*i-1) = 0; 
            conv(2*i) = 0;
            state = 3; %technically unnecessary. 
        end
    end
end
%A(1) = 10;
%bit to symbol
%here we use 0 to -A and 1 to A. 

prob_error = zeros(1, 11);

for j = 1:1
    symbols = A(j)*(2*conv - 1);

    noise = randn(1, 2*num_bits);

    receive = symbols + noise;
    min_dist = zeros(4, num_bits + 1);
    prev_path = zeros(4, num_bits + 1);

    %maintenance to make sure that the minpath does not 
    %start with a state other than zero. 
    min_dist(:,1) = [0 1000 1000 1000];
    prev_path(:,1) = [-1 -1 -1 -1];

    for i = 1:num_bits
       y0 = receive(2*i-1);
       y1 = receive(2*i);

       path00 = (y0 + A(j))^2 + (y1 + A(j))^2;
       path01 = (y0 - A(j))^2 + (y1 - A(j))^2;

       path13 = (y0 - A(j))^2 + (y1 + A(j))^2;
       path12 = (y0 + A(j))^2 + (y1 - A(j))^2;

       path21 = path12;
       path20 = path13;

       path32 = path01;
       path33 = path00;

       if min_dist(1,i)+path00 < min_dist(3,i)+path20
           min_dist(1,i+1) = min_dist(1,i)+path00;
           prev_path(1,i+1) = 0;
       else
           min_dist(1,i+1) = min_dist(3,i)+path20;
           prev_path(1,i+1) = 2;
       end

       if min_dist(3,i)+path21 < min_dist(1,i)+path01
           min_dist(2,i+1) = min_dist(3,i)+path21;
           prev_path(2,i+1) = 2;
       else
           min_dist(2,i+1) = min_dist(1,i)+path01;
           prev_path(2,i+1) = 0;
       end

       if min_dist(4,i)+path32 < min_dist(2,i)+path12
           min_dist(3,i+1) = min_dist(4,i)+path32;
           prev_path(3,i+1) = 3;
       else
           min_dist(3,i+1) = min_dist(2,i)+path12;
           prev_path(3,i+1) = 1;
       end 

       if min_dist(2,i)+path13 < min_dist(4,i)+path33
           min_dist(4,i+1) = min_dist(2,i)+path13;
           prev_path(4,i+1) = 1;
       else
           min_dist(4,i+1) = min_dist(4,i)+path33;
           prev_path(4,i+1) = 3;
       end
    end

    [m,index] = min(min_dist(:,num_bits+1));
    path = zeros(1, num_bits);
    path(num_bits) = index - 1;
    for i=0:num_bits-2
        path(num_bits-1-i) = prev_path(index, num_bits+1-i);  
        index = prev_path(index, num_bits+1-i) + 1;
    end

    decode = zeros(1, num_bits);
    state = 0;
    for i = 1:num_bits 
        if state == 0 || state == 2
            if path(i) == 0
                decode(i) = 0;
            else
                decode(i) = 1;
            end
        elseif state == 1 || state == 3
            if path(i) == 2
                decode(i) = 0;
            else
                decode(i) = 1;
            end
        end
        state = path(i);
    end

    prob_error(j) = mean(incoming ~= decode);
end