## usage: passes = checkdiet(TABLE, MINS, DIET)
##
## Check if DIET passes the min daily requirements
##   TABLE(i,j) is the amount of nutrient i in food j
##   MINS(i) = minimum amount of nutrient i required
##   DIET(j) = amount of food j in proposed diet
function yesno = checkdiet(table, mins, diet)
  x = diet-mins;
  z = sum(x);
  r = sum(diet);
  s = sum(mins);
  t = sum(sum(table));
  y = zeros(size(mins,1),size(mins,2));
  if t < s || z < 0
    yesno = 0;
  else
    yesno = 1;
  endif
end

# couldnt get the last two test to pass correctly.
# I think it is because of how I decide how much food
# we have. I subtracted the mins from the diet to determine
# if there is enough from the beginning, then I check the 
# table to determine if we have enough.

# The two weaknesses in the test coverage is that we do not check
# the null case (no food given or no minimum given)
# as well, it assumes that all matrices will be of similar
# dimensions, i.e. not more rows or columns in MINS vs. DIET, and
# the same rows as TABLE, MINS and DIET.

%!test
%! assert(checkdiet(eye(3),ones(3,1),ones(3,1)) == 1)
%!test
%! assert(checkdiet(eye(3),zeros(3,1),[1;0;0]) == 1)
%!test
%! assert(checkdiet(eye(3),[1;0;0],zeros(3,1)) == 0)
%!test
%! assert(checkdiet(eye(3),[1;0;0],0.5*ones(3,1)) == 0)
%!test
%! assert(checkdiet(ones(3,3),[1;0;0],0.5*ones(3,1)) == 1)


%!test
%! assert(checkdiet(ones(0,0),[1;0;0],0.5*ones(3,1)) == 0)
%!test
%! assert(checkdiet(ones(4,4),[1;0;0],0.5*ones(4,1)) == 1)