% S = vec2image(s, [6,8], [600,800])
function S = vec2image(s, windows, frame)
  nblocks = length(s)/prod(windows);
  %return to S'
  S = reshape(s, nblocks, prod(windows));
  S_cell = cell(frame(1)/windows(1),frame(2)/windows(2));
  size(S_cell)
  for i = 1:frame(1)/windows(1),
     for j = 1:frame(2)/windows(2),    
         S_cell{i,j} = reshape(S((i-1)*frame(2)/windows(2)+j, :),windows);
     end
  end
  
  S=cell2mat(S_cell);
end