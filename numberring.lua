-- zr-tex8r氏作
local numbers = {}
-- 節番号のスタイル
local number_styles = {
  function() return ("第%s章"):format(numbers[1]) end;
  function() return ("第%s節"):format(numbers[2]) end;
  function() return ("第%s項"):format(numbers[3]) end;
}

function Header(el)
  -- 子カウンタをリセット
  if numbers[el.level+1] then
    numbers[el.level+1] = 0
  end
  -- .unnumbered なら変更しない
  if el.classes:includes("unnumbered") then
    return -- 変更しない
  end
  -- カウンタをインクリメント
  numbers[el.level] = (numbers[el.level] or 0) + 1
  -- 番号を生成し'number'属性に設定する
  el.attributes['number'] = number_styles[el.level]()
  return el
end