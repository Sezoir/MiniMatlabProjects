function [p,q] = RatAppCat(N) 
% RATAPPCAT The best rational approximation p/q of the Catalan's constant, 
% among all pairs of (p,q) such that p+q<=N.

%% Set initial values.
% Catalan’s constant.
G = 0.915965594177219; 
p=0; % Initial values of p.
q=1; % Initial values of q.
i=1; % Initial testing value for numerator.
j=1; % Initial testing value for denominator.
oldDiff = 1; % The difference between G and the last value of i & j.

% Keep looping while under constraint, and the denominator doesnt equal N
% (As the only value of i when j=N is 0).
while(i+j<=N && j~=N)
   % Calculate the new difference between G and the current i/j. Note we
   % use abs, as we don't care about sign, only size difference.
   diff = abs(G-i/j);
   
   % Check if the current i/j difference is smaller than the last best
   % difference. If so we update the return variables p,q, and oldDiff.
   if(diff < oldDiff)
       p = i;
       q = j;
       oldDiff = diff;
   % We check if the next variable of i+j+1 will exceed the restraint, and
   % if so we just want to move on to the next value of j. Note that we set
   % i equal to roughly 90% of j, as the Catalan's constant is greater than
   % 0.9, so we can skip a large amount of values by setting i high enough.
   elseif(i+j+1>N)
       j = j+1;
       i = i-ceil(0.1*j);
   % Check if the difference is still greater than the old difference, if
   % so we just want to increase i by 1 to attempt to get closer. Note we
   % also include i cannot equal j, as we want to increase j rather than
   % increase i at i=j.
   elseif(diff > oldDiff && i~=j)
       i = i+1;
   % Increase j by 1, and using the same reason as above for i.
   else
       j = j+1;
       i = i-ceil(0.1*j);
   end
end


%% Loop through each potential value of i and j.
% As we know Catalan's constant is greater than 0.9, then we can say that
% i/j>0.9 which implies i>0.9*j, so we set the lower bound of i equal to
% 0.9*j round down. The upper bound for i has to follow the constraint of
% i+j<=N, which we rearrange to i<=N-j, so we use N-j as our upper bound.
% for j = 1:1:N
%    for i = floor(0.9*j):1:N-j
%       % Find the difference between G and i/j. We only want to measure the
%       % "size" difference, so we ignore the sign with abs.
%       diff = abs(G-i/j);
%        % Check if the difference for the current i and j is better than the
%        % previous.
%        if(diff < oldDiff)
%            % Update the oldDiff with the new difference, and update the
%            % output variables p and q.
%             oldDiff = diff;
%             p = i;
%             q = j;
%        end 
%    end
% end
% % Easy way to simplify p/q fraction, and then want to swap back p and q to
% % double notation.
% [p, q] = numden(sym(p/q));
% p = double(p);
% q = double(q);
