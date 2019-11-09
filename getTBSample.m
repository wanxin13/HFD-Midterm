function bsample = getTBSample(rc,n,a,T,kn)
    bsample = zeros(n*T,a); % to store the bootstrap sample
    M = floor(n/kn); % number of subintervals
    for t = 1:T
	% get returns matrix for day t
	id_day = (1:n)' + (t-1)*n;
	bsample(id_day,:) = getBSample(rc(id_day,:),n,a,kn);
    end
end