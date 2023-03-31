local ts_utils = require('nvim-treesitter.ts_utils')

local function getNameOfNode(node)
  local IDENT = 'identifier';
  for i=0, node:named_child_count() do
    local n = node:named_child(i);
    if (n:type() == IDENT) then
      local name = ts_utils.get_node_text(n)[1]
      return name;
    end
  end
end

local function getClassName(node)
  local CD = "class_definition";
  local expr = node;
  while expr do
      local type = expr:type()
      if type == CD then
          break
      end
      expr = expr:parent()
  end
  if not expr then return nil end
  return getNameOfNode(expr);
end

local function getFunName(node)
  local FB = 'function_body';
  local RS = 'return_statement';
  local MS = 'method_signature';
  local FS = 'function_signature';

  local expr = node
  local isInReturn = false;
  local isInFunctionSig = false;

  while expr do
      local type = expr:type()
      if type == FS then
        isInFunctionSig = true;
      end
      if type == RS then
        isInReturn = true;
      end;
      if type == FB or type == FS then
          break
      end
      expr = expr:parent()
  end
  if not expr then return '' end
  local function_sig = expr;
  if (expr:type() == FB) then
    function_sig = expr:prev_sibling();
    if function_sig:type() == MS then
        function_sig = function_sig:child(0)
    end;
  end

  if function_sig:type() ~= FS then error(function_sig) end
  return getNameOfNode(function_sig), isInReturn, isInFunctionSig;
end

local function getLspData()
  local current_node = ts_utils.get_node_at_cursor();
  local current_node_text = ts_utils.get_node_text(current_node)[1];
  if not current_node then error("") end
  local funName, isInReturn, isInFunctionSig = getFunName(current_node);
  local className = getClassName(current_node);
  return funName, isInReturn, isInFunctionSig, current_node_text, className;
end

local function goToReturn(bufnr)
  local lineNum = -1;
  vim.api.nvim_buf_call(bufnr, function()
    lineNum = vim.fn.search('return', 'b');
  end)
  return lineNum;
end

local function goToNextChar(bufnr, char)
  local lineNum = -1;
  vim.api.nvim_buf_call(bufnr, function()
    lineNum = vim.fn.search(char, 'e');
  end)
  return lineNum;
end

local function getLineOfNextChar(bufnr, char)
  local lineNum = -1;
  vim.api.nvim_buf_call(bufnr, function()
    lineNum = vim.fn.search(char, 'n');
  end)
  return vim.fn.getline(lineNum);
end

local function getDebugPrint(indent_nr, fnName, varName, className)
  local i=""
  while i:len() < indent_nr do i = i.." " end;
  local cn;
  if className == nil then
    cn =''
  else
    cn = className .. ' | '
  end;
  local fn;
  if fnName == '' then
    fn =''
  else
    fn = fnName .. ' | '
  end;
  return i .. "debugPrint('" .. cn .. fn .. varName .. '=$' ..varName.."');";
end

function Echo_caca()
  local fn, isInRet, isInFunctionSig, var, className = getLspData();
  local bufnr = vim.api.nvim_get_current_buf();
  if (isInRet) then
    local retLineNum = goToReturn(bufnr)
    local indent_nr = vim.fn.indent(retLineNum);
    local debug = getDebugPrint(indent_nr, fn, var, className);
    vim.fn.appendbufline(bufnr, retLineNum-1, debug);
    return
  end
  local lineNum;
  if fn == '' then
    linenum = goToNextChar(bufnr, ';')
    isInFunctionSig = true;
  end
  if isInFunctionSig then
    lineNum = goToNextChar(bufnr, '{')
  else
    lineNum = goToNextChar(bufnr, ';');
  end
  local line = vim.fn.nextnonblank(lineNum+1);
  local indent_nr = vim.fn.indent(line)
  local debug = getDebugPrint(indent_nr, fn, var, className);
  vim.fn.appendbufline(bufnr, lineNum, debug);
end
