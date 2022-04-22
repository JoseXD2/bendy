function onEvent(name, value1, value2)
  if name == 'bendoslap' then
characterPlayAnim('bender', 'slap', true)
  setProperty('health', getProperty('health') - (value1));
  end
end