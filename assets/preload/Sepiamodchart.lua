function onCreate()
    if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		downscroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		downscroll = false;
	end

addLuaScript('bendyfont')
end

beatHitFuncs = {

[170] = function()
if downscroll == true then 
setPropertyFromGroup('playerStrums', 1,  'downScroll', false)
setPropertyFromGroup('playerStrums', 2,  'downScroll', false)
noteTweenY('play3', 5, 150, 0.1, 'quartInOut')
noteTweenY('play1', 6, 150, 0.1, 'quartInOut')
noteTweenY('play0', 7, 500, 0.1, 'quartInOut')
noteTweenY('play2', 4, 500, 0.1, 'quartInOut')
elseif downscroll == false then
setPropertyFromGroup('playerStrums', 0,  'downScroll', true)
setPropertyFromGroup('playerStrums', 3,  'downScroll', true)
noteTweenY('play3', 5, 150, 0.1, 'quartInOut')
noteTweenY('play1', 6, 150, 0.1, 'quartInOut')
noteTweenY('play0', 7, 500, 0.1, 'quartInOut')
noteTweenY('play2', 4, 500, 0.1, 'quartInOut')
end
end,

[298] = function()
    if downscroll == true then 
        setPropertyFromGroup('playerStrums', 1,  'downScroll', true)
        setPropertyFromGroup('playerStrums', 2,  'downScroll', true)
        setPropertyFromGroup('playerStrums', 0,  'downScroll', false)
        setPropertyFromGroup('playerStrums', 3,  'downScroll', false)
        noteTweenY('play3', 7, 225, 0.1, 'quartInOut')
        noteTweenY('play1', 4, 225, 0.1, 'quartInOut')
        noteTweenY('play0', 5, 225, 0.1, 'quartInOut')
        noteTweenY('play2', 6, 225, 0.1, 'quartInOut')
        elseif downscroll == false then
        setPropertyFromGroup('playerStrums', 1,  'downScroll', false)
        setPropertyFromGroup('playerStrums', 2,  'downScroll', false)
        setPropertyFromGroup('playerStrums', 0,  'downScroll', true)
        setPropertyFromGroup('playerStrums', 3,  'downScroll', true)
        noteTweenY('play3', 7, 225, 0.1, 'quartInOut')
        noteTweenY('play1', 4, 225, 0.1, 'quartInOut')
        noteTweenY('play0', 5, 225, 0.1, 'quartInOut')
        noteTweenY('play2', 6, 225, 0.1, 'quartInOut')
        end
end,

}



function onBeatHit()
    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
    end 
end