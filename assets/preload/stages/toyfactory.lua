local angleshit = 1;
local anglevar = 1;
function onCreate()
	makeLuaSprite('bg','Bendy/HTbackbackground',-280, -100)
	scaleObject('bg', 0.5, 0.5);
	addLuaSprite('bg',false)

	makeLuaSprite('sign','Bendy/HTsign',-280, -100)
	scaleObject('sign', 0.5, 0.5)
	addLuaSprite('sign',false)

	makeLuaSprite('floor','Bendy/HTfloor',-280, -100)
	scaleObject('floor', 0.5, 0.5)
	addLuaSprite('floor',false)
end

function onGameOverStart()
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
        
        for x = 1, 1 do
            value = math.random(4)
            startVideo(value)
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
			stopVideo(value)
		end
    end
end