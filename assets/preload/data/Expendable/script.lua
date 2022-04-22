local allowCountdown = false
function onStartCountdown()

end

function onCreate()
    -- Precaching
    addLuaScript('bendyfont')
    addCharacterToList('ink-demon', 'dad');
    addCharacterToList('beastbendy', 'dad');
    makeLuaSprite('BG2', 'Bendy/Bendybackground2', -1175, -825)
    makeLuaSprite('BG3', 'Bendy/Bendybackground3', -1175, -825)
    makeLuaSprite('DimLight', 'Bendy/DimLight', -1175, -825)
    scaleObject('DimLight', 10.0, 10.0)
    makeAnimatedLuaSprite('BendyFade', 'Bendy/BendyFade', -800, -500)
    addAnimationByPrefix('BendyFade', 'fading', 'fade', 6, false)
    setScrollFactor('BendyFade', 0.62, 0.62)
    scaleObject('BendyFade',10,10)
    makeAnimatedLuaSprite('BendyFade2', 'Bendy/BendyFade2', -800, -500)
    addAnimationByPrefix('BendyFade2', 'fading2', 'fade2', 12, false)
    setScrollFactor('BendyFade2', 0.62, 0.62)
    scaleObject('BendyFade2',10,10)
end

beatHitFuncs = {
    [137] = function()
    addLuaSprite('BendyFade',true)
    objectPlayAnimation('BendyFade', 'fade')
    end,

    [361] = function() --361
    addLuaSprite('BendyFade2',true)
    objectPlayAnimation('BendyFade2', 'fade2')
    end,

    [371] = function()
    addLuaSprite('DimLight',true)
    end,
}
stepHitFuncs = {
    [591] = function()
    triggerEvent('Change Character', '1', 'ink-demon')
    addLuaSprite('BG2',false)
    end,

    [1489] = function()
    triggerEvent('Change Character', '1', 'beast_bendy')
    addLuaSprite('BG3',false)
    end,
}
function onBeatHit()
    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
    end 
end

function onStepHit()

	if stepHitFuncs[curStep] then 
		stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
	end 

end


