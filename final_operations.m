function final_matrix = final_operations(normal_index, normal_support, diseased_index, tumor_support)
r = size(normal_index,1);
final_matrix = zeros(r,9);
final_matrix(:,1) = 1:r;
final_matrix(:,3) = normal_index;
norm_data = normal_support./max(normal_support);
final_matrix(:,4) = norm_data;
% for i=1:12484
% if final_matrix(i,4)<6
%     final_matrix(i,4) = 0;
% end
% end
final_matrix(:,5) = diseased_index;
final_matrix(:,6) = final_matrix(:,5) - final_matrix(:,3);
norm_data = tumor_support./max(tumor_support);
final_matrix(:,7) = norm_data;
final_matrix(:,8) = final_matrix(:,4).*final_matrix(:,6);
final_matrix(:,9) = final_matrix(:,7).*final_matrix(:,8);
end