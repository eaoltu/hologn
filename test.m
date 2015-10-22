% hlg1=zeros(dim_learn(1), d);
% hlg2=zeros(dim_learn(1), d);
% hlg3=zeros(dim_learn(1), d);

hlg1=reshape(HGN(1,:,:),dim_learn(1), d);
hlg2=reshape(HGN(2,:,:),dim_learn(2), d);
hlg3=reshape(HGN(3,:,:),dim_learn(3), d);
%hlg2=HGN(2,1,:);
%hlg3(:,:)=HGN(3,:,:);

HD=imag(bin2com(hlg1)*bin2com(hlg3'))/d;
plot(HD)