%Image encoding
%checking and encoding class 1 only sofar

%dimension of hologn
d=10000;

ql=100;
binranges=zeros(ql,1);
for i=2:ql
binranges(i)=binranges(i-1)+1/ql;
end


numclass=3;
filename=[];

for i=1:numclass
str='';   
str=strcat('Class',int2str(i),'_tr.xlsx');
A(i,:,:)=xlsread(str);
CL(i,:,:)=A(i,:,130:end);
CL_learn(i,:,:)=CL(i,1:2:end,:);
CL_test(i,:,:)=CL(i,2:2:end,:);
end

%A=xlsread(filename);

%CL=A(:,2:end);

% MIN= min(CL);
% MAX= max(CL);
% MEDIAN=median(CL);
% 
% MAXOFMAX=max(MAX);
% MINOFMEDIAN=min(MEDIAN);
% MEANOFMEDIAN=mean(MEDIAN);

%quantize and encode 
%ql is the quantization coefficient
% To quantize each element of the matrix will be multiplied by the
% coefficient and the floor will be taken



%for classification we take every second row starting from row 1


%USE CL_check=CL(2:2:end,:); for cecking

%CL_learn_quant=floor(CL_learn*ql);
%CL_test_quant=floor(CL_test*ql);


%MIN_q= min(CL_learn_quant);
%MAX_q= max(CL_learn_quant);
%MEDIAN_q=median(CL_learn_quant);

%MAXOFMAX_q=max(MAX_q);
%MINOFMEDIAN_q=min(MEDIAN_q);
%MEANOFMEDIAN_q=mean(MEDIAN_q);



%trully quantize variable ind tells the level

for i=1:numclass
[bincounts,ind] = histc(CL_learn(i,:,:),binranges);
CL_learn_quant(i,:,:)=ind;
dim_learn(i)=size(CL_learn_quant(i,:,:),2);
end

%encode this matrix
for i=1:numclass
% HGN=zeros(numclass,dim_learn(i),d);
for j=1:dim_learn(i)

    pattern=reshape(CL_learn_quant(i,j,:),1,size(CL_learn_quant,3));
    HGN(i,j,:)=hologn_encoder(pattern);
    
end



end
% %trully quantize variable ind tells the level
% [bincounts,ind] = histc(CL_test,binranges)
% CL_test_quant=ind;
% dim_test=size(CL_test_quant,1);
% 
% HGN_test=zeros(dim_test,d);
% for i=1:dim_test
% 
%     pattern=CL_test_quant(i,:);
%     HGN_test(i,:)=hologn_encoder(pattern);
%     
% end
% 
% HGN_CL=majority_sum(HGN);
% 
% %Check now the accuracy of recall for eachg of the rows from the training sequence
% HD=imag(bin2com(HGN(1,:))*bin2com(HGN'))/10000;
% plot(HD)