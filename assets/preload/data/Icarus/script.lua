local keepScroll = false

function onCreate()
    addLuaScript('bendyfont')
end

beatHitFuncs = {
    [518] = function()
    noteTweenX('play0', 4, 580, 0.7, 'linear')
	noteTweenX('play1', 5, 580, 0.7, 'linear')
	noteTweenX('play2', 6, 580, 0.7, 'linear')
	noteTweenX('play3', 7, 580, 0.7, 'linear')
end,

}

stepHitFuncs = {

    [1312] = function()
    addVCREffect('hud')
    addVCREffect('game')
    end,

    [1568] = function()
        clearEffects('hud')
        clearEffects('game')
    end,

    [2031] = function()
        if boyfriendName == 'toonbf' then
            for i=0,4,1 do
                setPropertyFromGroup('playerStrums', i, 'texture', 'Bendy/NOTE_rings')
            end

            for i = 0, getProperty('unspawnNotes.length')-1 do
                if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/NOTE_rings'); --Change texture
                end
            end
        end
    end,


    [2406] = function()
        if boyfriendName == 'toonbf' then
            for i=0,4,1 do
                setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets')
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets'); --Change texture
                end
            end
        end
    end,
 

    
    [2414] = function()
        noteTweenX('play0', 4, 415, 7, 'linear')
        noteTweenX('play1', 5, 525, 7, 'linear')
        noteTweenX('play2', 6, 635, 7, 'linear')
        noteTweenX('play3', 7, 745, 7, 'linear')
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
