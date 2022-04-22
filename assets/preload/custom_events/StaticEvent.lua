function onCreate() -- Add The Flicker

	makeAnimatedLuaSprite('StaticEvent', 'Bendy/StaticEvent', 0, 0)
	
	-- Properties
	setScrollFactor('StaticEvent', 0, 0)
	scaleObject('StaticEvent', 2.7, 2.7)
	
	-- Animations
	addAnimationByPrefix('StaticEvent', 'Static2', 'Static2', 24, true)
	objectPlayAnimation('Static2', true)
	setScrollFactor('StaticEvent', 0,0);
	setObjectCamera('StaticEvent', 'hud')
end

function onEvent(name, value1, value2)
	if name == 'StaticEvent' then
	setProperty('StaticEvent.visible', true)
	addLuaSprite('StaticEvent', true)
    runTimer('Going', tonumber(value1))
	end
end
	
function onTimerCompleted(tag, loops, loopsLeft)
	setProperty('StaticEvent.visible', false)
	end