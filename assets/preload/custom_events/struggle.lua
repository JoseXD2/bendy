-- Event notes hooks

local bfDodge = false;
local bfShootDodge = false;
local Struggling = false;
local StruggleLevel = 0

function onUpdate(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not bfShootDodge then
        bfDodge = true;
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and bfShootDodge then
        characterPlayAnim('boyfriend', 'dodge', true);
        setProperty('boyfriend.specialAnim', true);
        setProperty('camGame.alpha', getProperty('camGame.alpha') + 0.2) 
        StruggleLevel = StruggleLevel - 1
    end

    if StruggleLevel == 5 and Struggling then 
        setProperty('health', getProperty('health') - 3)
        setProperty('camGame.alpha', getProperty('camGame.alpha'), 0) 
    end
end

function onEvent(name, value1, value2)
    if name == 'struggle' then
        addLuaSprite('ALERT', true)
        setProperty('ALERT.alpha', 1)
        bfDodge = false;
        bfShootDodge = true;
        Struggling = true;
        runTimer('struggle', value1)
    end
    --debugPrint('Event triggered: ', name, duration, targetAlpha);
end

function onTimerCompleted(popuptimer)
    -- A loop from a timer you called has been completed, value "tag" is it's tag
    -- loops = how many loops it will have done when it ends completely
    -- loopsLeft = how many are remaining
    if popuptimer == 'struggle' then
        if bfDodge == true then
            setProperty('ALERT.alpha', 0)
            bfShootDodge = false
            Struggling = false;
        elseif bfDodge == false then
            characterPlayAnim('boyfriend', 'hurt', true);
            setProperty('boyfriend.specialAnim', true);
            setProperty('ALERT.alpha', 0)
            bfShootDodge = false
            Struggling = false;
        end
    end
end

function onCreate()
    bfShootDodge = false
    makeAnimatedLuaSprite('ALERT', 'spacebar_icon', 0, 0)
    luaSpriteAddAnimationByPrefix('ALERT', 'ALERT', 'spacebar', 48, true)
    setObjectCamera('ALERT', 'camHUD')
    scaleObject('ALERT', 0.7, 0.7)
    screenCenter('ALERT', 'x')
    screenCenter('ALERT', 'y')
end

function onBeatHit()
    if Struggling then 
        StruggleLevel = StruggleLevel + 1
        setProperty('camGame.alpha', getProperty('camGame.alpha') - 0.2) 
    end
end