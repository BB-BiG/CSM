function [ maskG ] = masking( sample, G)
%creates a mask with 'G' over 'sample'
%   G is the selected genes from CSMF and sample is either normal or
%   diseased sample
[r1,c1] = size(sample);
maskG(r1) = 0;
maskG(G) = 1;
maskG = maskG';
for i=2:c1
    maskG(:,i) = maskG(:,1);
end
maskG = logical(maskG);
end

