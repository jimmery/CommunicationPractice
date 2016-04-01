num_bits = 100000;
var = 1;

Eb_dB = -5:5;
Eb = var * 10.^(Eb_dB / 10);
A = sqrt(Eb);

state = 0;

conv = zeros(num_bits, 2);

incoming = floor(rand(1, num_bits) + 0.5);
for i = 1:num_bits
    if state == 0
        if incoming(i) == 0
            conv(i,:) = [0 0]; %technically unnecessary.
            state = 0; %technically unnecessary. 
        else
            conv(i,:) = [1 1];
            state = 1;
        end
    elseif state == 1
        if incoming(i) == 0
            conv(i,:) = [0 1];
            state = 2;
        else
            conv(i,:) = [1 0];
            state = 3;
        end
    elseif state == 2
        if incoming(i) == 0
            conv(i,:) = [1 0];
            state = 0;
        else
            conv(i,:) = [0 1];
            state = 1;
        end
    else
        if incoming(i) == 0
            conv(i,:) = [1 1];
            state = 2;
        else
            conv(i,:) = [0 0];
            state = 3; %technically unnecessary. 
        end
    end
end

