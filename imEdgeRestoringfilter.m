function a = imEdgeRestoringfilter(out, in, r)
[m,n,d] = size(in);
a = in;

if d >1
    diff = 0;
    for i = 1:m
        for j = 1:n
            b = out( max(i-r,1): min(i+r, m), max(j-r,1) : min(j+r,n) , :) - in(i,j,:);
            
            base = 300000;
            for ii = 1:size(b,1)
                for jj = 1:size(b,2)
                    diff = b(ii,jj,1)^2 +  b(ii,jj,2)^2 + b(ii,jj,3)^2;
                    if diff < base
                        base = diff;
                        a(i,j,:) = in(i,j,:) + b(ii,jj,:);
                    end
                end
            end
            
        end
    end
    
else
    for i = 1:m
        for j = 1:n
            b = out( max(i-r,1): min(i+r, m), max(j-r,1) : min(j+r,n) ) - in(i,j);
            c = abs(b(:));
            [~, ind] = min(c);
            a(i,j) = in(i,j) + b(ind);
        end
    end
    
end
