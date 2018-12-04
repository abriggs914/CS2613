function out = monochrome(in, weights=[0.21,0.72,0.07])
  #out = in .* reshape(weights,[1,1,3]);
  #out = in .* vec(weights, 3);
  out = sum(scale_layers(in, weights),3);
endfunction