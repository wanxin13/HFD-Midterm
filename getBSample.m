function bsample = getBSample(rc,n,a,kn)
    bsample = zeros(n,a); % to store the bootstrap sample
    M = floor(n/kn); % number of subintervals
    for s = 1:M
	id_sub = ((s-1)*kn+1:s*kn)';
	id_rc = unidrnd(kn,kn,1) + (s-1)*kn; % resample with replacement
	bsample(id_sub,:) = rc(id_rc,:);
    end
end