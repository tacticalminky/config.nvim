-- [[ Utility Functions ]]
--
-- Used throughtout my configs

local utils = {}

-- returns the merge tables t1 and t2 merged
function utils.merge_tables(t1, t2)
  for key, val in pairs(t2) do
    t1[key] = val
  end
  return t1
end

return utils
