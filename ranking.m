function [ rank ] = ranking( normal, tumor, G_eta )
%% G_eta is the selected genes form CSMF
[r1,c1] = size(normal);
[r2,c2] = size(tumor);
n= size(G_eta,1);                   

%% masking is neccesary to extract the genes included in G_eta only
%% masking starts %%
maskG= masking(normal, G_eta);
normal=normal(maskG);
normal=reshape(normal,n,c1);

maskG1= masking(tumor, G_eta);
tumor=tumor(maskG1);
tumor=reshape(tumor,n,c2);

%% masking ends %%

for i=1:c1
    sample(:,i)=normal(:,i);
end
for i=1:c2
    sample(:,c1+i)=tumor(:,i);
end

%sample(:,i+c1)=tumor(:,i);
sample = sample';
for i=1:c1
    y(i)=0;
end
for i=1:c2
    y(i+c1)=1;
end
y=y';
r=0;

%% use of spider starts to get the ranks %%

str = 'C:\Users\its_Arnab\Documents\MATLAB\spider';  %% Folder where 'spider' is located
cd(str);
use_spider;
a=rfe;
a.feat=10;
a.output_rank=1;
d=data(sample,y);
[r,a]=train(a,d);
rank = a.rank;
end

