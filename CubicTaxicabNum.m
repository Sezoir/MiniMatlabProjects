function ctn = CubicTaxicabNum(N)  
% CUBICTAXICABNUM return the smallest cubic taxicab number greater than 
% or equal to N %

% Want to find at least one solution to a^3+b^3=c^3+d^3=N for some constants a,b,c,d

% Set initial value of smallest cubic taxicab number
ctn = 0;
% Set initial value of counter
counter=0;
% Keep iterating untill we find the smallest cubic taxicab number
while(1)
    % Set 'a' to the smallest possible solution and 'b' to the largest 
    % possible solution.
    a=1;
    b=floor(nthroot(N, 3));
    % We use 2 facts here; first when we have found a pair, then neither
    % number of that pair can appear again as a solution for the current
    % 'N' so we increase 'a' by 1 and decrease 'b' by 1.
    % Second, we want to tend to a potential solution. So if the sum of 
    % our current values of 'a' and 'b' is:
    %   - less than our current 'N' we want to increase our 'a' by 1.
    %   - larger than our current 'N', then this tell us that there is no
    %     potential value of 'a' that will give us a potential solution, so
    %     we decrease b by 1 instead.
    % When we find a solution, then we dont need to store the pair of
    % values, so instead we use a "counter" variable to count the number of
    % pairs we have found.
    % We also obviously dont want to find repeat solutions, so we only keep
    % looking for solutions for 'N 'while 'a<b'.
    while(a<b)
            sum = a^3 + b^3; % Find the sum of a^3 and b^3.
            % Now test the sum and choose the correct decision for 'a' and
            % 'b'.
            if(sum<N)
               a = a+1;
            elseif(sum>N)
               b = b-1;
            else
               counter = counter+1; % Increase the counter.
               a = a+1;
               b = b-1;
            end
        % Check if we have more than 2 pairs, if so set the return varible
        % ctn to N, and then return control back to parent script.
        if(counter>=2)
            ctn = N;
            return
        end
    end
    % Every time we test a new value for if it is a cubic taxicab number we
    % want to reset the counter to 0/
    counter = 0;
    % Iterate to the next potential cubic taxicab number until it is
    % correct.
    N = N+1;
end