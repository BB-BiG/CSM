genes = g.Data(:,2);
emptyspots = strcmp('',genes);
genes(emptyspots,:)=[];

emptyspots = strcmp('--Control',genes);
genes(emptyspots,:)=[];
normal = Create_Table(109,109,22215,g.Data);
tumor = Create_Table(60,60,22215,g.Data);
tumor(~any(~isnan(tumor),2),:)=[];
normal(~any(~isnan(normal),2),:)=[];