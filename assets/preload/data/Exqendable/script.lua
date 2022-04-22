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
    setScrollFactor('Bendyfade', 0.62, 0.62)
    scaleObject('BendyFade',10,10)
    makeAnimatedLuaSprite('BendyFade2', 'Bendy/BendyFade2', -800, -500)
    addAnimationByPrefix('BendyFade2', 'fading2', 'fade2', 12, false)
    setScrollFactor('Bendyfade2', 0.62, 0.62)
    scaleObject('BendyFade2',10,10)
end

    beatHitFuncs = {
        
        }
    stepHitFuncs = {
        [399] = function()
	   addLuaSprite('BG2',false)
	   end,

	[410] = function()
	  addLuaSprite('BG3',false)
	  end,

	[413] = function()
	  removeLuaSprite('BG3',false)
	  end,

	[430] = function()
	  removeLuaSprite('BG2',false)
	  end,

	[446] = function()
	  addLuaSprite('BG3',false)
	  end,

	[450] = function()
	  removeLuaSprite('BG3',false)
	  end,

        [452] = function()
	   addLuaSprite('BG2',false)
	   end,

	[454] = function()
	  addLuaSprite('BG3',false)
	  end,

	[456] = function()
	  removeLuaSprite('BG2',false)
	  removeLuaSprite('BG3',false)
	  end,

	[458] = function()
	  addLuaSprite('BG3',false)  
	  end,

	[474] = function()
	  removeLuaSprite('BG3',false)
	  end,

	[476] = function()
	  addLuaSprite('BG2',false)
	  addChromaticAbberationEffect('BG2')
	  end,

	[496] = function()
	  addLuaSprite('BG3',false)
	  addGlitchEffect('BG3')
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


